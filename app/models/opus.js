export default function (sequelize, DataTypes) {
  const opus = sequelize.define('opus', {
    ID: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      allowNull: false,
      autoIncrement: true,
    },
    Tytul: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    RokProdukcji: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    Rezyser: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    Kraj: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  }, {
    tableName: 'Dzielo',
    timestamps: false,
  });

  // graph.associate = (models) => {
  //   graph.hasMany(models.people, {
  //     foreignKey: 'graphID'
  //   });
  //   graph.belongsTo(models.users, {
  //     as: 'user',
  //     foreignKey: 'userID'
  //   });
  // };

  return opus;
};
