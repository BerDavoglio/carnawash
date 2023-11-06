import { Router } from 'express';
import clientUserController from '../../controllers/User/client_user_controller';
import washerUserController from '../../controllers/User/washer_user_controller';
import adminUserController from '../../controllers/User/admin_user_controller';

import loginRequired from '../../middlewares/login_required';
import isAdmin from '../../middlewares/is_admin';

const router = new Router();

router.post('/', clientUserController.store);
router.get('/', loginRequired, clientUserController.index);
router.put('/', loginRequired, clientUserController.update);
router.delete('/', loginRequired, clientUserController.delete);

router.post('/washer/', loginRequired, washerUserController.firstLogin);
router.get('/washer/', loginRequired, washerUserController.index);
router.put('/washer/', loginRequired, washerUserController.update);
router.get('/washer/bank/', loginRequired, washerUserController.bankShow);
router.put('/washer/bank/', loginRequired, washerUserController.bankUpdate);
router.get('/washer/time/', loginRequired, washerUserController.timeShow);
router.put('/washer/time/', loginRequired, washerUserController.timeUpdate);

router.get('/admin/all/', loginRequired, isAdmin, adminUserController.show);
router.get('/admin/idname/', loginRequired, isAdmin, adminUserController.indexOnlyId);
router.get('/admin/clients/', loginRequired, isAdmin, adminUserController.showClients);
router.get('/admin/washers/', loginRequired, isAdmin, adminUserController.showWashers);
router.post('/admin/usertype/', loginRequired, isAdmin, adminUserController.userTypeStore);
router.get('/admin/usertype/', loginRequired, isAdmin, adminUserController.userTypeShow);
router.put('/admin/usertype/:id', loginRequired, isAdmin, adminUserController.userTypeUpdate);
router.delete('/admin/usertype/:id', loginRequired, isAdmin, adminUserController.userTypeDelete);

export default router;
