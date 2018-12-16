export default function (sequelize, DataTypes) {
  const reservations = sequelize.define('reservations', {
    UzytkownikID: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    KopiaDzielaID: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  }, {
    tableName: 'Rezerwacje',
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

  return reservations;
};
