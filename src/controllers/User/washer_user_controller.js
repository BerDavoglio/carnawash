import User from '../../models/User/User_models';
import Washerinfo from '../../models/User/WasherInfo_models';
import Bankinfo from '../../models/User/BankInfo_models';
import Timeavailable from '../../models/User/TimeAvailable_models';

class WasherUserController {
  async firstLogin(req, res) {
    try {
      const idUser = req.userId;
      if (!idUser) {
        return res.status(400).json({ errors: 'ID not Found' });
      }
      const user = await User.findByPk(idUser);
      if (!user) {
        return res.status(400).json({ errors: 'User not Found' });
      }

      await Washerinfo.create({
        user_id: idUser,
        rate: 0,
        made_quiz: false,
        enable: false,
        contract_accept: false,
        abn: req.body.washer_info.abn,
        contract: req.body.washer_info.contract,
        driver_licence: req.body.washer_info.driver_licence,
        picture: req.body.washer_info.picture,
      });

      await Bankinfo.create({
        user_id: idUser,
        bank_name: req.body.bank_info.bank_name,
        account_name: req.body.bank_info.account_name,
        account_number: req.body.bank_info.account_number,
      });

      await Timeavailable.create({
        user_id: idUser,
        sunday_list: '',
        monday_list: '',
        tuesday_list: '',
        wednesday_list: '',
        thursday_list: '',
        friday_list: '',
        saturday_list: '',
      });

      await user.update({
        first_login: true,
      });

      return res.json({ message: 'First Login with success' });
    } catch (err) {
      return res.status(400).json({ errors: `First Login / ${err.message}` });
    }
  }

  async verifyFirstLogin(req, res) {
    try {
      const idUser = req.userId;
      if (!idUser) {
        return res.status(400).json({ errors: 'ID not Found' });
      }
      const user = await User.findByPk(idUser);
      if (!user) {
        return res.status(400).json({ errors: 'User not Found' });
      }
      if (user.first_login) {
        const washer = await Washerinfo.findOne({
          where: {
            user_id: idUser,
          }
        });
        if (!washer) {
          return res.status(400).json({ errors: 'Washer not Found' });
        }
        if (!washer.made_quiz) {
          return res.json({ message: 1 });
        }
        if (!washer.enable) {
          return res.json({ message: 2 });
        }
        return res.json({ message: 10 });
      }
      return res.json({ message: 0 });
    } catch (err) {
      return res.status(400).json({ errors: `Verify First Login / ${err.message}` });
    }
  }

  async index(req, res) {
    try {
      const id = req.userId;
      if (!id) {
        return res.status(400).json({ errors: 'ID not Found' });
      }

      const washer = await Washerinfo.findOne({
        where: {
          user_id: id,
        }
      });
      if (!washer) {
        return res.status(400).json({ errors: 'Washer not Found' });
      }

      return res.json(washer);
    } catch (err) {
      return res.status(400).json({ errors: `Index Washerinfo / ${err.message}` });
    }
  }

  async indexOne(req, res) {
    try {
      const washer = await Washerinfo.findOne({
        where: {
          user_id: req.params.id,
        }
      });
      if (!washer) {
        return res.status(400).json({ errors: 'Washer not Found' });
      }
      const user = await User.findByPk(washer.user_id);
      if (!user) {
        return res.status(400).json({ errors: 'User not Found' });
      }

      const {
        rate,
      } = washer;
      const {
        name,
      } = user;

      return res.json({
        name,
        rate,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Index Washerinfo / ${err.message}` });
    }
  }

  async update(req, res) {
    try {
      const idReq = req.userId;
      if (!idReq) {
        return res.status(400).json({ errors: 'ID not Found' });
      }

      const washer = await Washerinfo.findOne({
        where: {
          user_id: idReq,
        }
      });
      if (!washer) {
        return res.status(400).json({ errors: 'Washer not Found' });
      }

      const updateWasher = await washer.update(req.body);

      return res.json(updateWasher);
    } catch (err) {
      return res.status(400).json({ errors: `Update Washerinfo / ${err.message}` });
    }
  }

  async bankIndex(req, res) {
    try {
      const idReq = req.userId;
      if (!idReq) {
        return res.status(400).json({ errors: 'ID not Found' });
      }

      const bank = await Bankinfo.findOne({
        where: {
          user_id: idReq,
        }
      });
      if (!bank) {
        return res.status(400).json({ errors: 'Bank Info not Found' });
      }

      const {
        id,
        user_id,
        bank_name,
        account_name,
        account_number,
      } = bank;

      return res.json({
        id,
        user_id,
        bank_name,
        account_name,
        account_number,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Index Bankinfo / ${err.message}` });
    }
  }

  async bankUpdate(req, res) {
    try {
      const idReq = req.userId;
      if (!idReq) {
        return res.status(400).json({ errors: 'ID not Found' });
      }

      const bank = await Bankinfo.findOne({
        where: {
          user_id: idReq,
        }
      });
      if (!bank) {
        return res.status(400).json({ errors: 'Washer not Found' });
      }

      const updateBank = await bank.update(req.body);

      const {
        id,
        user_id,
        bank_name,
        account_name,
        account_number,
      } = updateBank;

      return res.json({
        id,
        user_id,
        bank_name,
        account_name,
        account_number,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Update Bankinfo / ${err.message}` });
    }
  }

  async timeIndex(req, res) {
    try {
      const idReq = req.userId;
      if (!idReq) {
        return res.status(400).json({ errors: 'ID not Found' });
      }

      const time = await Timeavailable.findOne({
        where: {
          user_id: idReq,
        }
      });
      if (!time) {
        return res.status(400).json({ errors: 'Time Available not Found' });
      }

      const {
        id,
        user_id,
        sunday_list,
        monday_list,
        tuesday_list,
        wednesday_list,
        thursday_list,
        friday_list,
        saturday_list,
      } = time;

      return res.json({
        id,
        user_id,
        sunday_list,
        monday_list,
        tuesday_list,
        wednesday_list,
        thursday_list,
        friday_list,
        saturday_list,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Index Timeavailable / ${err.message}` });
    }
  }

  async timeUpdate(req, res) {
    try {
      const idReq = req.userId;
      if (!idReq) {
        return res.status(400).json({ errors: 'ID not Found' });
      }

      const time = await Timeavailable.findOne({
        where: {
          user_id: idReq,
        }
      });
      if (!time) {
        return res.status(400).json({ errors: 'Washer not Found' });
      }

      const updateTime = await time.update(req.body);

      const {
        id,
        user_id,
        sunday_list,
        monday_list,
        tuesday_list,
        wednesday_list,
        thursday_list,
        friday_list,
        saturday_list,
      } = updateTime;

      return res.json({
        id,
        user_id,
        sunday_list,
        monday_list,
        tuesday_list,
        wednesday_list,
        thursday_list,
        friday_list,
        saturday_list,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Update Timeavailable / ${err.message}` });
    }
  }
}

export default new WasherUserController();
