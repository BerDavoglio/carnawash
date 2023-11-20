import Quizresponse from '../../models/Quiz/QuizResponse_models';

class QuizresponseController {
  async makeResponse(req, res) {
    try {
      const idUser = req.userId;
      if (!idUser) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      if (req.userRole != 'washer') {
        return res.status(400).json({ errors: ['User not Washer'] });
      }

      const newQuizresponse = await Quizresponse.create({
        user_id: idUser,
        responses_list: req.body.responses_list,
      });

      const {
        id,
        user_id,
        responses_list,
      } = newQuizresponse;

      return res.json({
        id,
        user_id,
        responses_list,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Make Quiz Response / ${err.message}` });
    }
  }

  async getResponse(req, res) {
    try {
      const idUser = req.userId;
      if (!idUser) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const quizResponses = await Quizresponse.findAll({
        where: {
          user_id: idUser
        }
      });
      if (!quizResponses) {
        return res.status(400).json({ errors: ['Responses not Found'] });
      }

      // Verificar quantas foram acertadas

      return res.json(quizResponses);
    } catch (err) {
      return res.status(400).json({ errors: `Get Quiz Response / ${err.message}` });
    }
  }

  async getScore(req, res) {
    try { } catch (err) {
      return res.status(400).json({ errors: `Get Quiz Score / ${err.message}` });
    }
  }
}

export default new QuizresponseController();
