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

  // CREATE COUPONBANNER
  // CREATE TERMS AND CONDITION
  // CREATE MARKUP
  // CREATE REGULAR CAR SIZES
  // CREATE REGULAR ADDITIONALS

  // UMA VEZ NO DIA, VERIFICA OS REGULAR WASHS

  console.log('Started!');
});
