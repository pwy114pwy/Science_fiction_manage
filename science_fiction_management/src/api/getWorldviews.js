import {Get_Worldviews} from '@/base_api/index'
export const  getWorldviews = async (data) => {
  try {
    const response = await fetch(Get_Worldviews, {
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
    return response.json()

    // return await response.json();
  } catch (error) {
    console.error('Error during login:', error);
    throw error; // Re-throw the error to be handled by the caller
  }
};