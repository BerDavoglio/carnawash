import { Router } from 'express';
import couponController from '../../controllers/Coupon/coupon_controller';
import couponBannerController from '../../controllers/Coupon/coupon_banner_controller';

import loginRequired from '../../middlewares/login_required';
import isAdmin from '../../middlewares/is_admin';

const router = new Router();

router.post('/', loginRequired, isAdmin, couponController.store);
router.get('/by-id/:id', loginRequired, couponController.index);
router.get('/all/', loginRequired, isAdmin, couponController.show);
router.get('/history/', loginRequired, isAdmin, couponController.showHistory);
router.put('/:id', loginRequired, isAdmin, couponController.update);
router.delete('/:id', loginRequired, isAdmin, couponController.delete);

router.get('/banner/', loginRequired, isAdmin, couponBannerController.show);
router.put('/banner/:id', loginRequired, isAdmin, couponBannerController.update);

export default router;
