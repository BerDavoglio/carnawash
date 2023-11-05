import Sequelize, { Model } from 'sequelize';

export default class Condition extends Model {
  static init(sequelize) {
    super.init({
      tems_conditions: {
        type: Sequelize.TEXT,
        defaultValue: '',
      },
    }, {
      sequelize,
    });

    return this;
  }
}
