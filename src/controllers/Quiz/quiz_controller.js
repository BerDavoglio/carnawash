import Quiz from '../../models/Quiz/Quiz_models';

class QuizController {
  async store(req, res) {
    try {
      const newQuiz = await Quiz.create(req.body);

      const {
        id,
        question,
        answer,
        alternatives_list,
      } = newQuiz;

      return res.json({
        id,
        question,
        answer,
        alternatives_list,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Create Quiz / ${err.message}` });
    }
  }

  async show(req, res) {
    try {
      const quizes = await Quiz.findAll();

      return res.json(quizes);
    } catch (err) {
      return res.status(400).json({ errors: `Show Quiz / ${err.message}` });
    }
  }

  async update(req, res) {
    try {
      const quiz = await Quiz.findByPk(req.params.id);
      if (!quiz) {
        return res.status(400).json({ errors: 'Quiz not found' });
      }

      const updateQuiz = await quiz.update(req.body);

      const {
        id,
        question,
        answer,
        alternatives_list,
      } = updateQuiz;

      return res.json({
        id,
        question,
        answer,
        alternatives_list,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Update Quiz / ${err.message}` });
    }
  }

  async delete(req, res) {
    try {
      const quiz = await Quiz.findByPk(req.params.id);
      if (!quiz) {
        return res.status(400).json({ errors: 'Quiz not found' });
      }

      await quiz.destroy();

      return res.json({ message: 'Quiz deleted with success' });
    } catch (err) {
      return res.status(400).json({ errors: `Delete Quiz / ${err.message}` });
    }
  }
}

export default new QuizController();
