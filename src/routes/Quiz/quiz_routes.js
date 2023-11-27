import { Router } from 'express';
import quizController from '../../controllers/Quiz/quiz_controller';
import quizResponseController from '../../controllers/Quiz/quiz_response_controller';

import loginRequired from '../../middlewares/login_required';
import isAdmin from '../../middlewares/is_admin';

const router = new Router();

router.post('/', loginRequired, isAdmin, quizController.store);
router.get('/', loginRequired, quizController.show);
router.put('/:id', loginRequired, isAdmin, quizController.update);
router.delete('/one/:id', loginRequired, isAdmin, quizController.deleteOne);
router.delete('/all', loginRequired, isAdmin, quizController.deleteAll);

router.post('/respon/', loginRequired, quizResponseController.makeResponse);
router.get('/respon/average/', loginRequired, quizResponseController.showAverage);
router.post('/respon/statistics/', loginRequired, quizResponseController.showStatistics);

export default router;
