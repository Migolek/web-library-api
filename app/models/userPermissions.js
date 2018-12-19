import dictionary from '../extensions/dictionary';

export default function (sequelize, DataTypes) {
  const config = dictionary('userPermissions');
  const userPermissions = sequelize.define('userPermissions', {
    [config.ID]: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      allowNull: false,
      autoIncrement: true,
    },
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
    const dictionaryRole = dictionary('role');
    userPermissions.belongsTo(models.role, {
      as: dictionaryRole.tableName,
      foreignKey: config.roleID,
    });
    const dictionaryUser = dictionary('user');
    userPermissions.belongsTo(models.user, {
      as: dictionaryUser.tableName,
      foreignKey: config.userID,
    });
  };

  return userPermissions;
};
