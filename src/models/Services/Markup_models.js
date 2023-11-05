import Sequelize, { Model } from 'sequelize';

export default class Markup extends Model {
  static init(sequelize) {
    super.init({
      washer_porcentage: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      carnawash_porcentage: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
    }, {
      sequelize,
    });

    return this;
  }
}
