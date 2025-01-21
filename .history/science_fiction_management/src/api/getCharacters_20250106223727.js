import {Get_Characters} from '@/base_api/index'
export const  getCharacters = async (data) => {
  try {
    const response = await fetch(Get_Characters, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body:JSON.stringify(data)
    });
    if (!response.ok) {
      // throw new Error('Network response was not ok');
      let {error}=await response.json()
      return { success: false,error:error  };
    }
    return 
    console.log(await response.json())
    // const { message } = await response.json();
    // return { success: true, message };

    // return await response.json();
  } catch (error) {
    console.error('Error during login:', error);
    throw error; // Re-throw the error to be handled by the caller
  }
};