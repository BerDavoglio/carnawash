import Sequelize, { Model } from 'sequelize';

export default class SignRegularWash extends Model {
  static init(sequelize) {
    super.init({
      user_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      init_date: {
        type: Sequelize.DATE,
        defaultValue: new Date(),
      },
      date_to_date: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      is_broken: {
        type: Sequelize.BOOLEAN,
        defaultValue: false,
      },
    }, {
      sequelize,
    });

    return this;
  }
}
