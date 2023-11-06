import Sequelize, { Model } from 'sequelize';

export default class QuizResponse extends Model {
  static init(sequelize) {
    super.init({
      user_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      question_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      responses_list: {
        type: Sequelize.TEXT,
        defaultValue: '',
      },
    }, {
      sequelize,
    });

    return this;
  }
}
