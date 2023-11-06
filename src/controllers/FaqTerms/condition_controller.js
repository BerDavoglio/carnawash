import Condition from '../../models/FaqTerms/Condition_models';

class ConditionController {
  async show(req, res) {
    try {
      const condition = await Condition.findAll();

      return res.json(condition);
    } catch (err) {
      return res.status(400).json({ errors: `Show Terms and Conditions / ${err.message}` });
    }
  }

  async update(req, res) {
    try {
      const condition = await Condition.findByPk(req.params.id);
      if (!condition) {
        return res.status(400).json({ errors: ['Terms and Conditions not found'] });
      }

      const updateCondition = await condition.update(req.body);

      return res.json(updateCondition);
    } catch (err) {
      return res.status(400).json({ errors: `Update Terms and Conditions / ${err.message}` });
    }
  }
}

export default new ConditionController();
