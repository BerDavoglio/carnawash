import Sequelize, { Model } from 'sequelize';

export default class Programmednotification extends Model {
  static init(sequelize) {
    super.init({
      title: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      selected_date: {
        type: Sequelize.DATE,
        defaultValue: new Date,
      },
    }, {
      sequelize,
    });

    return this;
  }
}
