import { Router } from 'express';
import faqController from '../../controllers/FaqTerms/faq_controller';
import conditionController from '../../controllers/FaqTerms/condition_controller';

import loginRequired from '../../middlewares/login_required';
import isAdmin from '../../middlewares/is_admin';

const router = new Router();

router.post('/faq/', loginRequired, isAdmin, faqController.store);
router.get('/faq/', loginRequired, faqController.show);
router.put('/faq/:id', loginRequired, isAdmin, faqController.update);
router.delete('/faq/one/:id', loginRequired, isAdmin, faqController.delete);
router.delete('/faq/all/', loginRequired, isAdmin, faqController.deleteAll);

router.get('/condition/', loginRequired, conditionController.show);
router.put('/condition/:id', loginRequired, isAdmin, conditionController.update);

export default router;
