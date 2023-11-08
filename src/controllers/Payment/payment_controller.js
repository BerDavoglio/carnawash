import PaymentCard from '../../models/Payment/PaymentCard_models';

class PaymentController {
  async store(req, res) {
    try {
      const newCard = await PaymentCard.create(req.body);

      const {
        id,
        user_id,
        name,
        last_digits,
        date,
      } = newCard;

      return res.json({
        id,
        user_id,
        name,
        last_digits,
        date,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Create PaymentCard / ${err.message}` });
    }
  }

  async show(req, res) {
    try {
      const idReq = req.userId;
      if (!idReq) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const cards = await PaymentCard.findAll({
        where: {
          user_id: idReq,
        }
      });
      if (!cards) {
        return res.status(400).json({ errors: ['PaymentCards not Found'] });
      }

      const {
        id,
        user_id,
        name,
        last_digits,
        date,
      } = cards;

      return res.json({
        id,
        user_id,
        name,
        last_digits,
        date,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Show PaymentCard / ${err.message}` });
    }
  }

  async index(req, res) {
    try {
      const idReq = req.userId;
      if (!idReq) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const card = await PaymentCard.findOne({
        where: {
          id: req.params.id,
          user_id: idReq,
        }
      });
      if (!card) {
        return res.status(400).json({ errors: ['PaymentCard not Found'] });
      }

      const {
        id,
        user_id,
        name,
        last_digits,
        date,
      } = card;

      return res.json({
        id,
        user_id,
        name,
        last_digits,
        date,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Show PaymentCard / ${err.message}` });
    }
  }

  async update(req, res) {
    try {
      const idReq = req.userId;
      if (!idReq) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const card = await PaymentCard.findOne({
        where: {
          id: req.params.id,
          user_id: idReq,
        }
      });
      if (!card) {
        return res.status(400).json({ errors: ['PaymentCard not Found'] });
      }

      // VERIFICAR SE EXISTE PAYMENTSCHEDULE COM ESSE CARTÃO, E SE O BOOKING TA ATIVO OU N
      
      const updatePaymentCard = await card.update(req.body);

      const {
        id,
        question,
        answer,
        alternatives_list,
      } = updatePaymentCard;

      return res.json({
        id,
        question,
        answer,
        alternatives_list,
      });
    } catch (err) {
      return res.status(400).json({ errors: `Update PaymentCard / ${err.message}` });
    }
  }

  async delete(req, res) {
    try {
      const idReq = req.userId;
      if (!idReq) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const card = await PaymentCard.findOne({
        where: {
          id: req.params.id,
          user_id: idReq,
        }
      });
      if (!card) {
        return res.status(400).json({ errors: ['PaymentCard not Found'] });
      }

      // VERIFICAR SE EXISTE PAYMENTSCHEDULE COM ESSE CARTÃO, E SE O BOOKING TA ATIVO OU N

      await card.delete();

      return res.json({ message: 'PaymentCard deleted with success' });
    } catch (err) {
      return res.status(400).json({ errors: `Delete PaymentCard / ${err.message}` });
    }
  }
}

export default new PaymentController();
