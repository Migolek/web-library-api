import dictionary from '../extensions/dictionary';

export default function (sequelize, DataTypes) {
  const config = dictionary('cast');
  const cast = sequelize.define('cast', {
    [config.opusID]: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    [config.actorID]: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  }, {
    tableName: config.tableName,
    timestamps: false,
  });

  cast.associate = (models) => {
    cast.belongsTo(models.actor, {
      as: dictionary('actor').tableName,
      foreignKey: config.actorID,
    });
    cast.belongsTo(models.opus, {
      as: dictionary('opus').tableName,
      foreignKey: config.opusID,
    });
  };

  return cast;
};
