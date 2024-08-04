const express = require('express');
const app = express();
app.use(express.json());

app.post('/api/orders', (req, res) => {
    const order = req.body;
    const printers = [];

    order.items.forEach(item => {
        if (['Jeruk', 'Teh', 'Kopi'].includes(item.productName)) {
            printers.push('Printer Bar');
        } else if (['Mie', 'Nasi Goreng'].includes(item.productName)) {
            printers.push('Printer Dapur');
        }
    });

    printers.push('Printer Kasir');

    res.json({
        message: 'Order received and processed.',
        printers: [...new Set(printers)]
    });
});

app.get('/api/bill/:tableNumber', (req, res) => {
    const { tableNumber } = req.params;
    // Logic to get the bill from the database based on tableNumber
    res.json({
        tableNumber: tableNumber,
        totalAmount: 'Calculated Total Amount',
        items: [
            // List of items with prices
        ]
    });
});
