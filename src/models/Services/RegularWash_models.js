import Sequelize, { Model } from 'sequelize';

export default class Regularwash extends Model {
  static init(sequelize) {
    super.init({
      car_size: {
        type: Sequelize.STRING,
        defaultValue: 0,
      },
      price: {
        type: Sequelize.FLOAT,
        defaultValue: 0,
      },
      additional_services: {
        type: Sequelize.TEXT,
        defaultValue: '',
      },
    }, {
      sequelize,
    });

    return this;
  }
}
