import db from "../../lib/dbPostgre";

export default async function handler(req, res) {
  if (req.method !== 'POST') {
    return res.status(405).json({
      metadata: {
        code: 405,
        message: 'Method Not Allowed!',
      }
    });
  }

  const { name_order, order_time, table, orders } = req.body;

  if (!name_order || !order_time || !table || !orders) {
    return res.status(400).json({
      metadata: {
        message: 'Parameter Tidak Lengkap',
        code: 400
      }
    });
  }

  const combineItems = (items) => {
    const combined = {};
    items.forEach(item => {
      const key = `${item.product_id}_${item.variant}`;
      if (combined[key]) {
        combined[key].quantity += item.quantity;
      } else {
        combined[key] = { ...item };
      }
    });
    return Object.values(combined);
  };

  try {
    const meja = await db
      .select('table_id')
      .from('meja')
      .where({ table_number: table })
      .first();

    if (!meja) {
      return res.status(404).json({
        metadata: {
          message: 'Table Not Found',
          code: 404
        }
      });
    }

    const tableId = meja.table_id;

    let order = await db
      .select('order_id')
      .from('orders')
      .where({
        table_id: tableId,
        order_time: order_time,
        name: name_order
      })
      .first();

    let orderId;

    if (!order) {
      const [input_order] = await db("orders")
        .insert({
          table_id: tableId,
          order_time: order_time,
          name: name_order
        })
        .returning('order_id');
      orderId = input_order.order_id;
    } else {
      orderId = order.order_id;
    }

    let printerB = { order_id: orderId, table_number: tableId, items: [] };
    let printerC = { order_id: orderId, table_number: tableId, items: [] };

    for (const item of orders) {
      const product = await db
        .select('product_id', 'category_id', 'promo_id', 'variant')
        .from('products')
        .where({
          product_name: item.product_name,
          variant: item.variant
        })
        .first();

      if (product) {
        const productId = parseInt(product.product_id, 10);
        const quantity = parseInt(item.quantity, 10);

        const cekOrderItem = await db
          .select('order_id')
          .from('orderitems')
          .where({
            order_id: orderId,
            product_id: productId
          })
          .first();

        if (cekOrderItem) {
          await db("orderitems")
            .where({
              order_id: orderId,
              product_id: productId
            })
            .update({ quantity });
        } else {
          await db("orderitems").insert({
            order_id: orderId,
            product_id: productId,
            quantity
          });
        }

        if (product.category_id === 1) {
          printerB.items.push({ product_id: product.product_id, product_name: item.product_name, variant: product.variant, quantity });
        } else if (product.category_id === 2) {
          printerC.items.push({ product_id: product.product_id, product_name: item.product_name, variant: product.variant, quantity });
        } else if (product.category_id === 3) {
          const queryData = `SELECT
            dp.promo_id,
            p.product_id,
            p.product_name,
            p.variant,
            p.category_id
          FROM
            detail_promo dp
          JOIN products p ON p.product_id = dp.product_id
          WHERE
            dp.promo_id = ${product.promo_id}`;

          const promoProducts = await db.raw(queryData);

          for (const promoProduct of promoProducts.rows) {
            if (promoProduct.category_id === 1) {
              printerB.items.push({ product_id: promoProduct.product_id, product_name: promoProduct.product_name, variant: promoProduct.variant, quantity });
            } else if (promoProduct.category_id === 2) {
              printerC.items.push({ product_id: promoProduct.product_id, product_name: promoProduct.product_name, variant: promoProduct.variant, quantity });
            }
          }
        }

      } else {
        await db("orderitems").where({ order_id: orderId }).del();
        return res.status(404).json({ error: `Product not found: ${item.product_name}` });
      }
    }

    printerB.items = combineItems(printerB.items);
    printerC.items = combineItems(printerC.items);

    res.status(200).json({ printerB, printerC });

  } catch (error) {
    console.error('Error:', error);
    res.status(500).json({ error: error.message });
  }
}
