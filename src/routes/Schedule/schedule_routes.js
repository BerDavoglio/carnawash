import { Router } from 'express';
import scheduleController from '../../controllers/Schedule/schedule_controller';

import loginRequired from '../../middlewares/login_required';
import isAdmin from '../../middlewares/is_admin';

const router = new Router();

router.post('/', loginRequired, scheduleController.store);
router.get('/all/', loginRequired, isAdmin, scheduleController.show);
router.get('/carobject/:id', loginRequired, scheduleController.indexObjects);
router.get('/value/:id', loginRequired, scheduleController.calcTotalPrice);
router.get('/not-assign/', loginRequired, isAdmin, scheduleController.showNotAssign);

router.get('/client/all/', loginRequired, scheduleController.showClient);
router.get('/client/by-id/:id', loginRequired, scheduleController.indexClient);
router.get('/client/by-date/:date', loginRequired, scheduleController.indexByDate);
router.get('/client/history/:initDate/:endDate', loginRequired, scheduleController.indexHistory);
router.get('/client/rebook/', loginRequired, scheduleController.indexClientRebook);
router.get('/client/ongoing/', loginRequired, scheduleController.indexClientOngoing);
router.put('/cancel/:id', loginRequired, scheduleController.userCancel);
router.put('/rate/:id', loginRequired, scheduleController.rate);

router.get('/washer/all/', loginRequired, scheduleController.showWasher);
router.get('/washer/:id', loginRequired, scheduleController.indexWasher);
router.put('/admin/:id', loginRequired, isAdmin, scheduleController.updateWasher);
router.put('/washer/:id', loginRequired, scheduleController.changeStatus);

export default router;
