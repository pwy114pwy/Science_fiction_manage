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

//添加更新人物的api
export const Add_Character = `${BASE_URL}/AddCharacter`;

//删除人物的api
export const Del_Character = `${BASE_URL}/Delcharacter`;

//获取关系的api
export const Get_Relationships = `${BASE_URL}/getRelationships`;

//添加更新关系的api
export const Add_Relationship = `${BASE_URL}/AddRelationship`;

//删除关系的api
export const Del_Relationship = `${BASE_URL}/Delrelationship`;

//获取事件的api
export const Get_Events = `${BASE_URL}/getEvents`;

//添加更新事件的api
export const Add_Event = `${BASE_URL}/addEvent`;

//删除事件的api
export const Del_Event = `${BASE_URL}/delEvent`;

//获取世界观的api
export const Get_Worldviews = `${BASE_URL}/getWorldviews`;

//添加更新世界观的api
export const Add_Worldview = `${BASE_URL}/addWorldview`;

//删除世界观的api
export const Del_Worldview = `${BASE_URL}/delWorldview`;

//获取科技的api
export const Get_Science = `${BASE_URL}/getScience`;

//添加科技的api
export const Add_Science = `${BASE_URL}/addScience`;

//删除科技的api
export const Del_Science = `${BASE_URL}/delScience`;

//获取收藏书籍的api
export const Get_AllCollectBook = `${BASE_URL}/getAllCollectBook`;

//获取浏览记录的api
export const Get_AllBrowse = `${BASE_URL}/getAllBrowse`;

//获取书籍评分的api
export const Get_AllRating = `${BASE_URL}/getAllBooks`;

//获取书籍主题的api
export const Get_bookTopic = `${BASE_URL}/getAllBooks`;

//获取词云的api
export const Get_Wordcloud = `${BASE_URL}/getAllBooks`;

//获取词云的api
export const Get_Wordcloud = `${BASE_URL}/getAllBooks`;

