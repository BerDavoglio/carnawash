import Sequelize, { Model } from 'sequelize';

export default class UserType extends Model {
  static init(sequelize) {
    super.init({
      title: {
        type: Sequelize.STRING,
        defaultValue: '',
      },
      pages_enable_list: {
        type: Sequelize.TEXT,
        defaultValue: '',
      },
      enable: {
        type: Sequelize.BOOLEAN,
        defaultValue: true,
      },
    }, {
      sequelize,
    });

    return this;
  }
}
