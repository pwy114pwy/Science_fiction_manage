
//对外暴露路由
export const constantRout = [

  {
    path: '/',
    component: () => import('@/components/Login.vue'),
    meta: {
      title: '登录',
      hidden: true,
    },
  },
  {
    path: '/index',
    redirect:'/bigScreen',
    component: () => import('@/components/Index.vue'),
    name: "index",
    meta: {
      title: '首页',
      hidden: true,
      requiresAuth: true
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
      {
        path: '/simpleCommentManage',
        component: () => import('@/components/SimpleCommentManage.vue'),
        name: "简评",
        meta: {
          title: '简评',
          hidden: true,
        }
      },
      {
        path: '/Comment',
        component: () => import('@/components/Comment.vue'),
        name: "t",
        meta: {
          title: '用户列表',
          hidden: true,
        }
      },
    ]
  },
  


]