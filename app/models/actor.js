import dictionary from '../extensions/dictionary';

export default function (sequelize, DataTypes) {
  const config = dictionary('actor');
  const actor = sequelize.define('actor', {
    [config.ID]: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
    [config.firstName]: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    [config.lastName]: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    [config.dateOfBirth]: {
      type: DataTypes.DATE,
      allowNull: true,
    },
    [config.growth]: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
  }, {
    tableName: config.tableName,
    timestamps: false,
  });

  actor.associate = (models) => {
    actor.hasMany(models.cast, {
      foreignKey: dictionary('cast').actorID,
    });
  };

  return actor;
};
