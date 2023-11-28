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

  async showStatistics(req, res) {
    try {
      const averageOne = await Quizresponse.findAll({
        grade: { $between: [0, 10] },
      });
      const averageTwo = await Quizresponse.findAll({
        grade: { $between: [10, 30] },
      });
      const averageThree = await Quizresponse.findAll({
        grade: { $between: [30, 60] },
      });
      const averageFour = await Quizresponse.findAll({
        grade: { $between: [60, 80] },
      });
      const averageFive = await Quizresponse.findAll({
        grade: { $between: [80, 100] },
      });

      return res.json([
        averageOne.length,
        averageTwo.length,
        averageThree.length,
        averageFour.length,
        averageFive.length,
      ]);
    } catch (err) {
      return res.status(400).json({ errors: `Make Quiz Response / ${err.message}` });
    }
  }

  async showAverage(req, res) {
    try {
      const approved = await Quizresponse.findAll({
        grade: { $between: [80, 100] },
      });
      const reproved = await Quizresponse.findAll({
        grade: { $between: [0, 80] },
      });

      return res.json([
        10,
        20,
      ]);
      return res.json([
        approved.length,
        reproved.length,
      ]);
    } catch (err) {
      return res.status(400).json({ errors: `Make Quiz Response / ${err.message}` });
    }
  }
}

export default new QuizresponseController();
