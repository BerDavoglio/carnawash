import { Router } from 'express';
import additionalServicesController from '../../controllers/Services/additional_services_controller';
import carSizeController from '../../controllers/Services/car_size_controller';
import markupController from '../../controllers/Services/markup_controller';
import regularWashController from '../../controllers/Services/regular_wash_controller';

import loginRequired from '../../middlewares/login_required';
import isAdmin from '../../middlewares/is_admin';

const router = new Router();

router.post('/additional/', loginRequired, isAdmin, additionalServicesController.store);
router.get('/additional/', additionalServicesController.show);
router.get('/additional/number-used/', additionalServicesController.showNumberUsed);
router.put('/additional/:id', loginRequired, isAdmin, additionalServicesController.update);
router.delete('/additional/:id', loginRequired, isAdmin, additionalServicesController.delete);

router.post('/size/', loginRequired, isAdmin, carSizeController.store);
router.get('/size/', carSizeController.show);
router.get('/size/number-used/', carSizeController.showNumberUsed);
router.put('/size/:id', loginRequired, isAdmin, carSizeController.update);
router.delete('/size/:id', loginRequired, isAdmin, carSizeController.delete);

router.get('/markup/', loginRequired, isAdmin, markupController.show);
router.put('/markup/:id', loginRequired, isAdmin, markupController.update);

router.post('/regular/', loginRequired, isAdmin, regularWashController.store);
router.get('/regular/', loginRequired, regularWashController.show);
router.put('/regular/:id', loginRequired, isAdmin, regularWashController.update);
router.delete('/regular/:id', loginRequired, isAdmin, regularWashController.delete);

export default router;
