import Quizresponse from '../../models/Quiz/QuizResponse_models';
import Washerinfo from '../../models/User/WasherInfo_models';

class QuizresponseController {
  async makeResponse(req, res) {
    try {
      const idUser = req.userId;
      if (!idUser) {
        return res.status(400).json({ errors: 'ID not Found' });
      }

      if (req.userRole != 'washer') {
        return res.status(400).json({ errors: 'User not Washer' });
      }

      const washerInfo = await Washerinfo.findOne({
        where: {
          user_id: idUser,
        }
      });

      await washerInfo.update({
        made_quiz: true,
      });

      const newQuizresponse = await Quizresponse.create({
        user_id: idUser,
        grade: req.body.grade,
      });

      const {
        id,
        user_id,
        grade,
      } = newQuizresponse;

      return res.json({
        id,
        user_id,
        grade,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Make Quiz Response / ${err.message}` });
    }
  }
}

export default new QuizresponseController();
