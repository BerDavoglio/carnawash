import { Router } from 'express';
import couponController from '../../controllers/Coupon/coupon_controller';
import couponBannerController from '../../controllers/Coupon/coupon_banner_controller';

import loginRequired from '../../middlewares/login_required';
import isAdmin from '../../middlewares/is_admin';

const router = new Router();

router.post('/', loginRequired, isAdmin, couponController.store);
router.get('/', loginRequired, couponController.index);
router.get('/all/', loginRequired, isAdmin, couponController.show);
router.put('/', loginRequired, isAdmin, couponController.update);
router.delete('/', loginRequired, isAdmin, couponController.delete);

// BANNER CRIA AUTOMATICAMENTE, ASSIM COMO PERFIL ADMIN
router.get('/banner/', loginRequired, isAdmin, couponBannerController.show);
router.put('/banner/:id', loginRequired, isAdmin, couponBannerController.update);

export default router;
