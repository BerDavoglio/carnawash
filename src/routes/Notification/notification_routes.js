import { Router } from 'express';
import notificationController from '../../controllers/Notification/notification_controller';
import sentNotificationController from '../../controllers/Notification/sent_notification_controller';

import loginRequired from '../../middlewares/login_required';
import isAdmin from '../../middlewares/is_admin';

const router = new Router();

router.post('/', loginRequired, isAdmin, notificationController.store);
router.get('/', loginRequired, isAdmin, notificationController.show);
router.get('/user/', loginRequired, isAdmin, notificationController.showUser);
router.put('/', loginRequired, isAdmin, notificationController.update);
router.delete('/', loginRequired, isAdmin, notificationController.delete);

router.post('/sent/', loginRequired, isAdmin, sentNotificationController.send);
router.get('/sent/', loginRequired, sentNotificationController.indexUser);
router.get('/sent/all/', loginRequired, isAdmin, sentNotificationController.show);

export default router;
