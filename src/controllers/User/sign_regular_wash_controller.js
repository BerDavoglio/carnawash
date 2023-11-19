import Signregularwash from '../../models/User/SignRegularWash_models';

class SignregularwashController {
  async newRegular(req, res) {
    try {
      const idUser = req.userId;
      if (!idUser) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }
      if (req.userRole != 'client') {
        return res.status(400).json({ errors: ['User not Client'] });
      }

      // const regular = await Signregularwash.findOne({
      //   where: {
      //     user_id: idUser,
      //   }
      // });
      // if (regular) {
      //   if (!regular.is_broken) {
      //     // VER OQ FAZ
      //     return res.status(400).json({ errors: ['This client already has a Regular Wash active'] });
      //   }
      //   if (regular.is_broken) {
      //     // VER OQ FAZ
      //     return res.status(400).json({ errors: ['This client have broken a Regular Wash'] });
      //   }
      // }

      const newRegular = await Signregularwash.create({
        user_id: idUser,
        init_date: req.body.init_date,
        date_to_date: req.body.date_to_date,
        is_broken: false,
      });

      const {
        id,
        user_id,
        init_date,
        date_to_date,
        is_broken,
      } = newRegular;

      return res.json({
        id,
        user_id,
        init_date,
        date_to_date,
        is_broken,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Create Sign Regular Wash / ${err.message}` });
    }
  }

  async indexRegular(req, res) {
    try {
      const idUser = req.userId;
      if (!idUser) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const regular = await Signregularwash.findOne({
        where: {
          user_id: idUser,
        }
      });
      if (!regular) {
        return res.status(400).json({ errors: ['Regular Wash not Found'] });
      }

      return res.json(regular);
    } catch (err) {
      return res.status(400).json({ errors: `Index Sign Regular Wash / ${err.message}` });
    }
  }
}

export default new SignregularwashController();
