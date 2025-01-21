// main.ts
import { createApp } from 'vue'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
import App from './App.vue'

const app = createApp(App)
app.component(
  // 注册的名字
  'Aside'
)
app.use(ElementPlus)
app.mount('#app')