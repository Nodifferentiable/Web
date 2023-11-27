import Vue from 'vue'
import App from './App.vue'
import router from './router'

Vue.config.productionTip = false
import Element from 'element-ui'
import "element-ui/lib/theme-chalk/index.css"

Vue.use(Element)

import axios from '@/axios'

Vue.prototype.$axios = axios
import utils from "@/utils/utils";

Vue.prototype.$utils = utils

// console.log("环境",process.env.NODE_ENV)
// console.log("服务器",process.env.VUE_APP_SERVER)
// console.log(process.env)

import TestComponent from "@/components/TestComponent";
import CustomPages from "@/components/CustomPages";
import CustomDrawer from "@/components/CustomDrawer";
import CustomEditor from "@/components/CustomEditor";
import CustomCard from "@/components/CustomCard";

Vue.component("TestComponent", TestComponent)
Vue.component("CustomPages", CustomPages)
Vue.component("CustomDrawer", CustomDrawer)
Vue.component("CustomCard", CustomCard)
//全局引入
Vue.component("CustomEditor", CustomEditor)


//@/libs/numFormat
import numFormat from './utils/numFormat';
// 注册金额格式化过滤器
Vue.filter('numFormat', numFormat);

new Vue({
    router,
    render: h => h(App)
}).$mount('#app')
