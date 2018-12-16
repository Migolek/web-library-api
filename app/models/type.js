export default function (sequelize, DataTypes) {
  const type = sequelize.define('type', {
    ID: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      allowNull: false,
      autoIncrement: true,
    },
    NazwaGatunku: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  }, {
    tableName: 'Gatunek',
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

  return type;
};
