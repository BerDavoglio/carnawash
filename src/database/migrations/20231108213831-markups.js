
module.exports = {
  async up (queryInterface, Sequelize) {
    await queryInterface.createTable('markups', {
      id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
      },
      washer_porcentage: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      carnawash_porcentage: {
        type: Sequelize.INTEGER,
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
    await queryInterface.dropTable('markups');
  }
};
