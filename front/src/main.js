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
  PrUsers,
  PrUserPlus,
  PrUserMinus,
  BiPlusCircle,
  RiShieldStarFill,
  IoRepeatOutline,
  MdKeyboardarrowdown,
  MdKeyboardarrowup,
  HiPrinter,
  LaGetPocket,
  BiSend,
  IoClose,
} from 'oh-vue-icons/icons';

import TextClamp from 'vue3-text-clamp';

import { createVuetify } from 'vuetify';
import * as components from 'vuetify/components';
import * as directives from 'vuetify/directives';

import VCalendar from 'v-calendar';

import router from './router';
import store from './store/store';

import './assets/tailwind.css';
// eslint-disable-next-line import/extensions
import 'vuetify/styles';
import 'v-calendar/style.css';
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
  PrUsers,
  PrUserPlus,
  PrUserMinus,
  BiPlusCircle,
  RiShieldStarFill,
  IoRepeatOutline,
  MdKeyboardarrowdown,
  MdKeyboardarrowup,
  HiPrinter,
  LaGetPocket,
  BiSend,
  IoClose,
);

const vuetify = createVuetify({
  components,
  directives,
});

createApp(App)
  .use(pinia)
  .use(TextClamp)
  .use(VueSidebarMenu)
  .use(store)
  .use(router)
  .use(vuetify)
  .use(VCalendar, {})
  .component('v-icon', OhVueIcon)
  .component('VueDatePicker', VueDatePicker)
  .mount('#app');
