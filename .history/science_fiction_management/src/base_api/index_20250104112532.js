// src/api.js

export const BASE_URL = 'http://127.0.0.1:3000/api'; // 基础 API 地址
// export const BASE_URL = 'http://49d2eada.r11.vip.cpolar.cn/api'; // 基础 API 地址


//获取所有书籍的api
export const Get_Books = `${BASE_URL}/getAllBooks`;

//添加书籍的api
export const Add_Books = `${BASE_URL}/AddBook`;

//删除书籍的api
export const Del_Books = `${BASE_URL}/DelBook`;

//获取用户的api
export const Get_Users = `${BASE_URL}/user/getAllUser`;

//添加用户的api
export const Add_User = `${BASE_URL}/user/register`;

//删除用户的api
export const Del_User = `${BASE_URL}/user/delete`;

//更新用户的api
export const Update_User = `${BASE_URL}/user/change_userinfo`;

//的api
export const Update_User = `${BASE_URL}/user/change_userinfo`;

