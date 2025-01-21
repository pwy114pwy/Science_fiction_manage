import {Get_Wordcloud} from '@/base_api/index'
export const  getWordcloud = async () => {
  try {
    const response = await fetch(Get_Wordcloud, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json'
      },
    });

    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    console.log(await response.json())
    // return await response.json();
  } catch (error) {
    console.error('Error during login:', error);
    throw error; // Re-throw the error to be handled by the caller
  }
};