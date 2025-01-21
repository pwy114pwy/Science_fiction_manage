import {Get_Books} from '@/base_api/index'
export const  getBooks = async () => {
  try {
    const response = await fetch(Get_Books, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json'
      },
      body:fo
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