import { Router } from 'express';
import notificationController from '../../controllers/Notification/notification_controller';
import sentNotificationController from '../../controllers/Notification/sent_notification_controller';
import programmedNotificationController from '../../controllers/Notification/programmed_notification_controller';

import loginRequired from '../../middlewares/login_required';
import isAdmin from '../../middlewares/is_admin';

const router = new Router();

router.post('/', loginRequired, isAdmin, notificationController.store);
router.get('/', loginRequired, isAdmin, notificationController.show);
router.get('/user/', loginRequired, notificationController.showUser);
router.put('/:id', loginRequired, isAdmin, notificationController.update);
router.delete('/:id', loginRequired, isAdmin, notificationController.delete);

router.post('/sent/', loginRequired, isAdmin, sentNotificationController.send);
router.get('/sent/', loginRequired, sentNotificationController.indexUser);
router.get('/sent/all/', loginRequired, isAdmin, sentNotificationController.show);

router.get('/programmed/:id', loginRequired, isAdmin, programmedNotificationController.showProgrammed);
router.put('/programmed/:id', loginRequired, isAdmin, programmedNotificationController.updateProgrammed);

export default router;
