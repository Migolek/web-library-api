export default function (sequelize, DataTypes) {
  const carrier = sequelize.define('carrier', {
    ID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
    Typ: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  }, {
    tableName: 'Nosnik',
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

  return carrier;
};
