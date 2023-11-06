import { Router } from 'express';
import additionalServicesController from '../../controllers/Services/additional_services_controller';
import carSizeController from '../../controllers/Services/car_size_controller';
import markupController from '../../controllers/Services/markup_controller';
import regularWashController from '../../controllers/Services/regular_wash_controller';

import loginRequired from '../../middlewares/login_required';
import isAdmin from '../../middlewares/is_admin';

const router = new Router();

router.post('/additional/', loginRequired, isAdmin, additionalServicesController.store);
router.get('/additional/', loginRequired, additionalServicesController.show);
router.put('/additional/', loginRequired, isAdmin, additionalServicesController.update);
router.delete('/additional/', loginRequired, isAdmin, additionalServicesController.delete);

router.post('/size/', loginRequired, isAdmin, carSizeController.store);
router.get('/size/', loginRequired, carSizeController.show);
router.put('/size/', loginRequired, isAdmin, carSizeController.update);
router.delete('/size/', loginRequired, isAdmin, carSizeController.delete);

router.post('/markup/', loginRequired, isAdmin, markupController.store);
router.get('/markup/', loginRequired, isAdmin, markupController.show);
router.put('/markup/', loginRequired, isAdmin, markupController.update);
router.delete('/markup/', loginRequired, isAdmin, markupController.delete);

router.post('/regular/', loginRequired, isAdmin, regularWashController.store);
router.get('/regular/', loginRequired, regularWashController.show);
router.put('/regular/', loginRequired, isAdmin, regularWashController.update);
router.delete('/regular/', loginRequired, isAdmin, regularWashController.delete);

export default router;