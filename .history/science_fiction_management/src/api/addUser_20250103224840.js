import { Add_User, Update_User } from '@/base_api/index'
export const addUser = async (data, state) => {
  let url
  if (state == "update") {
    url = Update_User
  } else {
    url = Add_User
  }
  log
  try {
    const response = await fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data)
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