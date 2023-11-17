import Sequelize, { Model } from 'sequelize';

export default class Schedule extends Model {
  static init(sequelize) {
    super.init({
      user_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      cars_list_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      selected_date: {
        type: Sequelize.DATE,
        defaultValue: new Date(),
      },
      address: {
        type: Sequelize.TEXT,
        defaultValue: '',
      },
      observation_address: {
        type: Sequelize.TEXT,
        defaultValue: '',
      },
      coupon_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      payment_schedule_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      washer_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      status: {
        type: Sequelize.ENUM('not-assign', 'not-started', 'started', 'finished', 'cancel'),
        defaultValue: 'not-assign',
      },
      rate: {
        type: Sequelize.FLOAT,
        defaultValue: 0,
      },
    }, {
      sequelize,
    });

    return this;
  }
}
