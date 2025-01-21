export const constantRoutes = [
  {
    path: '/',
    component: () => import('@/components/Login.vue'),
    meta: { title: '登录', hidden: true },
  },
  {
    path: '/index',
    component: () => import('@/components/Index.vue'),
    name: 'index',
    meta: { title: '首页', hidden: true },
    redirect: 'index/bigScreen', // 设置默认子路由
    children: [
      {
        path: 'bigScreen',
        component: () => import('@/components/BigScreen.vue'),
        name: 'bigScreen',
        meta: { title: '大屏', hidden: true }
      },
      {
        path: 'bookManage',
        component: () => import('@/components/BookManage.vue'),
        name: 'bookManage',
        meta: { title: '书籍列表', hidden: true }
      },
      {
        path: 'userManage',
        component: () => import('@/components/UserManage.vue'),
        name: 'userManage',
        meta: { title: '用户列表', hidden: true }
      },
    ]
  }
];