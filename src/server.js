/* eslint-disable no-console */
import app from './app';
import User from './models/User/User_models';
import Couponbanner from './models/Coupon/CouponBanner_models';
import Condition from './models/FaqTerms/Condition_models';
import Markup from './models/Services/Markup_models';
import Carsize from './models/Services/CarSize_models';
import Additionalservice from './models/Services/AdditionalService_models';
import Autopayment from './models/Payment/Autopayment_models';

const { execSync } = require('child_process');

app.listen(process.env.APP_PORT, async () => {
  try {
    await execSync('npx sequelize db:migrate');
  } catch (e) {
    console.log('Server already has been migrated');
  }

  const user = await User.findByPk(1);
  if (!user) {
    await User.create({
      name: 'admin',
      email: 'admin@gmail.com',
      address: 'rua admin, 123',
      phone: '41900000000',
      role: 'admin',
      subrole: 'admin',
      password: 'admin123',
    });
  } else {
    console.log('Admin already has been created');
  }
  const client = await User.findByPk(2);
  if (!client) {
    await User.create({
      name: 'client',
      email: 'client@gmail.com',
      address: 'av client, 123',
      phone: '41900000000',
      role: 'client',
      subrole: null,
      password: 'client123',
    });
  } else {
    console.log('Client already has been created');
  }
  const washer = await User.findByPk(3);
  if (!washer) {
    await User.create({
      name: 'washer',
      email: 'washer@gmail.com',
      address: 'av washer, 123',
      phone: '41900000000',
      role: 'washer',
      subrole: null,
      password: 'washer123',
    });
  } else {
    console.log('Washer already has been created');
  }

  const banner = await Couponbanner.findByPk(1);
  if (!banner) {
    await Couponbanner.create({
      code: 'CARNA10',
      discount: 10,
      is_disabled: false,
    });
  } else {
    console.log('Couponbanner already has been created');
  }

  const conditions = await Condition.findByPk(1);
  if (!conditions) {
    await Condition.create({
      tems_conditions: 'Terms and Conditions',
    });
  } else {
    console.log('Terms and Conditions already has been created');
  }

  const markup = await Markup.findByPk(1);
  if (!markup) {
    await Markup.create({
      washer_porcentage: 80,
      carnawash_porcentage: 20,
    });
  } else {
    console.log('Markup already has been created');
  }

  const size = await Carsize.findOne({
    where: {
      title: 'Small'
    }
  });
  if (!size) {
    await Carsize.create({
      title: 'Small',
      price: 40,
      additional_information: 'Its small'
    });
  } else {
    console.log('Carsize Small already has been created');
  }

  const addon = await Additionalservice.findOne({
    where: {
      title: 'Pet Hair'
    }
  });
  if (!addon) {
    await Additionalservice.create({
      title: 'Pet Hair',
      price: 15,
    });
  } else {
    console.log('Additionalservice Pet Hair already has been created');
  }

  const autopayment = await Autopayment.findByPk(1);
  if (!autopayment) {
    await Autopayment.create({
      selected_date: null,
    });
  } else {
    console.log('Autopayment has been created');
  }

  // UMA VEZ NO DIA, VERIFICA OS REGULAR WASHS
  // UMA VEZ NO DIA, VERIFICA O AUTOPAYMENT
  // UMA VEZ NO DIA, LANÇAR NOTIFICAÇÃO PROGRAMADA

  console.log('Started!');
});
