import Sequelize, { Model } from 'sequelize';

export default class Bankinfo extends Model {
  static init(sequelize) {
    super.init({
      user_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      bank_name: {
        type: Sequelize.STRING,
        defaultValue: '',
      },
      account_name: {
        type: Sequelize.STRING,
        defaultValue: '',
      },
      account_number: {
        type: Sequelize.STRING,
        defaultValue: '',
      },
    }, {
      sequelize,
    });

    return this;
  }
}
