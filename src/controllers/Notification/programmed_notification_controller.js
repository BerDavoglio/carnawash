import Programmednotification from '../../models/Notification/Programmednotification_models';

class ProgrammedNotificationController {
  async showProgrammed(req, res) {
    try {
      const not = await Programmednotification.findByPk(req.params.id);
      if (!not) {
        return res.status(400).json({ errors: 'ProgrammedNotification not Found' });
      }

      return res.json(not);
    } catch (err) {
      return res.status(400).json({ errors: `Show Notification / ${err.message}` });
    }
  }

  async updateProgrammed(req, res) {
    try {
      const not = await Programmednotification.findByPk(req.params.id);
      if (!not) {
        return res.status(400).json({ errors: 'ProgrammedNotification not Found' });
      }

      const updateNotification = await not.update(req.body);

      return res.json(updateNotification);
    } catch (err) {
      return res.status(400).json({ errors: `Update Notification / ${err.message}` });
    }
  }
}

export default new ProgrammedNotificationController();
