import { createRouter, createWebHashHistory } from "vue-router"
import { constantRout } from '../router/routes'
const router = createRouter({
  history: createWebHashHistory(),
  routes: constantRout,
  scrollBehavior() {
    return {
      left: 0,
      top: 0
    }
  }
})
router.beforeEach((to, from, next) => {
  const publicPages = ['/']; // 允许未登录用户访问的页面
  const authRequired = !publicPages.includes(to.path);
  const loggedIn = isLoggedIn();

  if (authRequired && !loggedIn) {
    next('/'); // 如果需要认证但未登录，则重定向到登录页面
  } else {
    next(); // 继续导航
  }
});
export default router