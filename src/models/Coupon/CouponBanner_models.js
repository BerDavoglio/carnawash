import Sequelize, { Model } from 'sequelize';

export default class Couponbanner extends Model {
  static init(sequelize) {
    super.init({
      code: {
        type: Sequelize.STRING,
        defaultValue: '',
      },
      discount: {
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
