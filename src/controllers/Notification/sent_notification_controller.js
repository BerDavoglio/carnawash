import Sentnotification from '../../models/Notification/SentNotification_models';
import Usertype from '../../models/User/UserType_models';
import User from '../../models/User/User_models';
const { Op } = require("sequelize");

class SentNotificationController {
  async send(req, res) {
    try {
      const newNotification = await Sentnotification.create(req.body);

      const {
        id,
        notification_id,
        user_type,
        user_id,
      } = newNotification;

      return res.json({
        id,
        notification_id,
        user_type,
        user_id,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Sent Notification / ${err.message}` });
    }
  }

  async indexUser(req, res) {
    try {
      const id = req.userId;
      if (!id) {
        return res.status(400).json({ errors: 'ID not Found' });
      }
      const user = await User.findByPk(id);
      if (!user) {
        return res.status(400).json({ errors: 'User not Found' });
      }

      const notifications = await Sentnotification.findAll({
        where: {
          [Op.or]: [{user_type: user.role}, {user_id: id}],
        }
      });

      return res.json(notifications);
    } catch (err) {
      return res.status(400).json({ errors: `Get Sent Notification / ${err.message}` });
    }
  }

  async show(req, res) {
    try {
      const notifications = await Sentnotification.findAll();

      return res.json(notifications);
    } catch (err) {
      return res.status(400).json({ errors: `Show Sent Notification / ${err.message}` });
    }
  }
}

export default new SentNotificationController();
