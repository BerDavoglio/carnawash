
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('paymentwashers', {
      id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
      },
      washer_id: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      wash_id: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      wash_date: {
        type: Sequelize.DATE,
        allowNull: false,
      },
      pay_data: {
        type: Sequelize.DATE,
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

  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('referedfriends');
  }
};
