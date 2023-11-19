
module.exports = {
  async up (queryInterface, Sequelize) {
    await queryInterface.createTable('schedules', {
      id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
      },
      user_id: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      cars_list_id: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      selected_date: {
        type: Sequelize.DATE,
        defaultValue: new Date(),
      },
      address: {
        type: Sequelize.TEXT,
        allowNull: false,
      },
      observation_address: {
        type: Sequelize.TEXT,
        allowNull: false,
      },
      coupon_id: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      payment_schedule_id: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      washer_id: {
        type: Sequelize.INTEGER,
        allowNull: true,
      },
      status: {
        type: Sequelize.ENUM('not-assign', 'not-started', 'started', 'finished', 'cancel'),
        allowNull: false,
      },
      rate: {
        type: Sequelize.FLOAT,
        allowNull: true,
      },
      created_at: {
        type: Sequelize.DATE,
        allowNull: false,
      },
      updated_at: {
        type: Sequelize.DATE,
        allowNull: false,
      },
    });
  },

  async down (queryInterface, Sequelize) {
    await queryInterface.dropTable('schedules');
  }
};
