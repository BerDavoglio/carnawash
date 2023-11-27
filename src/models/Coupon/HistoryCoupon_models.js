import Sequelize, { Model } from 'sequelize';

export default class Historycoupon extends Model {
  static init(sequelize) {
    super.init({
      schedule_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      coupon_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      total: {
        type: Sequelize.FLOAT,
        defaultValue: 0,
      },
    }, {
      sequelize,
    });

    return this;
  }
}
