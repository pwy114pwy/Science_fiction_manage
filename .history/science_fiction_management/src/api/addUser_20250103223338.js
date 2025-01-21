import {Add_User} from '@/base_api/index'
export const  addUser = async (data,state) => {
  try {
    if(state=="update"){

    }else{}
    

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