import {Del_SimpleComment} from '@/base_api/index'
export const  delU = async (data) => {
  try {
    const response = await fetch(Del_User, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body:JSON.stringify(data)
    });

    if (!response.ok) {
      throw new Error('Network response was not ok');
    } 
    const { message } = await response.json();
    return { success: true, message };

    // return await response.json();
  } catch (error) {
    console.error('Error during login:', error);
    throw error; // Re-throw the error to be handled by the caller
  }
};