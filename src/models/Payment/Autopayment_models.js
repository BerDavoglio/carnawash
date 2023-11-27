import Sequelize, { Model } from 'sequelize';

export default class Autopayment extends Model {
  static init(sequelize) {
    super.init({
      selected_date: {
        type: Sequelize.DATE,
      },
    }, {
      sequelize,
    });

    return this;
  }
}
