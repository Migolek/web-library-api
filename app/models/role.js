export default function (sequelize, DataTypes) {
  const role = sequelize.define('role', {
    ID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
    Rola: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  }, {
    tableName: 'Role',
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

  return role;
};
