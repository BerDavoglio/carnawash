import Sequelize, { Model } from 'sequelize';

export default class Faq extends Model {
  static init(sequelize) {
    super.init({
      question: {
        type: Sequelize.TEXT,
        defaultValue: '',
      },
      answer: {
        type: Sequelize.TEXT,
        defaultValue: '',
      },
    }, {
      sequelize,
    });

    return this;
  }
}
