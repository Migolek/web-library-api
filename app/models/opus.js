import dictionary from '../extensions/dictionary';

export default function (sequelize, DataTypes) {
  const config = dictionary('opus');
  const opus = sequelize.define('opus', {
    [config.ID]: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      allowNull: false,
      autoIncrement: true,
    },
    [config.title]: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    [config.yearOfProduction]: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    [config.director]: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    [config.country]: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  }, {
    tableName: config.tableName,
    timestamps: false,
  });

  opus.associate = (models) => {
    opus.hasMany(models.cast, {
      foreignKey: dictionary('cast').opusID,
    });
    opus.hasMany(models.opusType, {
      foreignKey: dictionary('opusType').opusID,
    });
    opus.hasMany(models.warehouse, {
      foreignKey: dictionary('warehouse').opusID,
    });
  };

  return opus;
};
