import Faq from '../../models/FaqTerms/Faq_models.js';

class FaqController {
  async store(req, res) {
    try {
      const newFaq = await Faq.create(req.body);

      const {
        id,
        question,
        answer,
      } = newFaq;

      return res.json({
        id,
        question,
        answer,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Create FAQ / ${err.message}` });
    }
  }

  async show(req, res) {
    try {
      const faqs = await Faq.findAll();

      return res.json(faqs);
    } catch (err) {
      return res.status(400).json({ errors: `Show FAQ / ${err.message}` });
    }
  }

  async update(req, res) {
    try {
      const faq = await Faq.findByPk(req.params.id);
      if (!faq) {
        return res.status(400).json({ errors: 'FAQ not found' });
      }

      const updateFaq = await faq.update(req.body);

      const {
        id,
        question,
        answer,
      } = updateFaq;

      return res.json({
        id,
        question,
        answer,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Update FAQ / ${err.message}` });
    }
  }

  async delete(req, res) {
    try {
      const faq = await Faq.findByPk(req.params.id);
      if (!faq) {
        return res.status(400).json({ errors: 'FAQ not found' });
      }

      await faq.destroy();

      return res.json({ message: 'FAQ deleted with success' });
    } catch (err) {
      return res.status(400).json({ errors: `Delete FAQ / ${err.message}` });
    }
  }
}

export default new FaqController();
