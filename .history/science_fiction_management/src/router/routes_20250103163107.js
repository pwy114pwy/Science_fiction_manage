
//对外暴露路由
export const constantRout = [
  
  {
    path: '/Index',
    // redirect:'/bigScreen',
    component: () => import('@/components/Index.vue'),
    name: "index",
    meta: {
      title: '首页',
      hidden: true,
    },
    children: [
      {
        path: '/bigScreen',
        component: () => import('@/components/BigScreen.vue'),
        name: "大屏",
        meta: {
          title: '大屏',
          hidden: true,
        }
      },
      {
        path: '/bookManage',
        component: () => import('@/components/BookManage.vue'),
        name: "书籍列表",
        meta: {
          title: '书籍列表',
          hidden: true,
        }
      },
      {
        path: '/userManage',
        component: () => import('@/components/UserManage.vue'),
        name: "用户列表",
        meta: {
          title: '用户列表',
          hidden: true,
        }
      },
    ]
  },
  


]