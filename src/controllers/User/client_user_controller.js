/* eslint-disable class-methods-use-this */
import jwt from 'jsonwebtoken';
import User from '../../models/User/User_models';

class ClientUserController {
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
      } = newUser;

      return res.json({
        name,
        email,
        address,
        cellphone,
      });
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async index(req, res) {
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
}

export default new ClientUserController();