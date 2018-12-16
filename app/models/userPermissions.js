export default function (sequelize, DataTypes) {
  const userPermissions = sequelize.define('userPermissions', {
    UzytkownikID: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    RoleID: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  }, {
    tableName: 'UprawnienieUzytkownikow',
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

  return userPermissions;
};
