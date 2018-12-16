import dictionary from '../extensions/dictionary';

export default function (sequelize, DataTypes) {
  const config = dictionary('warehouse');
  const userPermissions = sequelize.define('userPermissions', {
    [config.userID]: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    [config.roleID]: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  }, {
    tableName: config.tableName,
    timestamps: false,
  });

  userPermissions.associate = (models) => {
    userPermissions.belongsTo(models.role, {
      as: dictionary('role').tableName,
      foreignKey: config.roleID,
    });
    userPermissions.belongsTo(models.user, {
      as: dictionary('user').tableName,
      foreignKey: config.userID,
    });
  };

  return userPermissions;
};
