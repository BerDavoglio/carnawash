import Sequelize, { Model } from 'sequelize';

export default class Additionalservice extends Model {
  static init(sequelize) {
    super.init({
      title: {
        type: Sequelize.STRING,
        defaultValue: '',
      },
      price: {
        type: Sequelize.FLOAT,
        defaultValue: 0,
      },
    }, {
      sequelize,
    });

    return this;
  }
}
