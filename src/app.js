import express from 'express';
import dotenv from 'dotenv';

import './database';

import userRoutes from './routes/User/user_routes';
import jwtRoutes from './routes/User/jwt_routes';
import carRoutes from './routes/Car/car_routes';
import couponRoutes from './routes/Coupon/coupon_routes';
import faqTermsRoutes from './routes/FaqTerms/faq_terms_routes';
import notificationRoutes from './routes/Notification/notification_routes';
import paymentRoutes from './routes/Payment/payment_routes';
import quizRoutes from './routes/Quiz/quiz_routes';
import scheduleRoutes from './routes/Schedule/schedule_routes';
import servicesRoutes from './routes/Services/services_routes';

dotenv.config();

class App {
  constructor() {
    this.app = express();
    this.middlewares();
    this.routes();
  }

  middlewares() {
    this.app.use(express.urlencoded({ extended: true }));
    this.app.use(express.json());
    this.app.use((req, res, next) => {
      res.header('Access-Control-Allow-Origin', '*');
      next();
    });
  }

  routes() {
    this.app.use('/users/', userRoutes);
    this.app.use('/jwt/', jwtRoutes);
    this.app.use('/cars/', carRoutes);
    this.app.use('/coupons/', couponRoutes);
    this.app.use('/faq-terms/', faqTermsRoutes);
    this.app.use('/notification/', notificationRoutes);
    this.app.use('/payment/', paymentRoutes);
    this.app.use('/quiz/', quizRoutes);
    this.app.use('/schedule/', scheduleRoutes);
    this.app.use('/services/', servicesRoutes);
  }
}

export default new App().app;
