import dictionary from '../extensions/dictionary';

export default function (sequelize, DataTypes) {
  const config = dictionary('type');
  const type = sequelize.define('type', {
    [config.ID]: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      allowNull: false,
      autoIncrement: true,
    },
    [config.typeName]: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  }, {
    tableName: config.tableName,
    timestamps: false,
  });

  type.associate = (models) => {
    type.hasMany(models.opusType, {
      foreignKey: dictionary('opusType').typeID,
    });
  };

  return type;
};
