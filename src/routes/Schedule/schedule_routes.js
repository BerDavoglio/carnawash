import { Router } from 'express';
import scheduleController from '../../controllers/Schedule/schedule_controller';

import loginRequired from '../../middlewares/login_required';
import isAdmin from '../../middlewares/is_admin';

const router = new Router();

router.post('/', loginRequired, scheduleController.store);
router.get('/', loginRequired, scheduleController.index);
router.get('/all/', loginRequired, isAdmin, scheduleController.show);
router.put('/admin/', loginRequired, isAdmin, scheduleController.updateWasher);
router.put('/washer/:id', loginRequired, scheduleController.changeWasher);
router.put('/cancel/', loginRequired, scheduleController.userCancel);
router.put('/rate/', loginRequired, scheduleController.rate);

export default router;
