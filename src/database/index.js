/* eslint-disable no-console */
import Sequelize from 'sequelize';
import databaseConfig from '../config/database';

import User from '../models/User/User_models';
import Car from '../models/Car/Car_models';
import Coupon from '../models/Coupon/Coupon_models';
import CouponBanner from '../models/Coupon/CouponBanner_models';
import Faq from '../models/FaqTerms/Faq_models';
import Condition from '../models/FaqTerms/Condition_models';
import Notification from '../models/Notification/Notification_models';
import SentNotification from '../models/Notification/SentNotification_models';
import PaymentCard from '../models/Payment/PaymentCard_models';
import PaymentSchedule from '../models/Payment/PaymentSchedule_models';
import Quiz from '../models/Quiz/Quiz_models';
import QuizResponse from '../models/Quiz/QuizResponse_models';
import Schedule from '../models/Schedules/Schedule_models';
import CarsObject from '../models/Schedules/CarsObject_models';
import AdditionalService from '../models/Services/AdditionalService_models';
import CarSize from '../models/Services/CarSize_models';
import Markup from '../models/Services/Markup_models';
import RegularWash from '../models/Services/RegularWash_models';
import BankInfo from '../models/User/BankInfo_models';
import SignRegularWash from '../models/User/SignRegularWash_models';
import TimeAvailable from '../models/User/TimeAvailable_models';
import UserType from '../models/User/UserType_models';
import WasherInfo from '../models/User/WasherInfo_models';
import ReferedFriends from '../models/User/ReferedFriends_models';

const models = [
  User,
  Car,
  Coupon,
  CouponBanner,
  Faq,
  Condition,
  Notification,
  SentNotification,
  PaymentCard,
  PaymentSchedule,
  Quiz,
  QuizResponse,
  Schedule,
  CarsObject,
  AdditionalService,
  CarSize,
  Markup,
  RegularWash,
  BankInfo,
  SignRegularWash,
  TimeAvailable,
  UserType,
  WasherInfo,
  ReferedFriends,
];
const connection = new Sequelize(databaseConfig);

connection.authenticate()
  .then(() => {
    console.log('Connection Complete');
  })
  .catch(() => {
    console.log('Connection Erro');
  });

models.forEach((model) => model.init(connection));
