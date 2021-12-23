import Vue from 'vue'
import router from './router'
import App from './App'
import axios from 'axios'
import VueAxios from 'vue-axios'
// import All from './js/all'
Vue.use(VueAxios, axios)
Vue.config.productionTip = false

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')