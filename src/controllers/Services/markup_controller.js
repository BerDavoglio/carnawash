import Markup from '../../models/Services/Markup_models';

class MarkupController {
  async show(req, res) {
    try {
      const markup = await Markup.findAll();

      return res.json(markup);
    } catch (err) {
      return res.status(400).json({ errors: `Show Markup / ${err.message}` });
    }
  }

  async update(req, res) {
    try {
      const markup = await Markup.findByPk(req.params.id);
      if (!markup) {
        return res.status(400).json({ errors: 'Markup not found' });
      }

      const updateMarkup = await markup.update(req.body);

      const {
        id,
        washer_porcentage,
        carnawash_porcentage,
      } = updateMarkup;

      return res.json({
        id,
        washer_porcentage,
        carnawash_porcentage,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Update Markup / ${err.message}` });
    }
  }
}

export default new MarkupController();
