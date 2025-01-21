import {Add_Books} from '@/base_api/index'
export const  Books = async (data) => {
  try {
    const response = await fetch('http://127.0.0.1:3000/api/user/getAllUser', {
      method: 'GEt', // 指定请求方法
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${localStorage.getItem('token')}` // 在这里添加授权令牌
      }
    })

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