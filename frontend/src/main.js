import Vue from 'vue'
import App from './App.vue'
import store from './store'
import VueRouter from 'vue-router';
import Main from "./components/Main";
import Gallery from "./components/Gallery.vue";
import Author from "./components/Author";
import Exhibitions from "./components/Exhibitions";
import Feedback from "./components/Feedback";
import Theses from "./components/Theses";
import Press from "./components/Press";
import MethodicalWork from "./components/MethodicalWork";

Vue.use(VueRouter);

const routes = [
  { path: '/', component: Main},
  { path: '/about-author', component: Author},
  { path: '/gallery', component: Gallery},
  { path: '/exhibitions', component: Exhibitions},
  { path: '/theses', component: Theses},
  { path: '/press', component: Press},
  { path: '/methodical-works', component: MethodicalWork},
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
