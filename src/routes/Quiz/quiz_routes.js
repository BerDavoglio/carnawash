import { Router } from 'express';
import quizController from '../../controllers/Quiz/quiz_controller';

import loginRequired from '../../middlewares/login_required';
import isAdmin from '../../middlewares/is_admin';

const router = new Router();

router.post('/', loginRequired, isAdmin, quizController.store);
router.get('/', loginRequired, isAdmin, quizController.index);
router.put('/', loginRequired, isAdmin, quizController.update);
router.delete('/', loginRequired, isAdmin, quizController.delete);

router.post('/respon/', loginRequired, quizController.respon);

export default router;
