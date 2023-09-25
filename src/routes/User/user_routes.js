import { Router } from 'express';
import userController from '../../controllers/User/user_controller';

import loginRequired from '../../middlewares/login_required';
import isAdmin from '../../middlewares/is_admin';

const router = new Router();

router.post('/', userController.store); // Create a User
router.get('/', loginRequired, userController.show); // Get User Itself
router.get('/all/', loginRequired, isAdmin, userController.index); // Get User Itself
router.get('/idname/', loginRequired, isAdmin, userController.indexOnlyId); // Get User Itself
router.get('/role/', loginRequired, userController.showRole); // Get User Itself
router.put('/', loginRequired, userController.update); // Update a User
router.delete('/', loginRequired, userController.delete); // Delete a User
router.put('/points/:id', loginRequired, isAdmin, userController.changePoints); // Update a User

export default router;
