/* eslint-disable no-param-reassign */
import Sequelize, { Model } from 'sequelize';
import Cryptr from 'cryptr';

const cryptr = new Cryptr(process.env.STRIPE_CRYPT_THREE);

export default class Paymentschedule extends Model {
  static init(sequelize) {
    super.init({
      wash_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      card_id: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      three: {
        type: Sequelize.STRING,
        defaultValue: '',
      },
      three_hash: {
        type: Sequelize.STRING,
        defaultValue: '',
      },
    }, {
      sequelize,
    });

    this.addHook('beforeSave', async (payment) => {
      if (payment.three) {
        payment.three_hash = await cryptr.encrypt(payment.three);
      }
    });

    return this;
  }

  getCardThree() {
    return cryptr.decrypt(this.three_hash);
  }
}
