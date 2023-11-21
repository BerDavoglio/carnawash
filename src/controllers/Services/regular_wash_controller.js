import Regularwash from '../../models/Services/RegularWash_models';

class RegularwashController {
  async store(req, res) {
    try {
      const newRegular = await Regularwash.create(req.body);

      const {
        id,
        car_size,
        price,
        additional_services,
      } = newRegular;

      return res.json({
        id,
        car_size,
        price,
        additional_services,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Create Regular Wash / ${err.message}` });
    }
  }

  async show(req, res) {
    try {
      const regulars = await Regularwash.findAll();

      return res.json(regulars);
    } catch (err) {
      return res.status(400).json({ errors: `Show Regular Wash / ${err.message}` });
    }
  }

  async update(req, res) {
    try {
      const regular = await Regularwash.findByPk(req.params.id);
      if (!regular) {
        return res.status(400).json({ errors: 'Regular Wash not found' });
      }

      const updateRegular = await regular.update(req.body);

      const {
        id,
        car_size,
        price,
        additional_services,
      } = updateRegular;

      return res.json({
        id,
        car_size,
        price,
        additional_services,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Update Regular Wash / ${err.message}` });
    }
  }

  async delete(req, res) {
    try {
      const regular = await Regularwash.findByPk(req.params.id);
      if (!regular) {
        return res.status(400).json({ errors: 'Regular Wash not found' });
      }

      await regular.destroy();

      return res.json({ message: 'Regular Wash deleted with success' });
    } catch (err) {
      return res.status(400).json({ errors: `Delete Regular Wash / ${err.message}` });
    }
  }
}

export default new RegularwashController();
