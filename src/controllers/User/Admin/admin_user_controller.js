import User from '../../../models/User/User_models';
import Usertype from '../../../models/User/UserType_models';

class AdminUserController {
  async showAdmins(req, res) {
    try {
      const admins = await User.findAll({
        where: {
          role: 'admin',
        },
      });

      return res.json(admins);
    } catch (err) {
      return res.status(400).json({ errors: `Show Admin / ${err.message}` });
    }
  }

  async changeRole(req, res) {
    try {
      const user = await User.findByPk(req.params.id);
      if (!user) {
        return res.status(400).json({ errors: ['User not found'] });
      }

      user.update({
        role: req.body.role,
      });

      return res.json({ message: ['Role changed with success'] });
    } catch (err) {
      return res.status(400).json({ errors: `Show Admin / ${err.message}` });
    }
  }

  async changeSubrole(req, res) {
    try {
      const user = await User.findByPk(req.params.id);
      if (!user) {
        return res.status(400).json({ errors: ['User not found'] });
      }

      user.update({
        subrole: req.body.subrole,
      });

      return res.json({ message: ['Subrole changed with success'] });
    } catch (err) {
      return res.status(400).json({ errors: `Show Admin / ${err.message}` });
    }
  }

  async userTypeStore(req, res) {
    try {
      const newType = await Usertype.create({
        name: req.body.name,
        pages_enable_list: '',
        enable: false,
      });

      const {
        id,
        name,
        pages_enable_list,
        enable,
      } = newType;

      return res.json({
        id,
        name,
        pages_enable_list,
        enable,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Create Usertype Admin / ${err.message}` });
    }
  }

  async userTypeShow(req, res) {
    try {
      const types = await Usertype.findAll();

      return res.json(types);
    } catch (err) {
      return res.status(400).json({ errors: `Show Usertype Admin / ${err.message}` });
    }
  }

  async userTypeUpdate(req, res) {
    try {
      const type = await Usertype.findByPk(req.params.id);
      if (!type) {
        return res.status(400).json({ errors: ['User Type not found'] });
      }

      const updateType = await type.update(req.body);

      const {
        id,
        name,
        pages_enable_list,
        enable,
      } = updateType;

      return res.json({
        id,
        name,
        pages_enable_list,
        enable,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Update Usertype Admin / ${err.message}` });
    }
  }

  async userTypeDelete(req, res) {
    try {
      const type = await Usertype.findByPk(req.params.id);
      if (!type) {
        return res.status(400).json({ errors: ['User Type not found'] });
      }

      const users = await User.findAll({
        where: {
          role: type.name,
        }
      })
      if (users) {
        return res.status(400).json({ errors: ["Can't delete this Usertype, there is some Users using"] });
      }

      await type.delete();

      return res.json({ message: 'User Type deleted with success' });
    } catch (err) {
      return res.status(400).json({ errors: `Delete Usertype Admin / ${err.message}` });
    }
  }
}

export default new AdminUserController();
