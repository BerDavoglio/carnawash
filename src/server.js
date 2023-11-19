/* eslint-disable no-console */
import app from './app';
import User from './models/User/User_models';

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

  // UMA VEZ NO DIA, VERIFICA OS REGULAR WASHS

  console.log('Started!');
});
