import User from '../../../models/User/User_models';
import UserType from '../../../models/User/UserType_models';

class AdminUserController {
  async showAdmins(req, res) {
    try { } catch (err) {
      return res.status(400).json({ errors: `Show Admin / ${err.message}` });
    }
  }

  async changeRole(req, res) {
    try { } catch (err) {
      return res.status(400).json({ errors: `Show Admin / ${err.message}` });
    }
  }

  async userTypeStore(req, res) {
    try {
      const newType = await UserType.create({
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
      return res.status(400).json({ errors: `Create UserType Admin / ${err.message}` });
    }
  }

  async userTypeShow(req, res) {
    try {
      const types = await UserType.findAll();

      return res.json(types);
    } catch (err) {
      return res.status(400).json({ errors: `Show UserType Admin / ${err.message}` });
    }
  }

  async userTypeUpdate(req, res) {
    try {
      const type = await UserType.findByPk(req.params.id);
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
      return res.status(400).json({ errors: `Update UserType Admin / ${err.message}` });
    }
  }

  async userTypeDelete(req, res) {
    try {
      const type = await UserType.findByPk(req.params.id);
      if (!type) {
        return res.status(400).json({ errors: ['User Type not found'] });
      }

      const users = await User.findAll({
        where: {
          role: type.name,
        }
      })
      if (users) {
        return res.status(400).json({ errors: ["Can't delete this UserType, there is some Users using"] });
      }

      await type.delete();

      return res.json({ message: 'User Type deleted with success' });
    } catch (err) {
      return res.status(400).json({ errors: `Delete UserType Admin / ${err.message}` });
    }
  }
}

export default new AdminUserController();
