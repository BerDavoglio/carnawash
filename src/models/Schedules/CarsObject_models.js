import Sequelize, { Model } from 'sequelize';

export default class CarsObjects extends Model {
  static init(sequelize) {
    super.init({
      car_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      wash_type: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      additional_list_id: {
        type: Sequelize.TEXT,
        defaultValue: '',
      },
    }, {
      sequelize,
    });

    return this;
  }
}
