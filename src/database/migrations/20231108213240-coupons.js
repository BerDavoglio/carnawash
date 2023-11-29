
module.exports = {
  async up (queryInterface, Sequelize) {
    await queryInterface.createTable('coupons', {
      id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
      },
      name: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      code: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      discount: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      times_used: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      is_disabled: {
        type: Sequelize.BOOLEAN,
        allowNull: false,
      },
      uses_allowed: {
        type: Sequelize.INTEGER,
        allowNull: true,
      },
      is_unlimited: {
        type: Sequelize.BOOLEAN,
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
    await queryInterface.dropTable('coupons');
  }
};
