/* eslint-disable class-methods-use-this */
import jwt from 'jsonwebtoken';
import User from '../../models/User/User_models';

class UserController {
  // Creating User:
  async store(req, res) {
    try {
      if (req.body.role || req.body.points) {
        return res.status(401)
          .json({ errors: ['Unauthorized'] });
      }

      const newUser = await User.create(req.body);

      const {
        name,
        email,
        address,
        cellphone,
        birth,
        cpf,
      } = newUser;

      return res.json({
        name,
        email,
        address,
        cellphone,
        birth,
        cpf,
      });
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  // Show the user itself:
  async show(req, res) {
    try {
      const id = req.userId;
      if (!id) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const user = await User.findByPk(id);
      if (!user) {
        return res.status(400).json({ errors: ['User not Found'] });
      }

      return res.json(user);
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  // Show all:
  async index(req, res) {
    try {
      const users = await User.findAll();
      if (!users) {
        return res.status(400).json({ errors: ['User not Found'] });
      }

      return res.json(users);
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  // Show all:
  async indexOnlyId(req, res) {
    try {
      const users = await User.findAll({
        attributes: ['id', 'name'],
        where: {
          role: 'user',
        },
      });
      if (!users) {
        return res.status(400).json({ errors: ['User not Found'] });
      }

      return res.json(users);
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  // Show the user itself:
  async showRole(req, res) {
    try {
      const id = req.userId;
      if (!id) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const user = await User.findByPk(id);
      if (!user) {
        return res.status(400).json({ errors: ['User not Found'] });
      }

      return res.json(user.role);
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  // Update the user:
  async update(req, res) {
    try {
      if (req.body.role || req.body.points) {
        return res.status(401)
          .json({ errors: ['Unauthorized'] });
      }

      const idreq = req.userId;
      if (!idreq) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const user = await User.findByPk(idreq);
      if (!user) {
        return res.status(400).json({ errors: ['User not Found'] });
      }

      const newUser = await user.update(req.body);

      const {
        id,
        email,
        role,
      } = newUser;
      const token = jwt.sign({
        id,
        email,
        role,
      }, process.env.TOKEN_SECRET, {
        expiresIn: process.env.TOKEN_EXPIRATION,
      });

      return res.json([newUser, token]);
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  // Delete User:
  async delete(req, res) {
    try {
      const id = req.userId;
      if (!id) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const user = await User.findByPk(id);
      if (!user) {
        return res.status(400).json({ errors: ['User not Found'] });
      }

      await user.destroy();
      return res.json({ message: 'User has been Deleted' });
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  // Change Points User:
  async changePoints(req, res) {
    try {
      const user = await User.findByPk(req.params.id);
      if (!user) {
        return res.status(400).json({ errors: ['User not Found'] });
      }

      const newUser = await user.update({
        points: (parseInt(user.points, 10) + parseInt(req.body.points, 10)),
      });

      return res.json({ message: `${req.body.points} points was added to ${newUser.name}` });
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }
}

export default new UserController();
