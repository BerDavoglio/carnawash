import CarSize from '../../models/Services/CarSize_models';

class CarSizeController {
  async store(req, res) {
    try {
      const newCarSize = await CarSize.create(req.body);

      const {
        id,
        title,
        price,
        additional_information,
      } = newCarSize;

      return res.json({
        id,
        title,
        price,
        additional_information,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Create Car Size / ${err.message}` });
    }
  }

  async show(req, res) {
    try {
      const carSizes = await CarSize.findAll();

      return res.json(carSizes);
    } catch (err) {
      return res.status(400).json({ errors: `Show Car Size / ${err.message}` });
    }
  }

  async update(req, res) {
    try {
      const carSize = await CarSize.findByPk(req.params.id);
      if (!carSize) {
        return res.status(400).json({ errors: ['Car Size not found'] });
      }

      const updateSize = await carSize.update(req.body);

      const {
        id,
        title,
        price,
        additional_information,
      } = updateSize;

      return res.json({
        id,
        title,
        price,
        additional_information,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Update Car Size / ${err.message}` });
    }
  }

  async delete(req, res) {
    try {
      const carSize = await CarSize.findByPk(req.params.id);
      if (!carSize) {
        return res.status(400).json({ errors: ['Car Size not found'] });
      }

      await carSize.delete();

      return res.json({ message: 'Car Size deleted with success' });
    } catch (err) {
      return res.status(400).json({ errors: `Delete Car Size / ${err.message}` });
    }
  }
}

export default new CarSizeController();
