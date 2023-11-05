import Sequelize, { Model } from 'sequelize';

export default class SentNotification extends Model {
  static init(sequelize) {
    super.init({
      notification_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      user_type_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
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
