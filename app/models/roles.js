export default function (sequelize, DataTypes) {
  const roles = sequelize.define('roles', {
    ID: {
      type: DataTypes.BIGINT,
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

  return roles;
};
