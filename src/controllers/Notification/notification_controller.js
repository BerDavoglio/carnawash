import User from '../../models/User/User_models';
import Notification from '../../models/Notification/Notification_models';

class NotificationController {
  async store(req, res) {
    try {
      const newNotification = await Notification.create(req.body);

      const {
        id,
        title,
        destined_to,
        type,
      } = newNotification;

      return res.json({
        id,
        title,
        destined_to,
        type,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Create Notification / ${err.message}` });
    }
  }

  async show(req, res) {
    try {
      const notifications = await Notification.findAll();

      return res.json(notifications);
    } catch (err) {
      return res.status(400).json({ errors: `Show Notification / ${err.message}` });
    }
  }

  async showUser(req, res) {
    try {
      const id = req.userId;
      if (!id) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }
      const user = await User.findByPk(id);
      if (!user) {
        return res.status(400).json({ errors: ['User not Found'] });
      }

      const notifications = await Notification.findAll({
        where: {
          destined_to: user.role
        }
      });

      return res.json(notifications);
    } catch (err) {
      return res.status(400).json({ errors: `Show Notification / ${err.message}` });
    }
  }

  async update(req, res) {
    try {
      const notification = await Notification.findByPk(req.params.id);
      if (!notification) {
        return res.status(400).json({ errors: ['Notification not found'] });
      }

      const updateNotification = await notification.update(req.body);

      const {
        id,
        title,
        destined_to,
        type,
      } = updateNotification;

      return res.json({
        id,
        title,
        destined_to,
        type,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Update Notification / ${err.message}` });
    }
  }

  async delete(req, res) {
    try {
      const notification = await Notification.findByPk(req.params.id);
      if (!notification) {
        return res.status(400).json({ errors: ['Notification not found'] });
      }

      await notification.destroy();

      return res.json({ message: 'Notification deleted with success' });
    } catch (err) {
      return res.status(400).json({ errors: `Delete Notification / ${err.message}` });
    }
  }
}

export default new NotificationController();
