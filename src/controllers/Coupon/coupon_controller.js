import Coupon from '../../models/Coupon/Coupon_models';

class CouponController {
  async store(req, res) {
    try {
      const newCoupon = await Coupon.create(req.body);

      const {
        id,
        name,
        code,
        discount,
      } = newCoupon;

      return res.json({
        id,
        name,
        code,
        discount,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Create Coupon / ${err.message}` });
    }
  }

  async show(req, res) {
    try {
      const coupons = await Coupon.findAll();

      return res.json(coupons);
    } catch (err) {
      return res.status(400).json({ errors: `Show Coupon / ${err.message}` });
    }
  }

  async index(req, res) {
    try {
      const coupon = await Coupon.findByPk(req.params.id);
      if (!coupon) {
        return res.status(400).json({ errors: ['Coupon not Found'] });
      }

      const {
        id,
        name,
        code,
        discount,
        times_used,
        is_disabled,
      } = coupon;

      return res.json({
        id,
        name,
        code,
        discount,
        times_used,
        is_disabled,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Index Coupon / ${err.message}` });
    }
  }

  async update(req, res) {
    try {
      const coupon = await Coupon.findByPk(req.params.id);
      if (!coupon) {
        return res.status(400).json({ errors: ['Coupon not found'] });
      }

      const updateCoupon = await coupon.update(req.body);

      const {
        id,
        name,
        code,
        discount,
        times_used,
        is_disabled,
      } = updateCoupon;

      return res.json({
        id,
        name,
        code,
        discount,
        times_used,
        is_disabled,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Update Coupon / ${err.message}` });
    }
  }

  async delete(req, res) {
    try {
      const coupon = await Coupon.findByPk(req.params.id);
      if (!coupon) {
        return res.status(400).json({ errors: ['Coupon not found'] });
      }

      await coupon.destroy();

      return res.json({ message: 'Coupon deleted with success' });
    } catch (err) {
      return res.status(400).json({ errors: `Delete Coupon / ${err.message}` });
    }
  }
}

export default new CouponController();
