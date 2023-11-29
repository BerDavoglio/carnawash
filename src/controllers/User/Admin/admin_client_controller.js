import User from '../../../models/User/User_models';
import Car from '../../../models/Car/Car_models';

class AdminClientController {
  async showClients(req, res) {
    try {
      const admins = await User.findAll({
        where: {
          role: 'client',
        },
      });

      return res.json(admins);
    } catch (err) {
      return res.status(400).json({ errors: `Show Admin Client / ${err.message}` });
    }
  }

  async showClientsNew(req, res) {
    try {
      const clients = await User.findAll({
        where: {
          role: 'client',
          created_at: {
            [Op.between]: [
              new Date().setDate(date.getDate() - 7),
              new Date()
            ]
          },
        }
      });

      return res.json(clients.length);
    } catch (err) {
      return res.status(400).json({ errors: `Show Admin Client / ${err.message}` });
    }
  }

  async createClient(req, res) {
    try {
      const user = await User.create(req.body);

      return res.json(user);
    } catch (err) {
      return res.status(400).json({ errors: `Update Admin Client / ${err.message}` });
    }
  }

  async updateClient(req, res) {
    try {
      const idReq = req.params.id;
      if (!idReq) {
        return res.status(400).json({ errors: 'ID not Found' });
      }
      const user = User.findByPk(idReq);
      if (!user) {
        return res.status(400).json({ errors: 'User not Found' });
      }

      await user.update(req.body);

      return res.json({ message: 'User updated with success' });
    } catch (err) {
      return res.status(400).json({ errors: `Update Admin Client / ${err.message}` });
    }
  }

  async deleteClient(req, res) {
    try {
      const idReq = req.params.id;
      if (!idReq) {
        return res.status(400).json({ errors: 'ID not Found' });
      }
      const user = User.findByPk(idReq);
      if (!user) {
        return res.status(400).json({ errors: 'User not Found' });
      }

      const cars = Car.findAll({
        where: {
          user_id: idReq,
        }
      });
      if (cars) {
        return res.status(401).json({ errors: ["Can't delete Client because have Cars in it's name"] });
      }

      await user.destroy();

      return res.json({ message: 'User deleted with success' });
    } catch (err) {
      return res.status(400).json({ errors: `Delete Admin Client / ${err.message}` });
    }
  }

  async createClientCar(req, res) {
    try {
      const idReq = req.params.client;
      if (!idReq) {
        return res.status(400).json({ errors: 'ID not Found' });
      }
      const user = User.findByPk(idReq);
      if (!user) {
        return res.status(400).json({ errors: 'User not Found' });
      }

      await Car.create({
        user_id: idReq,
        brand: req.body.brand,
        model: req.body.model,
        color: req.body.color,
        plate: req.body.plate,
        car_size_id: req.body.car_size_id,
      });

      return res.json({ message: 'Car created with success' });
    } catch (err) {
      return res.status(400).json({ errors: `Create Admin Client Car / ${err.message}` });
    }
  }

  async showClientCar(req, res) {
    try {
      const cars = Car.findAll({
        where: {
          user_id: req.params.client,
        }
      });

      return res.json(cars);
    } catch (err) {
      return res.status(400).json({ errors: `Show Admin Client Car / ${err.message}` });
    }
  }

  async updateClientCar(req, res) {
    try {
      const idReq = req.params.client;
      if (!idReq) {
        return res.status(400).json({ errors: 'ID not Found' });
      }
      const user = User.findByPk(idReq);
      if (!user) {
        return res.status(400).json({ errors: 'User not Found' });
      }

      const car = await Car.findOne({
        where: {
          id: req.params.car,
          user_id: idReq,
        },
      });
      if (!car) {
        return res.status(400).json({ errors: 'Car not Found' });
      }

      await car.update({
        user_id: idReq,
        brand: req.body.brand,
        model: req.body.model,
        color: req.body.color,
        plate: req.body.plate,
        car_size_id: req.body.car_size_id,
      });

      return res.json({ message: 'Car updated with success' });
    } catch (err) {
      return res.status(400).json({ errors: `Update Admin Client Car / ${err.message}` });
    }
  }

  async deleteClientCar(req, res) {
    try {
      const idReq = req.params.client;
      if (!idReq) {
        return res.status(400).json({ errors: 'ID not Found' });
      }
      const user = User.findByPk(idReq);
      if (!user) {
        return res.status(400).json({ errors: 'User not Found' });
      }

      const car = await Car.findOne({
        where: {
          id: req.params.car,
          user_id: idReq,
        },
      });
      if (!car) {
        return res.status(400).json({ errors: 'Car not Found' });
      }

      await car.destroy();

      return res.json({ message: 'Car deleted with success' });
    } catch (err) {
      return res.status(400).json({ errors: `Delete Admin Client Car / ${err.message}` });
    }
  }
}

export default new AdminClientController();
