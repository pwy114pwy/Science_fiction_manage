import {Add_User} from '@/base_api/index'
export const  addUse = async (data) => {
  try {
    const response = await fetch(Add_User, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body:data
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