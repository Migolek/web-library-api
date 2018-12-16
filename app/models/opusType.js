export default function (sequelize, DataTypes) {
  const opus = sequelize.define('opus', {
    DzieloID: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    GatunekID: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  }, {
    tableName: 'GatunekDziela',
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

  return opus;
};
