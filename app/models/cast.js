export default function (sequelize, DataTypes) {
  const cast = sequelize.define('cast', {
    DzieloID: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    AktorID: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  }, {
    tableName: 'Obsada',
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

  return cast;
};
