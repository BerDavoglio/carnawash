import { Router } from 'express';
import paymentController from '../../controllers/Payment/payment_controller';

import loginRequired from '../../middlewares/login_required';
import isAdmin from '../../middlewares/is_admin';

const router = new Router();

router.post('/', loginRequired, paymentController.store);
router.get('/all/', loginRequired, paymentController.show);
router.get('/:id', loginRequired, paymentController.index);
router.put('/:id', loginRequired, paymentController.update);
router.delete('/:id', loginRequired, paymentController.delete);

router.post('/admin/pay-washer/', loginRequired, isAdmin, paymentController.payWasher);
router.get('/washer/pay-washer/:initDate/:endDate/', loginRequired, paymentController.getPayedsWashers);

export default router;
