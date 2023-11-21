import Paymentcard from '../../models/Payment/PaymentCard_models';
import Paymentschedule from '../../models/Payment/PaymentSchedule_models';
import Paymentwasher from '../../models/Payment/PaymentWasher_models';

class PaymentController {
  async store(req, res) {
    try {
      const idUser = req.userId;
      if (!idUser) {
        return res.status(400).json({ errors: 'ID not Found' });
      }

      const newCard = await Paymentcard.create({
        user_id: idUser,
        name: req.body.name,
        card: req.body.card,
        date: req.body.date,
      });

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
      return res.status(400).json({ errors: `Create Paymentcard / ${err.message}` });
    }
  }

  async show(req, res) {
    try {
      const idReq = req.userId;
      if (!idReq) {
        return res.status(400).json({ errors: 'ID not Found' });
      }

      const cards = await Paymentcard.findAll({
        where: {
          user_id: idReq,
        },
        attributes: [
          'id',
          'user_id',
          'name',
          'last_digits',
          'date',
        ],
      });

      return res.json(cards);
    } catch (err) {
      return res.status(400).json({ errors: `Show Paymentcard / ${err.message}` });
    }
  }

  async index(req, res) {
    try {
      const idReq = req.userId;
      if (!idReq) {
        return res.status(400).json({ errors: 'ID not Found' });
      }

      const card = await Paymentcard.findOne({
        where: {
          id: req.params.id,
          user_id: idReq,
        }
      });
      if (!card) {
        return res.status(400).json({ errors: 'Paymentcard not Found' });
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
      return res.status(400).json({ errors: `Show Paymentcard / ${err.message}` });
    }
  }

  async update(req, res) {
    try {
      const idReq = req.userId;
      if (!idReq) {
        return res.status(400).json({ errors: 'ID not Found' });
      }

      const card = await Paymentcard.findOne({
        where: {
          id: req.params.id,
          user_id: idReq,
        }
      });
      if (!card) {
        return res.status(400).json({ errors: 'Paymentcard not Found' });
      }

      const cardsActive = await Paymentschedule.findAll({
        where: {
          card_id: card.id
        }
      })
      if (cardsActive == []) {
        return res.status(400).json({ errors: `Can't update Card: It's been used!` + cardsActive });
      }

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
      return res.status(400).json({ errors: `Update Paymentcard / ${err.message}` });
    }
  }

  async delete(req, res) {
    try {
      const idReq = req.userId;
      if (!idReq) {
        return res.status(400).json({ errors: 'ID not Found' });
      }

      const card = await Paymentcard.findOne({
        where: {
          id: req.params.id,
          user_id: idReq,
        }
      });
      if (!card) {
        return res.status(400).json({ errors: 'Paymentcard not Found' });
      }

      const cardsActive = await Paymentschedule.findAll({
        where: {
          card_id: card.id
        }
      })
      if (cardsActive == []) {
        return res.status(400).json({ errors: `Can't delete Card: It's been used!` });
      }

      await card.destroy();

      return res.json({ message: 'Paymentcard deleted with success' });
    } catch (err) {
      return res.status(400).json({ errors: `Delete Paymentcard / ${err.message}` });
    }
  }

  async payWasher(req, res) {
    try {
      const idReq = req.userId;
      if (!idReq) {
        return res.status(400).json({ errors: 'ID not Found' });
      }

      const payment = await Paymentwasher.findByPk(req.params.id);

      const updatedPayment = await payment.update({
        pay_data: new Date(),
      })

      return res.json(updatedPayment);
    } catch (err) {
      return res.status(400).json({ errors: `Show Paymentcard / ${err.message}` });
    }
  }

  async getPayedsWashers(req, res) {
    try {
      const idReq = req.userId;
      if (!idReq) {
        return res.status(400).json({ errors: 'ID not Found' });
      }

      const payments = await Paymentwasher.findAll({
        where: {
          washer_id: idReq,
          wash_date: {
            [Op.between]: [
              new Date(req.params.initDate + 'T00:00:00.000Z'),
              new Date(req.params.endDate + 'T23:59:59.999Z')
            ]
          },
        },
      });

      return res.json(payments);
    } catch (err) {
      return res.status(400).json({ errors: `Show Paymentcard / ${err.message}` });
    }
  }
}

export default new PaymentController();
