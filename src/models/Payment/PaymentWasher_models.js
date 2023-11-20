import Sequelize, { Model } from 'sequelize';

export default class Paymentwasher extends Model {
  static init(sequelize) {
    super.init({
      washer_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      wash_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      wash_date: {
        type: Sequelize.DATE,
        defaultValue: null,
      },
      pay_data: {
        type: Sequelize.DATE,
        defaultValue: null,
      },
    }, {
      sequelize,
    });

    return this;
  }
}
