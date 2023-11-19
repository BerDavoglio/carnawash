/* eslint-disable no-param-reassign */
import Sequelize, { Model } from 'sequelize';
import Cryptr from 'cryptr';

const cryptr = new Cryptr(process.env.STRIPE_CRYPT);

export default class Paymentcard extends Model {
  static init(sequelize) {
    super.init({
      user_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      name: {
        type: Sequelize.STRING,
        defaultValue: '',
      },
      last_digits: {
        type: Sequelize.STRING,
        defaultValue: '',
      },
      card: {
        type: Sequelize.STRING,
        defaultValue: '',
      },
      card_hash: {
        type: Sequelize.STRING,
        defaultValue: '',
      },
      date: {
        type: Sequelize.STRING,
        defaultValue: '',
      },
    }, {
      sequelize,
    });

    this.addHook('beforeSave', async (credit) => {
      credit.last_digits = credit.card.slice(-4);
      if (credit.card) {
        credit.card_hash = await cryptr.encrypt(credit.card);
      }
    });

    return this;
  }

  getCardNumber() {
    return cryptr.decrypt(this.card_hash);
  }
}
