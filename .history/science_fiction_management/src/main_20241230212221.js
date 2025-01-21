// main.ts
import { createApp } from 'vue'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import App from './App.vue'

const app = createApp(App)
app.component(
  // 注册的名字
  'aside',

)
app.use(ElementPlus)
app.mount('#app')