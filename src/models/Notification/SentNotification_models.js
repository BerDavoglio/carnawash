import Sequelize, { Model } from 'sequelize';

export default class Sentnotification extends Model {
  static init(sequelize) {
    super.init({
      notification_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      user_type: {
        type: Sequelize.STRING,
        defaultValue: '',
      },
      user_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
    }, {
      sequelize,
    });

    return this;
  }
}
