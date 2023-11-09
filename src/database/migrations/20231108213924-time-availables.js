/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
    await queryInterface.createTable('time-availables', {
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
      sunday_list: {
        type: Sequelize.TEXT,
        allowNull: false,
      },
      monday_list: {
        type: Sequelize.TEXT,
        allowNull: false,
      },
      tuesday_list: {
        type: Sequelize.TEXT,
        allowNull: false,
      },
      wednesday_list: {
        type: Sequelize.TEXT,
        allowNull: false,
      },
      thursday_list: {
        type: Sequelize.TEXT,
        allowNull: false,
      },
      friday_list: {
        type: Sequelize.TEXT,
        allowNull: false,
      },
      saturday_list: {
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
    await queryInterface.dropTable('time-availables');
  }
};
