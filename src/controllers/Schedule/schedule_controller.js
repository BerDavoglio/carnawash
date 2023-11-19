import Schedule from '../../models/Schedules/Schedule_models';
import CarsObjects from '../../models/Schedules/CarsObjects_models';
import Car from '../../models/Car/Car_models';

import AdditionalService from '../../models/Services/AdditionalService_models';
import CarSize from '../../models/Services/CarSize_models';
import RegularWash from '../../models/Services/RegularWash_models';

import Coupon from '../../models/Coupon/Coupon_models';

import PaymentCard from '../../models/Payment/PaymentCard_models';
import PaymentSchedule from '../../models/Payment/PaymentSchedule_models';

class ScheduleController {
  async store(req, res) {
    try {
      const idUser = req.userId;
      if (!idUser) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      let cars_list_id = '';
      req.body.cars_obj_list.forEach(async (cars_obj) => {
        const newCarsObjects = await CarsObjects.create({
          car_id: cars_obj.car_id,
          wash_type: cars_obj.wash_type,
          additional_list_id: cars_obj.additional_list_id,
        });
        cars_list_id += newCarsObjects.id;
        cars_list_id += ';';
      });

      const newPaymentSchedule = await PaymentSchedule.create({
        user_id: idUser,
        card_id: req.body.credit_card_id,
        three: req.body.three,
      });

      const newSchedule = await Schedule.create({
        user_id: idUser,
        cars_list_id: cars_list_id,
        selected_date: req.body.selected_date,
        address: req.body.address,
        coupon_id: req.body.coupon_id,
        payment_schedule_id: newPaymentSchedule.id,
        washer_id: null,
        status: 'not-assign',
        rate: null,
      });

      return res.json(newSchedule);
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async indexObjects(req, res) {
    try {
      const idUser = req.userId;
      if (!idUser) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const newCarsObjects = await CarsObjects.findByPk(req.params.id);

      return res.json(newCarsObjects);
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async calcCarRegularPrice(car_id, wash_type, additional_list_id) {
    total = 0;

    const car = Car.findByPk(car_id);
    if (!car) {
      return res.status(400).json({ errors: 'Car not found' });
    }
    const car_size = CarSize.findByPk(car.car_size_id);
    if (!car_size) {
      return res.status(400).json({ errors: 'CarSize not found' });
    }
    total += car_size.price;
    if (wash_type == 2) {
      total += 40;
    }

    additional_list_id.split(';').forEach((add_id) => {
      const addon = AdditionalService.findByPk(add_id);
      if (!addon) {
        return res.status(400).json({ errors: 'Additional Service not found' });
      }
      total += addon.price;
    });

    return total;
  }

  async calcParcialPrice(req, res) {
    try {
      return res.json({
        price: this.calcCarRegularPrice(
          req.body.car_id,
          req.body.wash_type,
          req.body.additional_list_id,
        ),
      });
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async calcTotalPriceInternal(id) {
    try {
      let total = 0;

      const schedule = await Schedule.findByPk(id);

      schedule.cars_list_id.split(';').forEach(async (cars_obj_id) => {
        const cars_obj = await CarsObjects.findByPk(cars_obj_id);
        total += this.calcCarRegularPrice(
          cars_obj.car_id,
          cars_obj.wash_type,
          cars_obj.additional_list_id,
        );
      });

      const coupon = Coupon.findByPk(schedule.coupon_id);

      total = total * coupon.discount / 100;
      coupon.update({
        times_used: (coupon.times_used + 1),
      });

      return total;
    } catch (err) {
      return -1;
    }
  }

  async calcTotalPrice(req, res) {
    try {
      let total = 0;

      const schedule = await Schedule.findByPk(req.params.id);
      if (!schedule) {
        return res.status(400).json({ errors: ['Schedule not Found'] });
      }

      schedule.cars_list_id.split(';').forEach(async (cars_obj_id) => {
        const cars_obj = await CarsObjects.findByPk(cars_obj_id);
        if (!cars_obj) {
          return res.status(400).json({ errors: ['CarsObjects not Found'] });
        }
        total += this.calcCarRegularPrice(
          cars_obj.car_id,
          cars_obj.wash_type,
          cars_obj.additional_list_id,
        );
      });

      const coupon = Coupon.findByPk(schedule.coupon_id);
      if (!coupon) {
        return res.status(400).json({ errors: ['Coupon not Found'] });
      }
      if (coupon.is_disabled) {
        return res.status(401).json({ errors: ['Coupon not Active'] });
      }

      total = total * coupon.discount / 100;
      coupon.update({
        times_used: (coupon.times_used + 1),
      });

      return res.json({ price: [total] });
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async show(req, res) {
    try {
      const schedules = await Schedule.findAll();

      return res.json(schedules);
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async showNotAssign(req, res) {
    try {
      const idUser = req.userId;
      if (!idUser) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const schedule = await Schedule.findOne({
        where: {
          washer_id: idUser,
          status: 'not-assign',
        },
      });

      return res.json(schedule);
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async showClient(req, res) {
    try {
      const idUser = req.userId;
      if (!idUser) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const schedules = await Schedule.findAll({
        where: {
          user_id: idUser,
        },
      });

      return res.json(schedules);
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async indexClient(req, res) {
    try {
      const idUser = req.userId;
      if (!idUser) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const schedule = await Schedule.findOne({
        where: {
          id: req.params.id,
          user_id: idUser,
        },
      });

      return res.json(schedule);
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async indexByDate(req, res) {
    try {
      const idUser = req.userId;
      if (!idUser) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const schedule = await Schedule.findOne({
        where: {
          id: req.params.id,
          selected_date: {
            $between: [req.params.date.setUTCHours(0, 0, 0, 0), req.params.endDate.setUTCHours(23, 59, 59, 999)]
          },
        },
      });

      return res.json(schedule);
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async indexHistory(req, res) {
    try {
      const idUser = req.userId;
      if (!idUser) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const schedule = await Schedule.findOne({
        where: {
          id: req.params.id,
          selected_date: {
            $between: [req.params.initDate, req.params.endDate]
          },
        },
      });

      return res.json(schedule);
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async indexClientRebook(req, res) {
    try {
      const idUser = req.userId;
      if (!idUser) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const schedule = await Schedule.findOne({
        where: {
          id: req.params.id,
          status: 'finished',
        },
        order: [['updatedAt', 'DESC']],
      });

      return res.json(schedule);
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async indexClientOngoing(req, res) {
    try {
      const idUser = req.userId;
      if (!idUser) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const schedule = await Schedule.findOne({
        where: {
          id: req.params.id,
          status: {
            [sequelize.Op.not]: 'not-assign'
          },
        },
      });

      return res.json(schedule);
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async showWasher(req, res) {
    try {
      const idUser = req.userId;
      if (!idUser) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const schedule = await Schedule.findAll({
        where: {
          washer_id: idUser,
        },
      });

      return res.json(schedule);
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async indexWasher(req, res) {
    try {
      const idUser = req.userId;
      if (!idUser) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const schedule = await Schedule.findOne({
        where: {
          id: req.params.id,
          washer_id: idUser,
        },
      });

      return res.json(schedule);
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async updateWasher(req, res) {
    try {
      const schedule = await Schedule.findByPk(req.params.id);

      await schedule.update({
        washer_id: req.body.washer_id,
        status: 'not-started',
      });

      return res.json({ message: ['Washer updated with success'] });
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async changeStatus(req, res) {
    try {
      const idUser = req.userId;
      if (!idUser) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const schedule = await Schedule.findOne({
        where: {
          id: req.params.id,
          washer_id: idUser,
        },
      });

      switch (schedule.status) {
        case 'not-started':
          await schedule.update({
            status: 'started',
          });
          break;
        case 'started':
          await schedule.update({
            status: 'finished',
          });
          break;
        default:
          return res.status(400).json({ errors: ['Some error has occour!'] });
      }
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async userCancel(req, res) {
    try {
      const idUser = req.userId;
      if (!idUser) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const schedule = await Schedule.findOne({
        where: {
          id: req.params.id,
          client_id: idUser,
        },
      });

      if (new Date() - schedule.selected_date > 2 * 60 * 60 * 1000) {
        const newSchedule = await schedule.update({
          status: 'cancel',
        });
        return res.json(newSchedule);
      }
      return res.status(400).json({ errors: ["Can't cancel a wash 2 hours or less before"] });
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }

  async rate(req, res) {
    try {
      const idUser = req.userId;
      if (!idUser) {
        return res.status(400).json({ errors: ['ID not Found'] });
      }

      const schedule = await Schedule.findOne({
        where: {
          id: req.params.id,
          washer_id: idUser,
          status: 'finished',
        },
      });

      schedule.update({
        rate: req.body.rate,
      });

      const payment = await PaymentSchedule.findOne({
        where: {
          id: schedule.payment_schedule_id,
          wash_id: schedule.id
        }
      });
      const card = await PaymentCard.findByPk(payment.card_id);

      const card_number = card.getCardNumber();
      const card_date = card.date;
      const three = payment.getCardThree();

      const stripe = require('stripe')(process.env.STRIPE_TOKEN);

      const token = await stripe.tokens.create({
        card: {
          number: card_number,
          exp_month: card_date.getMonth(),
          exp_year: card_date.getYear(),
          three,
        },
      });

      const charge = await stripe.charges.create({
        amount: this.calcTotalPriceInternal(schedule.id),
        currency: 'aud',
        source: token,
        description: 'Payment - ' + schedule.id,
      });

      return res.json(charge);
    } catch (err) {
      return res.status(400).json({ errors: err.message });
    }
  }
}

export default new ScheduleController();
