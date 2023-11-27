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

router.post('/admin/pay-washer/:id', loginRequired, isAdmin, paymentController.payWasher);
router.get('/admin/pay-washer/all', loginRequired, isAdmin, paymentController.getPaymentwasher);
router.get('/washer/pay-washer/:initDate/:endDate/', loginRequired, paymentController.getPayedsWashers);

router.get('/admin/auto-pay/:id', loginRequired, isAdmin, paymentController.indexAutopay);
router.put('/admin/auto-pay/:id', loginRequired, isAdmin, paymentController.updateAutopay);

export default router;
