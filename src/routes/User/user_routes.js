import { Router } from 'express';
import clientUserController from '../../controllers/User/client_user_controller';
import signRegularwashController from '../../controllers/User/sign_regular_wash_controller';
import washerUserController from '../../controllers/User/washer_user_controller';
import adminUserController from '../../controllers/User/Admin/admin_user_controller';
import adminClientController from '../../controllers/User/Admin/admin_client_controller';
import adminWasherController from '../../controllers/User/Admin/admin_washer_controller';

import loginRequired from '../../middlewares/login_required';
import isAdmin from '../../middlewares/is_admin';

const router = new Router();

router.post('/', clientUserController.store);
router.get('/', loginRequired, clientUserController.index);
router.put('/', loginRequired, clientUserController.update);
router.delete('/', loginRequired, clientUserController.delete);

router.post('/refer/', loginRequired, clientUserController.referFriends);

router.post('/regular/', loginRequired, signRegularwashController.newRegular);
router.get('/regular/', loginRequired, signRegularwashController.indexRegular);
router.get('/client/geralInfo/:id', loginRequired, clientUserController.indexOne);

router.post('/washer/', loginRequired, washerUserController.firstLogin);
router.get('/washer/verify/', loginRequired, washerUserController.verifyFirstLogin);
router.get('/washer/info/', loginRequired, washerUserController.index);
router.get('/washer/geralInfo/:id', loginRequired, washerUserController.indexOne);
router.put('/washer/info/', loginRequired, washerUserController.update);
router.get('/washer/bank/', loginRequired, washerUserController.bankIndex);
router.put('/washer/bank/', loginRequired, washerUserController.bankUpdate);
router.get('/washer/time/', loginRequired, washerUserController.timeIndex);
router.put('/washer/time/', loginRequired, washerUserController.timeUpdate);

router.post('/admin/clients/', loginRequired, isAdmin, adminClientController.createClient);
router.get('/admin/clients/', loginRequired, isAdmin, adminClientController.showClients);
router.get('/admin/clients/new/', loginRequired, isAdmin, adminClientController.showClientsNew);
router.put('/admin/clients/by-id/:id', loginRequired, isAdmin, adminClientController.updateClient);
router.delete('/admin/clients/by-id/:id', loginRequired, isAdmin, adminClientController.deleteClient);
router.post('/admin/clients/by-id/:client/car/', loginRequired, isAdmin, adminClientController.createClientCar);
router.get('/admin/clients/by-id/:client/car/:car', loginRequired, isAdmin, adminClientController.showClientCar);
router.put('/admin/clients/by-id/:client/car/:car', loginRequired, isAdmin, adminClientController.updateClientCar);
router.delete('/admin/clients/by-id/:client/car/:car', loginRequired, isAdmin, adminClientController.deleteClientCar);

router.post('/admin/washers/', loginRequired, isAdmin, adminWasherController.createWashers);
router.get('/admin/washers/', loginRequired, isAdmin, adminWasherController.showWashers);
router.get('/admin/washers/new/', loginRequired, isAdmin, adminWasherController.showWashersNew);
router.put('/admin/washers/by-id/:id', loginRequired, isAdmin, adminWasherController.updateWashers);
router.put('/admin/washers/by-id/:id/approval/:change', loginRequired, isAdmin, adminWasherController.updateApproval);
router.put('/admin/washers/by-id/:id/enable/:change', loginRequired, isAdmin, adminWasherController.updateEnable);
router.get('/admin/washers/by-id/:id/bank/', loginRequired, isAdmin, adminWasherController.showBank);
router.put('/admin/washers/by-id/:id/bank/', loginRequired, isAdmin, adminWasherController.updateBank);
router.get('/admin/washers/by-id/:id/bank/', loginRequired, isAdmin, adminWasherController.showBank);
router.delete('/admin/washers/by-id/:id', loginRequired, isAdmin, adminWasherController.deleteWasher);

router.post('/admin/admins/', loginRequired, isAdmin, adminUserController.createAdmin);
router.get('/admin/admins/', loginRequired, isAdmin, adminUserController.showAdmins);
router.get('/admin/admins/role/:id', loginRequired, isAdmin, adminUserController.changeRole);
router.get('/admin/admins/subrole/:id', loginRequired, isAdmin, adminUserController.changeSubrole);
router.delete('/admin/admins/:id/', loginRequired, isAdmin, adminUserController.deleteAdmin);
router.post('/admin/usertype/', loginRequired, isAdmin, adminUserController.userTypeStore);
router.get('/admin/usertype/', loginRequired, isAdmin, adminUserController.userTypeShow);
router.put('/admin/usertype/:id', loginRequired, isAdmin, adminUserController.userTypeUpdate);
router.delete('/admin/usertype/:id', loginRequired, isAdmin, adminUserController.userTypeDelete);

export default router;
