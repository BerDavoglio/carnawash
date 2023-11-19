import Couponbanner from '../../models/Coupon/CouponBanner_models';

class CouponBannerController {
  async show(req, res) {
    try {
      const coupon = await Couponbanner.findAll();

      return res.json(coupon);
    } catch (err) {
      return res.status(400).json({ errors: `Show Couponbanner / ${err.message}` });
    }
  }

  async update(req, res) {
    try {
      const coupon = await Couponbanner.findByPk(req.params.id);
      if (!coupon) {
        return res.status(400).json({ errors: ['Coupon Banner not found'] });
      }

      const updateCoupon = await coupon.update(req.body);

      return res.json(updateCoupon);
    } catch (err) {
      return res.status(400).json({ errors: `Update Couponbanner / ${err.message}` });
    }
  }
}

export default new CouponBannerController();
