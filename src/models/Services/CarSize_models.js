import Sequelize, { Model } from 'sequelize';

export default class Carsize extends Model {
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
      additional_information: {
        type: Sequelize.TEXT,
        defaultValue: '',
      },
    }, {
      sequelize,
    });

    return this;
  }
}
