import Car from '../../models/Car/Car_models';

class CarController {
  async store(req, res) {
    try {
      const idReq = req.userId;
      if (!idReq) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const newCar = await Car.create({
        user_id: idReq,
        brand: req.body.brand,
        model: req.body.model,
        color: req.body.color,
        plate: req.body.plate,
        car_size_id: req.body.car_size_id,
      });

      const {
        id,
        user_id,
        brand,
        model,
        color,
        plate,
        car_size_id,
      } = newCar;

      return res.json({
        id,
        user_id,
        brand,
        model,
        color,
        plate,
        car_size_id,
      });
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async show(req, res) {
    try {
      const id = req.userId;
      if (!id) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const cars = await Car.findAll({
        where: {
          user_id: id
        }
      });
      if (!cars) {
        return res.status(400).json({ errors: ['Cars not Found'] });
      }

      return res.json(cars);
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async indexCar(req, res) {
    try {
      const car = await Car.findByPk(req.params.id);
      if (!car) {
        return res.status(400).json({ errors: ['Car not Found'] });
      }

      return res.json(car);
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async update(req, res) {
    try {
      const idReq = req.userId;
      if (!idReq) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const car = await Car.findOne({
        where: {
          id: req.params.id,
          user_id: idReq,
        },
      });
      if (!car) {
        return res.status(401).json({ errors: ['Unauthorized'] });
      }

      const updateCar = await car.update(req.body);

      const {
        id,
        user_id,
        brand,
        model,
        color,
        plate,
        car_size_id,
      } = updateCar;

      return res.json({
        id,
        user_id,
        brand,
        model,
        color,
        plate,
        car_size_id,
      });
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async delete(req, res) {
    try {
      const idReq = req.userId;
      if (!idReq) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const car = await Car.findOne({
        where: {
          id: req.params.id,
          user_id: idReq,
        },
      });
      if (!car) {
        return res.status(401).json({ errors: ['Unauthorized'] });
      }

      await car.destroy();

      return res.json({ message: 'Car deleted with success' });
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }
}

export default new CarController();
