import Vue from 'vue'
import App from './App.vue'
import store from './store'
import VueRouter from 'vue-router';
import Main from "./components/Main";
import Gallery from "./components/Gallery.vue";
import Author from "./components/Author";
import Exhibitions from "./components/Exhibitions";
import Feedback from "./components/Feedback";

Vue.use(VueRouter);

const routes = [
  { path: '/', component: Main},
  { path: '/about-author', component: Author},
  { path: '/gallery', component: Gallery},
  { path: '/exhibitions', component: Exhibitions},
  { path: '/feedback', component: Feedback}
];

const router = new VueRouter({
  routes,
  mode: 'history'
});

new Vue({
  store,
  router,
  render: h => h(App),
}).$mount('#app');
