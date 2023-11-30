import { Router } from 'express';
import jwtController from '../../controllers/User/jwt_controller';

const router = new Router();

router.post('/', (req, res) => {
  return res.json({message: 'Teste 123'});
});

export default router;
