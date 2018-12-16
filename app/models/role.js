import dictionary from '../extensions/dictionary';

export default function (sequelize, DataTypes) {
  const config = dictionary('role');
  const role = sequelize.define('role', {
    [config.ID]: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
    [config.role]: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  }, {
    tableName: config.tableName,
    timestamps: false,
  });

  role.associate = (models) => {
    role.hasMany(models.userPermissions, {
      foreignKey: dictionary('userPermissions').roleID,
    });
  };

  return role;
};
