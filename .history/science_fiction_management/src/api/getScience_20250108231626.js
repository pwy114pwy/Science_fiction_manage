import {Get_Science} from '@/base_api/index'
export const  getScience = async (data) => {
  try {
    const response = await fetch(Get_Science, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body:JSON.stringify(data)
    });
    console.log(response)
    if (!response.ok) {
      // throw new Error('Network response was not ok');
      let {error}=await response.json()
      return { success: false,error:error  };
    }
    return response.json()

    // return await response.json();
  } catch (error) {
    console.error('Error during login:', error);
    throw error; // Re-throw the error to be handled by the caller
  }
};