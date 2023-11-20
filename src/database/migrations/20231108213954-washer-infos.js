
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('washerinfos', {
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
      made_quiz: {
        type: Sequelize.BOOLEAN,
        allowNull: false,
      },
      contract_accept: {
        type: Sequelize.BOOLEAN,
        allowNull: false,
      },
      enable: {
        type: Sequelize.BOOLEAN,
        allowNull: false,
      },
      rate: {
        type: Sequelize.FLOAT,
        allowNull: false,
      },
      abn: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      contract: {
        type: Sequelize.BLOB('long'),
        allowNull: true,
      },
      driver_licence: {
        type: Sequelize.BLOB('long'),
        allowNull: true,
      },
      picture: {
        type: Sequelize.BLOB('long'),
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
    await queryInterface.dropTable('washerinfos');
  }
};
