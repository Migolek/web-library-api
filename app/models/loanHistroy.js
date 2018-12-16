export default function (sequelize, DataTypes) {
  const loanHistory = sequelize.define('loanHistory', {
    UzytkownikID: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    KopiaDzielaID: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    DataWypozyczenia: {
      type: DataTypes.DATE,
      allowNull: true,
    },
    DataZwrotu: {
      type: DataTypes.DATE,
      allowNull: true,
    },
  }, {
    tableName: 'HistoriaWypozyczen',
    timestamps: false,
  });

  // graph.associate = (models) => {
  //   graph.hasMany(models.people, {
  //     foreignKey: 'graphID'
  //   });
  //   graph.belongsTo(models.users, {
  //     as: 'user',
  //     foreignKey: 'userID'
  //   });
  // };

  return loanHistory;
};
