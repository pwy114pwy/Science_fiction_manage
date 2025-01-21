import {Get_AllBrowse} from '@/base_api/index'
export const  getAllCollectBook = async () => {
  try {
    const response = await fetch(Get_AllCollectBook, {
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