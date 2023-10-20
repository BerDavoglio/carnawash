/* eslint-disable camelcase */

import { createApp } from 'vue';

import { createPinia } from 'pinia';
import piniaPluginPersistedState from 'pinia-plugin-persistedstate';

import VueDatePicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css';

import VueSidebarMenu from 'vue-sidebar-menu';
import 'vue-sidebar-menu/dist/vue-sidebar-menu.css';

import { OhVueIcon, addIcons } from 'oh-vue-icons';
import {
  MdArrowback,
  MdLogout,
  BiSearch,
  RiMoneyDollarCircleLine,
  BiStarFill,
  BiStar,
  CoDollar,
  IoAddCircleOutline,
  BiTrash,
  BiDownload,
  MdEditOutlined,
  MdUploadfile,
  BiEyeSlash,
} from 'oh-vue-icons/icons';

import TextClamp from 'vue3-text-clamp';

import router from './router';
import store from './store/store';

import './assets/tailwind.css';
import '@fortawesome/fontawesome-free/css/all.css';
import '@fortawesome/fontawesome-free/js/all';

import App from './App.vue';

const pinia = createPinia();
pinia.use(piniaPluginPersistedState);

addIcons(
  MdArrowback,
  MdLogout,
  BiSearch,
  RiMoneyDollarCircleLine,
  BiStarFill,
  BiStar,
  CoDollar,
  IoAddCircleOutline,
  BiTrash,
  BiDownload,
  MdEditOutlined,
  MdUploadfile,
  BiEyeSlash,
);

createApp(App)
  .use(pinia)
  .use(TextClamp)
  .use(VueSidebarMenu)
  .use(store)
  .use(router)
  .component('v-icon', OhVueIcon)
  .component('VueDatePicker', VueDatePicker)
  .mount('#app');
