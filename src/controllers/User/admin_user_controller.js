import User from '../../models/User/User_models';

class AdminUserController {
  async show(req, res) {
    try { } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async indexOnlyId(req, res) {
    try { } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async showClients(req, res) {
    try { } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async showWashers(req, res) {
    try { } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async userTypeStore(req, res) {
    try { } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async userTypeShow(req, res) {
    try { } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async userTypeUpdate(req, res) {
    try { } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async userTypeDelete(req, res) {
    try { } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }
}

export default new AdminUserController();
