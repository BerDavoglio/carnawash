/* eslint-disable camelcase */

import { createApp } from 'vue';

import { createPinia } from 'pinia';
import piniaPluginPersistedState from 'pinia-plugin-persistedstate';

import VueDatePicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css';

import { OhVueIcon, addIcons } from 'oh-vue-icons';
import {
  GiHamburgerMenu,
  IoCloseSharp,
} from 'oh-vue-icons/icons';

import TextClamp from 'vue3-text-clamp';

import router from './router';
import store from './store/store';

import './assets/tailwind.css';

import App from './App.vue';

const pinia = createPinia();
pinia.use(piniaPluginPersistedState);

addIcons(
  GiHamburgerMenu,
  IoCloseSharp,
);

createApp(App)
  .use(pinia)
  .use(store)
  .use(TextClamp)
  .use(router)
  .component('v-icon', OhVueIcon)
  .component('VueDatePicker', VueDatePicker)
  .mount('#app');
