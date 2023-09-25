/* eslint-disable class-methods-use-this */
import jwt from 'jsonwebtoken';

import User from '../../models/User/User_models';

class JWTController {
  // Make the Token for User
  async store(req, res) {
    try {
      const {
        email,
        password,
      } = req.body;
      if (!email || !password) {
        return res.status(401)
          .json({ errors: ['Unauthorized'] });
      }

      const user = await User.findOne({ where: { email } });
      if (!user) {
        return res.status(401)
          .json({ errors: ['User does not exist!'] });
      }

      if (!(await user.passwordIsValid(password))) {
        return res.status(401)
          .json({ errors: ['Wrong password'] });
      }

      const {
        id,
        role,
      } = user;
      const token = jwt.sign({
        id,
        email,
        role,
      }, process.env.TOKEN_SECRET, {
        expiresIn: process.env.TOKEN_EXPIRATION,
      });
      return res.json({ token });
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }
}

export default new JWTController();
