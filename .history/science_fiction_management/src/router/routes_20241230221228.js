
//对外暴露路由
export const constantRout = [
  {
    path: '/index',
    component: () => import('@/components/Index.vue'),
    name: "index",
    meta: {
      title: '首页',
      hidden: true,
    },
    children: [
      {
        path: '/bigScreen',
        component: () => import('@/components/UserInfo.vue'),
        name: "dap",
        meta: {
          title: '用户信息',
          hidden: true,
        }
      },
    ]
  },


]