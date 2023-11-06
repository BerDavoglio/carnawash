import SentNotification from '../../models/Notification/SentNotification_models';

class SentNotificationController {
  async send(req, res) {
    try {
      const newNotification = await SentNotification.create(req.body);

      const {
        id,
        notification_id,
        user_type_id,
        user_id,
      } = newNotification;

      return res.json({
        id,
        notification_id,
        user_type_id,
        user_id,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Sent Notification / ${err.message}` });
    }
  }

  async index(req, res) {
    try {
      const id = userId;
      if (!id) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const notifications = await Notification.findAll({
        where: {
          user_id: id
        }
      });

      return res.json(notifications);
    } catch (err) {
      return res.status(400).json({ errors: `Get Sent Notification / ${err.message}` });
    }
  }

  async show(req, res) {
    try {
      const notifications = await SentNotification.findAll();

      return res.json(notifications);
    } catch (err) {
      return res.status(400).json({ errors: `Show Sent Notification / ${err.message}` });
    }
  }
}

export default new SentNotificationController();
