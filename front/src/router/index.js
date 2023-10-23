import { createRouter, createWebHistory } from 'vue-router';
import HomeView from '../views/HomeView.vue';
import LoginView from '../views/LoginView.vue';
import FAQView from '../views/FAQView.vue';
import MyAccountView from '../views/MyAccountView.vue';
import UserManagementView from '../views/UserManagementView.vue';
import ReportsView from '../views/ReportsView.vue';
import ServicesView from '../views/ServicesView.vue';

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView,
  },
  {
    path: '/login/',
    name: 'login',
    component: LoginView,
  },
  {
    path: '/faq/',
    name: 'faq',
    component: FAQView,
  },
  {
    path: '/account/',
    name: 'account',
    component: MyAccountView,
  },
  {
    path: '/management/',
    name: 'management',
    component: UserManagementView,
  },
  {
    path: '/reports/',
    name: 'reports',
    component: ReportsView,
  },
  {
    path: '/services/',
    name: 'services',
    component: ServicesView,
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

router.beforeEach((to, from, next) => {
  document.title = `CarWash | ${to.name.charAt(0).toUpperCase() + to.name.slice(1)}`;
  next();
});

export default router;
