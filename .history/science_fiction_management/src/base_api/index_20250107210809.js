// src/api.js

export const BASE_URL = 'http://127.0.0.1:3000/api'; // 基础 API 地址
// export const BASE_URL = 'http://43c497bb.r11.vip.cpolar.cn/api'; // 基础 API 地址


//登录的api
export const Login = `${BASE_URL}/user/login`;

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

//获取简评的api
export const Get_SimpleComment = `${BASE_URL}/getComment`;

//删除简评的api
export const Del_SimpleComment = `${BASE_URL}/DeleteBookComment`;


//获取讨论的api
export const Get_Disscuss = `${BASE_URL}/getAllDiscussion`;

//删除讨论的api
export const Del_Disscuss = `${BASE_URL}/deleteDiscussion`;

//获取作者的api
export const Get_Authors = `${BASE_URL}/getAllAuthors`;

//添加作者的api
export const Add_Author = `${BASE_URL}/AddAuthor`;

//删除作者的api
export const Del_Author = `${BASE_URL}/DelAuthor`;

//获取图鉴的api
export const Get_Illustrated = `${BASE_URL}/getAllIllustrated`;

//添加图鉴的api
export const Add_Illustrated = `${BASE_URL}/AddIllustrated`;

//删除图鉴的api
export const Del_Illustrated = `${BASE_URL}/DelIllustrated`;

//获取人物的api
export const Get_Characters = `${BASE_URL}/getCharacters`;

//添加人物的api
export const Add_Character = `${BASE_URL}/AddCharacter`;

//删除人物的api
export const Add_Character = `${BASE_URL}/Delcharacter`;

