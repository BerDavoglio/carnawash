import { Router } from 'express';
import scheduleController from '../../controllers/Schedule/schedule_controller';

import loginRequired from '../../middlewares/login_required';
import isAdmin from '../../middlewares/is_admin';

const router = new Router();

router.post('/', loginRequired, scheduleController.store);
router.get('/all/', loginRequired, isAdmin, scheduleController.show);
router.get('/value/:id', loginRequired, scheduleController.calcTotalPrice);
router.get('/not-assign/', loginRequired, isAdmin, scheduleController.showNotAssign);
router.get('/client/all/', loginRequired, scheduleController.showClient);
router.get('/client/:id', loginRequired, scheduleController.indexClient);
router.get('/washer/all/', loginRequired, scheduleController.showWasher);
router.get('/washer/:id', loginRequired, scheduleController.indexWasher);
router.put('/admin/:id', loginRequired, isAdmin, scheduleController.updateWasher);
router.put('/washer/:id', loginRequired, scheduleController.changeStatus);
router.put('/cancel/:id', loginRequired, scheduleController.userCancel);
router.put('/rate/:id', loginRequired, scheduleController.rate);

export default router;
