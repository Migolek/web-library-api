export default function (sequelize, DataTypes) {
  const user = sequelize.define('user', {
    ID: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      allowNull: false,
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
    Nick: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    Haslo: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    DataUrodzenia: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    PESEL: {
      type: DataTypes.BIGINT,
      allowNull: true,
    },
    Miejscowosc: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    Ulica: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    NumerDomu: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  }, {
    tableName: 'Uzytkownik',
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

  return user;
};
