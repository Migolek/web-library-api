import dictionary from '../extensions/dictionary';

export default function (sequelize, DataTypes) {
  const config = dictionary('reservations');
  const reservations = sequelize.define('reservations', {
    [config.userID]: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    [config.opusCopyID]: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  }, {
    tableName: config.tableName,
    timestamps: false,
  });

  reservations.associate = (models) => {
    reservations.belongsTo(models.user, {
      as: dictionary('user').tableName,
      foreignKey: config.userID,
    });
    reservations.belongsTo(models.warehouse, {
      as: dictionary('warehouse').tableName,
      foreignKey: config.opusCopyID,
    });
  };

  return reservations;
};
