import dictionary from '../extensions/dictionary';

export default function (sequelize, DataTypes) {
  const config = dictionary('opusType');
  const opusType = sequelize.define('opusType', {
    [config.opusID]: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    [config.typeID]: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  }, {
    tableName: config.tableName,
    timestamps: false,
  });

  opusType.associate = (models) => {
    opusType.belongsTo(models.opus, {
      as: dictionary('opus').tableName,
      foreignKey: config.opusID,
    });
    opusType.belongsTo(models.type, {
      as: dictionary('type').tableName,
      foreignKey: config.typeID,
    });
  };

  return opusType;
};
