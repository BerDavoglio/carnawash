import { Router } from 'express';
import quizController from '../../controllers/Quiz/quiz_controller';
import quizResponseController from '../../controllers/Quiz/quiz_response_controller';

import loginRequired from '../../middlewares/login_required';
import isAdmin from '../../middlewares/is_admin';

const router = new Router();

router.post('/', loginRequired, isAdmin, quizController.store);
router.get('/', loginRequired, quizController.show);
router.put('/:id', loginRequired, isAdmin, quizController.update);
router.delete('/:id', loginRequired, isAdmin, quizController.delete);

router.post('/respon/', loginRequired, quizResponseController.makeResponse);
router.get('/respon/', loginRequired, quizResponseController.getResponse);

export default router;
