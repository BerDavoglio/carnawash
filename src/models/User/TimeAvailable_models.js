import Sequelize, { Model } from 'sequelize';

export default class Timeavailable extends Model {
  static init(sequelize) {
    super.init({
      user_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      sunday_list: {
        type: Sequelize.TEXT,
        defaultValue: '',
      },
      monday_list: {
        type: Sequelize.TEXT,
        defaultValue: '',
      },
      tuesday_list: {
        type: Sequelize.TEXT,
        defaultValue: '',
      },
      wednesday_list: {
        type: Sequelize.TEXT,
        defaultValue: '',
      },
      thursday_list: {
        type: Sequelize.TEXT,
        defaultValue: '',
      },
      friday_list: {
        type: Sequelize.TEXT,
        defaultValue: '',
      },
      saturday_list: {
        type: Sequelize.TEXT,
        defaultValue: '',
      },
    }, {
      sequelize,
    });

    return this;
  }
}
