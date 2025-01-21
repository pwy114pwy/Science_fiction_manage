import {Login} from '@/base_api/index'
export const  login = async (data) => {
  try {
    const response = await fetch(Login, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body:JSON.stringify(data)
    });
    if (!response.ok) {
      // 如果响应不是 ok，尝试解析错误信息
      const errorData = await response.json().catch(() => ({}));
      throw new Error(errorData.error || '登录失败，请检查用户名和密码');
    }
    
    
    const { message,user,tok } = await response.json();
    return { success: true, message,user };

    // return await response.json();
  } catch (error) {
    console.error('Error during login:', error);
    throw error; // Re-throw the error to be handled by the caller
  }
};