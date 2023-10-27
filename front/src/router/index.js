import { createRouter, createWebHistory } from 'vue-router';
import HomeView from '../views/HomeView.vue';
import LoginView from '../views/LoginView.vue';
import FAQView from '../views/FAQView.vue';
import MyAccountView from '../views/MyAccountView.vue';
import UserManagementView from '../views/UserManagementView.vue';
import ReportsView from '../views/ReportsView.vue';
import ServicesView from '../views/ServicesView.vue';
import FinanceView from '../views/FinanceView.vue';
import OrdersView from '../views/OrdersView.vue';
import QuizView from '../views/QuizView.vue';
import NotificationsView from '../views/NotificationsView.vue';
import CouponsView from '../views/CouponsView.vue';

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
  {
    path: '/finance/',
    name: 'finance',
    component: FinanceView,
  },
  {
    path: '/orders/',
    name: 'orders',
    component: OrdersView,
  },
  {
    path: '/training/',
    name: 'training',
    component: QuizView,
  },
  {
    path: '/notifications/',
    name: 'notifications',
    component: NotificationsView,
  },
  {
    path: '/coupons/',
    name: 'coupons',
    component: CouponsView,
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
