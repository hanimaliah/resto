import db from "../../lib/dbPostgre";

export default async function handler(req, res) {
    if (req.method !== 'GET') {
        return res.status(405).json({
            metadata: {
                code: 405,
                message: 'Method Not Allowed!',
            }
        });
    }

    if (
        typeof req.query.table_name === 'undefined' ||
        typeof req.query.name_order === 'undefined' 
    ) {
        return res.status(301).json({
            metadata: {
                message: 'Parameter Tidak Lengkap',
                code: 301
            }
        });
    }

    const { table_name, name_order } = req.query;

    try {
        const queryData = `SELECT
                            o.order_id,
                            o.order_time,
                            m.table_number,
                            o.name AS name_order,
                            oi.product_id,
                            p.product_name,
                            p.variant,
                            p.price,
                            oi.quantity,
                            (oi.quantity * p.price) as total
                        FROM
                            orders o
                        INNER JOIN meja m ON m.table_id = o.table_id
                        INNER JOIN orderitems oi on oi.order_id = o.order_id
                        INNER JOIN products p on p.product_id = oi.product_id
                        WHERE
                            m.table_number = '${table_name}' AND o.name = '${name_order}'
                        ORDER BY p.category_id`;
        
        const allData = await db.raw(queryData);

        if (allData.rows.length > 0) {
            const firstRow = allData.rows[0];
            let bill = {
                order_id: firstRow.order_id,
                order_time: firstRow.order_time,
                table_number: firstRow.table_number,
                name_order: firstRow.name_order,
                items: [],
                subtotal: 0
            };

            allData.rows.forEach(item => {
                bill.items.push({
                    product_name: item.product_name,
                    variant: item.variant,
                    quantity: item.quantity,
                    price: parseInt(item.price),
                    total: parseInt(item.total,10)
                });
                bill.subtotal += parseInt(item.total,10);
            });
            // const printerA = [bill
             res.status(200).json({ printerA: bill });
        } else {
            res.status(404).json({
                metadata: {
                    message: 'No Orders Found',
                    code: 404
                }
            });
        }
    } catch (error) {
        console.error('Error:', error);
        res.status(500).json({ 
            metadata: {
                message: 'Internal Server Error',
                code: 500
            }
        });
    }
}
