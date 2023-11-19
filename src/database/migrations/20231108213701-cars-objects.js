
module.exports = {
  async up (queryInterface, Sequelize) {
    await queryInterface.createTable('carsobjects', {
      id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
      },
      car_id: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      wash_type: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      additional_list_id: {
        type: Sequelize.TEXT,
        allowNull: false,
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
    await queryInterface.dropTable('carsobjects');
  }
};
