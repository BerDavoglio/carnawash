import User from '../../models/User/User_models';

class WasherUserController {
  async firstLogin(req, res) {
    try { } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async index(req, res) {
    try { } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async update(req, res) {
    try { } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async bankShow(req, res) {
    try { } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async bankUpdate(req, res) {
    try { } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async timeShow(req, res) {
    try { } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async timeUpdate(req, res) {
    try { } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }
}

export default new WasherUserController();
