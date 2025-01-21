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
export default router