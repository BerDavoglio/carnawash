import Sequelize, { Model } from 'sequelize';

export default class Referedfriend extends Model {
  static init(sequelize) {
    super.init({
      user_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      emails: {
        type: Sequelize.STRING,
        defaultValue: '',
      },
    }, {
      sequelize,
    });

    return this;
  }
}
