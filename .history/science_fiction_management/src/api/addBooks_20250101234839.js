import {Add_Books} from '@/base_api/index'
export const  addBooks = async (data) => {
  try {
    const response = await fetch(Add_Books, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body
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