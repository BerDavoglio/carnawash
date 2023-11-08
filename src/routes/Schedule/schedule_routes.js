import { Router } from 'express';
import scheduleController from '../../controllers/Schedule/schedule_controller';

import loginRequired from '../../middlewares/login_required';
import isAdmin from '../../middlewares/is_admin';

const router = new Router();

router.post('/', loginRequired, scheduleController.store);
router.get('/all/', loginRequired, isAdmin, scheduleController.show);
router.get('/not-assign/', loginRequired, isAdmin, scheduleController.showNotAssign);
router.get('/client/:id', loginRequired, scheduleController.indexClient);
router.get('/washer/:id', loginRequired, scheduleController.indexWasher);
router.put('/admin/:id', loginRequired, isAdmin, scheduleController.updateWasher);
router.put('/washer/:id', loginRequired, scheduleController.changeStatus);
router.put('/cancel/', loginRequired, scheduleController.userCancel);
router.put('/rate/', loginRequired, scheduleController.rate);

export default router;
