import Sequelize, { Model } from 'sequelize';

export default class Coupon extends Model {
  static init(sequelize) {
    super.init({
      name: {
        type: Sequelize.STRING,
        defaultValue: '',
      },
      code: {
        type: Sequelize.STRING,
        defaultValue: '',
      },
      discount: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      times_used: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      is_disabled: {
        type: Sequelize.BOOLEAN,
        defaultValue: false,
      },
    }, {
      sequelize,
    });

    return this;
  }
}
