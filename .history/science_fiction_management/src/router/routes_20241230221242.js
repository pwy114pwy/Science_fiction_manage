
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
        component: () => import('@/components/BigScreen.vue'),
        name: "大屏",
        meta: {
          title: '大屏',
          hidden: true,
        }
      },
    ]
  },


]