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
import Picture from "./components/Picture";
import MainAqua from "./components/MainAqua";
import MainBatik from "./components/MainBatik";
import MainSha from "./components/MainSha";
import Checkout from "./components/Checkout";
import Verification from "./components/Verification";

Vue.use(VueRouter);

const routes = [
  { path: '/', component: Main},
  { path: '/aqua-page', component: MainAqua},
  { path: '/batik-page', component: MainBatik},
  { path: '/sha-page', component: MainSha},
  { path: '/about-author', component: Author},
  { path: '/gallery', component: Gallery},
  { path: '/gallery/picture', name: 'Picture', component: Picture},
  { path: '/gallery/picture/checkout', name: 'Checkout', component: Checkout},
  { path: '/gallery/picture/checkout/verification', name: 'Verification', component: Verification},
  { path: '/exhibitions', component: Exhibitions},
  { path: '/theses', component: Theses},
  { path: '/press', component: Press},
  { path: '/methodical-works', component: MethodicalWork},
  { path: '/feedback', name: 'Feedback', component: Feedback}
];

const router = new VueRouter({
  routes,
  mode: 'history'
});

Vue.config.productionTip = false;

new Vue({
  store,
  router,
  render: h => h(App),
}).$mount('#app');
