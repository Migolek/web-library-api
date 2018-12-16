import dictionary from '../extensions/dictionary';

export default function (sequelize, DataTypes) {
  const config = dictionary('user');
  const user = sequelize.define('user', {
    [config.ID]: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      allowNull: false,
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
    [config.nick]: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    [config.password]: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    [config.dateOfBirth]: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    [config.pesel]: {
      type: DataTypes.BIGINT,
      allowNull: true,
    },
    [config.city]: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    [config.street]: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    [config.flatNumber]: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  }, {
    tableName: config.tableName,
    timestamps: false,
  });

  user.associate = (models) => {
    user.hasMany(models.userPermissions, {
      foreignKey: dictionary('userPermissions').userID,
    });
    user.hasMany(models.reservations, {
      foreignKey: dictionary('reservations').userID,
    });
    user.hasMany(models.loanHistory, {
      foreignKey: dictionary('loanHistory').userID,
    });
  };

  return user;
};
