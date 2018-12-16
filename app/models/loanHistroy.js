import dictionary from '../extensions/dictionary';

export default function (sequelize, DataTypes) {
  const config = dictionary('loanHistory');
  const loanHistory = sequelize.define('loanHistory', {
    [config.userID]: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    [config.opusCopyID]: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    [config.loanDate]: {
      type: DataTypes.DATE,
      allowNull: true,
    },
    [config.returnDate]: {
      type: DataTypes.DATE,
      allowNull: true,
    },
  }, {
    tableName: config.tableName,
    timestamps: false,
  });

  loanHistory.associate = (models) => {
    loanHistory.belongsTo(models.user, {
      as: dictionary('user').tableName,
      foreignKey: config.userID,
    });
    loanHistory.belongsTo(models.warehouse, {
      as: dictionary('warehouse').tableName,
      foreignKey: config.opusCopyID,
    });
  };

  return loanHistory;
};
