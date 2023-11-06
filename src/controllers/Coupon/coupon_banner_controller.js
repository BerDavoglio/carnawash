import CouponBanner from '../../models/Coupon/CouponBanner_models';

class CouponBannerController {
  async show(req, res) {
    try {
      const coupon = await CouponBanner.findAll();

      return res.json(coupon);
    } catch (err) {
      return res.status(400).json({ errors: `Show CouponBanner / ${err.message}` });
    }
  }

  async update(req, res) {
    try {
      const coupon = await CouponBanner.findByPk(req.params.id);
      if (!coupon) {
        return res.status(400).json({ errors: ['Coupon Banner not found'] });
      }

      const updateCoupon = await coupon.update(req.body);

      return res.json(updateCoupon);
    } catch (err) {
      return res.status(400).json({ errors: `Update CouponBanner / ${err.message}` });
    }
  }
}

export default new CouponBannerController();
