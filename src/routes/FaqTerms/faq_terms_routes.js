import { Router } from 'express';
import faqController from '../../controllers/FaqTerms/faq_controller';
import conditionController from '../../controllers/FaqTerms/condition_controller';

import loginRequired from '../../middlewares/login_required';
import isAdmin from '../../middlewares/is_admin';

const router = new Router();

router.post('/faq/', loginRequired, isAdmin, faqController.store);
router.get('/faq/', loginRequired, faqController.show);
router.put('/faq/', loginRequired, isAdmin, faqController.update);
router.delete('/faq/', loginRequired, isAdmin, faqController.delete);

router.post('/condition/', loginRequired, isAdmin, conditionController.store);
router.get('/condition/', loginRequired, conditionController.show);
router.put('/condition/', loginRequired, isAdmin, conditionController.update);
router.delete('/condition/', loginRequired, isAdmin, conditionController.delete);

export default router;
