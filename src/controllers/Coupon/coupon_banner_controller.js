import User from '../../models/User/User_models';

class CouponBannerController {
  async show(req, res) {
    try { } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async update(req, res) {
    try { } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }
}

export default new CouponBannerController();
