import Sequelize, { Model } from 'sequelize';

export default class Notification extends Model {
  static init(sequelize) {
    super.init({
      title: {
        type: Sequelize.STRING,
        defaultValue: '',
      },
      destined_to_list: {
        type: Sequelize.TEXT,
        defaultValue: '',
      },
      type: {
        type: Sequelize.INTEGER,
        defaultValue: '',
      },
    }, {
      sequelize,
    });

    return this;
  }
}
