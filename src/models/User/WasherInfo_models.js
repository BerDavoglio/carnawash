import Sequelize, { Model } from 'sequelize';

export default class WasherInfo extends Model {
  static init(sequelize) {
    super.init({
      user_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      made_quiz: {
        type: Sequelize.BOOLEAN,
        defaultValue: false,
      },
      contract_accept: {
        type: Sequelize.BOOLEAN,
        defaultValue: false,
      },
      enable: {
        type: Sequelize.BOOLEAN,
        defaultValue: false,
      },
      rate: {
        type: Sequelize.FLOAT,
        defaultValue: 0,
      },
      abn: {
        type: Sequelize.STRING,
        defaultValue: '',
      },
      contract: {
        type: Sequelize.BLOB('long'),
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
