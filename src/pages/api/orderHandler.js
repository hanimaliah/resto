import { postOrder, getBill } from './orderService';

// Example order for MEJA NO 1
const order = {
    tableNumber: 'MEJA NO 1',
    items: [
        { productName: 'Jeruk', variant: 'DINGIN', quantity: 1 },
        { productName: 'Kopi', variant: 'PANAS', quantity: 1 },
        { productName: 'Nasi Goreng + Jeruk Dingin', quantity: 2 },
        { productName: 'Teh', variant: 'MANIS', quantity: 1 },
        { productName: 'Mie', variant: 'GORENG', quantity: 1 }
    ]
};

// Post order and print bill
const handleOrder = async () => {
    try {
        const orderResponse = await postOrder(order);
        console.log('Order Response:', orderResponse);

        const billResponse = await getBill(order.tableNumber);
        console.log('Bill Response:', billResponse);
    } catch (error) {
        console.error('Error handling order:', error);
    }
};

handleOrder();
