import {Get_Disscuss} from '@/base_api/index'
export const  getDiscuss = async () => {
  try {
    const response = await fetch(Get_Disscuss, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json'
      },
    });

    if (!response.ok) {
      throw new Error('Network response was not ok');
    }

    return await response.json();
  } catch (error) {
    console.error('Error during login:', error);
    throw error; // Re-throw the error to be handled by the caller
  }
};