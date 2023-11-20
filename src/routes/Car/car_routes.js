import { Router } from 'express';
import carController from '../../controllers/Car/car_controller';

import loginRequired from '../../middlewares/login_required';

const router = new Router();

router.post('/', loginRequired, carController.store);
router.get('/', loginRequired, carController.show);
router.get('/washer/:id', loginRequired, carController.indexCar);
router.put('/:id', loginRequired, carController.update);
router.delete('/:id', loginRequired, carController.delete);

export default router;
