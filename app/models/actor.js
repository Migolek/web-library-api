export default function (sequelize, DataTypes) {
  const actor = sequelize.define('actor', {
    ID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
    Imie: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    Nazwisko: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    DataUrodzenia: {
      type: DataTypes.DATE,
      allowNull: true,
    },
    Wzrost: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
  }, {
    tableName: 'Aktor',
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

  return actor;
};
