/* eslint-disable no-console */
import Sequelize from 'sequelize';
import databaseConfig from '../config/database';

import User from '../models/User/User_models';
import Car from '../models/Car/Car_models';
import Coupon from '../models/Coupon/Coupon_models';
import Couponbanner from '../models/Coupon/CouponBanner_models';
import Historycoupon from '../models/Coupon/HistoryCoupon_models';
import Faq from '../models/FaqTerms/Faq_models';
import Condition from '../models/FaqTerms/Condition_models';
import Notification from '../models/Notification/Notification_models';
import Sentnotification from '../models/Notification/SentNotification_models';
import Programmednotification from '../models/Notification/Programmednotification_models';
import Paymentcard from '../models/Payment/PaymentCard_models';
import Paymentschedule from '../models/Payment/PaymentSchedule_models';
import Autopayment from '../models/Payment/Autopayment_models';
import Paymentwasher from '../models/Payment/PaymentWasher_models';
import Quiz from '../models/Quiz/Quiz_models';
import Quizresponse from '../models/Quiz/QuizResponse_models';
import Schedule from '../models/Schedules/Schedule_models';
import Carsobject from '../models/Schedules/CarsObject_models';
import Additionalservice from '../models/Services/AdditionalService_models';
import Carsize from '../models/Services/CarSize_models';
import Markup from '../models/Services/Markup_models';
import Regularwash from '../models/Services/RegularWash_models';
import Bankinfo from '../models/User/BankInfo_models';
import Signregularwash from '../models/User/SignRegularWash_models';
import Timeavailable from '../models/User/TimeAvailable_models';
import Usertype from '../models/User/UserType_models';
import Washerinfo from '../models/User/WasherInfo_models';
import Referedfriend from '../models/User/ReferedFriend_models';

const models = [
  User,
  Car,
  Coupon,
  Couponbanner,
  Historycoupon,
  Faq,
  Condition,
  Notification,
  Sentnotification,
  Paymentcard,
  Paymentschedule,
  Quiz,
  Quizresponse,
  Schedule,
  Carsobject,
  Additionalservice,
  Carsize,
  Markup,
  Regularwash,
  Bankinfo,
  Signregularwash,
  Timeavailable,
  Usertype,
  Washerinfo,
  Referedfriend,
  Autopayment,
  Paymentwasher,
  Programmednotification,
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
