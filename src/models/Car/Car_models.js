import Sequelize, { Model } from 'sequelize';

export default class Car extends Model {
  static init(sequelize) {
    super.init({
      user_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      brand: {
        type: Sequelize.STRING,
        defaultValue: '',
      },
      model: {
        type: Sequelize.STRING,
        defaultValue: '',
      },
      color: {
        type: Sequelize.STRING,
        defaultValue: '',
      },
      plate: {
        type: Sequelize.STRING,
        defaultValue: '',
      },
      car_size_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
    }, {
      sequelize,
    });

    return this;
  }
}
