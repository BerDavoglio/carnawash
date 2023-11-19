
module.exports = {
  async up (queryInterface, Sequelize) {
    await queryInterface.createTable('signregularwashes', {
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
      init_date: {
        type: Sequelize.DATE,
        allowNull: false,
      },
      date_to_date: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      is_broken: {
        type: Sequelize.BOOLEAN,
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
    await queryInterface.dropTable('signregularwashes');
  }
};
