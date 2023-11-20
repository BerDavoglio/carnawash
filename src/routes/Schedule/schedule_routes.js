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
router.put('/cancel/:id', loginRequired, scheduleController.clientCancel);
router.put('/rate/:id', loginRequired, scheduleController.rate);

router.get('/washer/by-id/:id', loginRequired, scheduleController.indexWasher);
router.get('/washer/by-date/:date', loginRequired, scheduleController.showWasher);
router.put('/washer/change/:id', loginRequired, scheduleController.changeStatus);
router.put('/washer/decline/:id', loginRequired, scheduleController.declineWasher);
router.get('/washer/history/:initDate/:endDate', loginRequired, scheduleController.indexWasherHistory);
router.get('/washer/number-all', loginRequired, scheduleController.countAll);
router.get('/washer/number-next', loginRequired, scheduleController.countNext);
router.get('/washer/number-cancel', loginRequired, scheduleController.countCancel);

router.put('/admin/:id', loginRequired, isAdmin, scheduleController.updateWasher);

export default router;
