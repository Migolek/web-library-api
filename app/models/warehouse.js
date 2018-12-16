import dictionary from '../extensions/dictionary';

export default function (sequelize, DataTypes) {
  const config = dictionary('warehouse');
  const warehouse = sequelize.define('warehouse', {
    [config.ID]: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      allowNull: false,
      autoIncrement: true,
    },
    [config.opusID]: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    [config.carrierID]: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    [config.isAvailable]: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
    },
  }, {
    tableName: config.tableName,
    timestamps: false,
  });

  warehouse.associate = (models) => {
    warehouse.hasMany(models.loanHistory, {
      foreignKey: dictionary('loanHistory').opusCopyID,
    });
    warehouse.hasMany(models.reservations, {
      foreignKey: dictionary('reservations').opusCopyID,
    });
    warehouse.belongsTo(models.carrier, {
      as: dictionary('carrier').tableName,
      foreignKey: config.carrierID,
    });
    warehouse.belongsTo(models.opus, {
      as: dictionary('opus').tableName,
      foreignKey: config.opusID,
    });
  };

  return warehouse;
};
