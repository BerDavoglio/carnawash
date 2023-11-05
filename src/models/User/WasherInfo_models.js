import Sequelize, { Model } from 'sequelize';

export default class WasherInfo extends Model {
  static init(sequelize) {
    super.init({
      user_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      rate: {
        type: Sequelize.FLOAT,
        defaultValue: 0,
      },
      abn: {
        type: Sequelize.STRING,
        defaultValue: '',
      },
      driver_licence: {
        type: Sequelize.BLOB('long'),
        defaultValue: '',
      },
      picture: {
        type: Sequelize.BLOB('long'),
        defaultValue: '',
      },
    }, {
      sequelize,
    });

    return this;
  }
}
