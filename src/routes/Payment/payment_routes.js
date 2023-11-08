import { Router } from 'express';
import paymentController from '../../controllers/Payment/payment_controller';

import loginRequired from '../../middlewares/login_required';

const router = new Router();

router.post('/', loginRequired, paymentController.store);
router.get('/all/', loginRequired, paymentController.show);
router.get('/:id', loginRequired, paymentController.index);
router.put('/:id', loginRequired, paymentController.update);
router.delete('/:id', loginRequired, paymentController.delete);


export default router;
