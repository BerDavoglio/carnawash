import User from '../../../models/User/User_models';
import Washerinfo from '../../../models/User/WasherInfo_models';
import Bankinfo from '../../../models/User/BankInfo_models';

class AdminWasherController {
  async showWashers(req, res) {
    try {
      const washers = User.findAll({
        where: {
          role: 'washer'
        }
      });

      const info = Washerinfo.findAll()

      return res.json([washers, info]);
    } catch (err) {
      return res.status(400).json({ errors: `Show Admin Washers / ${err.message}` });
    }
  }

  async updateWashers(req, res) {
    try {
      const washer = User.findByPk(req.params.id);
      if (!washer) {
        return res.status(400).json({ errors: 'Washer not Found' });
      };

      const info = Washerinfo.findOne({
        where: {
          user_id: req.params.id
        }
      });
      if (!info) {
        return res.status(400).json({ errors: 'Washerinfo not Found' });
      };

      washer.update(req.body.washer);
      info.update(req.body.info);

      return res.json({ message: 'Washer updated with success' });
    } catch (err) {
      return res.status(400).json({ errors: `Update Admin Washer / ${err.message}` });
    }
  }

  async showBank(req, res) {
    try {
      const bank = Bankinfo.findOne({
        where: {
          user_id: req.params.id
        }
      });
      if (!bank) {
        return res.status(400).json({ errors: 'Bank not Found' });
      };

      return res.json(bank);
    } catch (err) {
      return res.status(400).json({ errors: `Show Admin Washer Bank / ${err.message}` });
    }
  }

  async updateBank(req, res) {
    try {
      const bank = Bankinfo.findOne({
        where: {
          user_id: req.params.id
        }
      });
      if (!bank) {
        return res.status(400).json({ errors: 'Bank not Found' });
      };

      bank.update(req.body);
    } catch (err) {
      return res.status(400).json({ errors: `Update Admin Washer Bank / ${err.message}` });
    }
  }
}

export default new AdminWasherController();
