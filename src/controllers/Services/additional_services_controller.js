import Additionalservice from '../../models/Services/AdditionalService_models';

class AdditionalservicesController {
  async store(req, res) {
    try {
      const newAdd = await Additionalservice.create(req.body);

      const {
        id,
        title,
        price,
      } = newAdd;

      return res.json({
        id,
        title,
        price,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Create Additional Service / ${err.message}` });
    }
  }

  async show(req, res) {
    try {
      const additionals = await Additionalservice.findAll();

      return res.json(additionals);
    } catch (err) {
      return res.status(400).json({ errors: `Show Additional Service / ${err.message}` });
    }
  }

  async update(req, res) {
    try {
      const additional = await Additionalservice.findByPk(req.params.id);
      if (!additional) {
        return res.status(400).json({ errors: ['Additional Service not found'] });
      }

      const updateAdditional = await additional.update(req.body);

      const {
        id,
        title,
        price,
      } = updateAdditional;

      return res.json({
        id,
        title,
        price,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Update Additional Service / ${err.message}` });
    }
  }

  async delete(req, res) {
    try {
      const additional = await Additionalservice.findByPk(req.params.id);
      if (!additional) {
        return res.status(400).json({ errors: ['Additional Service not found'] });
      }

      await additional.delete();

      return res.json({ message: 'Additional Service deleted with success' });
    } catch (err) {
      return res.status(400).json({ errors: `Delete Additional Service / ${err.message}` });
    }
  }
}

export default new AdditionalservicesController();
