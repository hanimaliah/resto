import axios from 'axios';

const API_URL = 'https://example.com/api';

export const postOrder = async (order) => {
    try {
        const response = await axios.post(`${API_URL}/orders`, order);
        return response.data;
    } catch (error) {
        console.error('Error posting order:', error);
        throw error;
    }
};

export const getBill = async (tableNumber) => {
    try {
        const response = await axios.get(`${API_URL}/bill/${tableNumber}`);
        return response.data;
    } catch (error) {
        console.error('Error getting bill:', error);
        throw error;
    }
};
