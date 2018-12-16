export default function (sequelize, DataTypes) {
  const warehouse = sequelize.define('warehouse', {
    ID: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      allowNull: false,
      autoIncrement: true,
    },
    DzieloID: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    NosnikID: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    CzyWolne: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
    },
  }, {
    tableName: 'Magazyn',
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

  return warehouse;
};
