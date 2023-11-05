import Sequelize, { Model } from 'sequelize';

export default class Schedule extends Model {
  static init(sequelize) {
    super.init({
      user_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      car_list_id: {
        type: Sequelize.TEXT,
        defaultValue: '',
      },
      wash_type: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      additional_list_id: {
        type: Sequelize.TEXT,
        defaultValue: '',
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
      credit_card_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      washer_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      status: {
        type: Sequelize.ENUM('not-assign', 'not-started', 'started', 'finished',),
        defaultValue: 0,
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
