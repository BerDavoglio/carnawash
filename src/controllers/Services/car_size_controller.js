import Carsize from '../../models/Services/CarSize_models';

class CarsizeController {
  async store(req, res) {
    try {
      const newCarsize = await Carsize.create(req.body);

      const {
        id,
        title,
        price,
        additional_information,
      } = newCarsize;

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
      const carSizes = await Carsize.findAll();

      return res.json(carSizes);
    } catch (err) {
      return res.status(400).json({ errors: `Show Car Size / ${err.message}` });
    }
  }

  async update(req, res) {
    try {
      const carSize = await Carsize.findByPk(req.params.id);
      if (!carSize) {
        return res.status(400).json({ errors: 'Car Size not found' });
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
      const carSize = await Carsize.findByPk(req.params.id);
      if (!carSize) {
        return res.status(400).json({ errors: 'Car Size not found' });
      }

      await carSize.destroy();

      return res.json({ message: 'Car Size deleted with success' });
    } catch (err) {
      return res.status(400).json({ errors: `Delete Car Size / ${err.message}` });
    }
  }
}

export default new CarsizeController();
