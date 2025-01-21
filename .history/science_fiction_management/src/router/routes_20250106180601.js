
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
    redirect: '/bigScreen',
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
        path: '/commentManage',
        component: () => import('@/components/CommentManage.vue'),
        name: "讨论",
        meta: {
          title: '讨论',
          hidden: true,
        }
      },
      {
        path: '/authorManage',
        component: () => import('@/components/AuthorManage.vue'),
        name: "作者",
        meta: {
          title: '作者',
          hidden: true,
        }
      },
      {
        path: '/illustratedManage',
        component: () => import('@/components/IllustratedManage.vue'),
        name: "图鉴",
        meta: {
          title: '图鉴',
          hidden: true,
        }
      },
      {
        path: '/illustratedDetail',
        component: () => import('@/components/IllustratedDetail.vue'),
        name: "图鉴详情",
        meta: {
          title: '图鉴详情',
          hidden: true,
        },
        props(route){
          return route.query
        },
        children:[
          
        ]

      }
    ]
  },

]