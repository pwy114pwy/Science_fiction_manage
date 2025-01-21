import {Add_User,Update_User} from '@/base_api/index'
export const  addUser = async (data,state) => {
  console.log(Add_User)
  let url
  if(state=="update"){
    url=Update_User
  }
  let response
  try {
    if(state=="update"){
      response = await fetch(Update_User, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body:JSON.stringify(data)
      });
    }else{
      response = await fetch(Add_User, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body:JSON.stringify(data)
      });
    }
    console.log(response);
    
    

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