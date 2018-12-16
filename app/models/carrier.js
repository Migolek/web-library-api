import dictionary from '../extensions/dictionary';

export default function (sequelize, DataTypes) {
  const config = dictionary('carrier');
  const carrier = sequelize.define('carrier', {
    [config.ID]: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
    [config.type]: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  }, {
    tableName: config.tableName,
    timestamps: false,
  });

  carrier.associate = (models) => {
    carrier.hasMany(models.warehouse, {
      foreignKey: dictionary('warehouse').carrierID,
    });
  };

  return carrier;
};
