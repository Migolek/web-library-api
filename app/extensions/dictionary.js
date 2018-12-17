const config = {
  actor: {
    tableName: 'Aktor',
    ID: 'ID',
    firstName: 'Imie',
    lastName: 'Nazwisko',
    dateOfBirth: 'DataUrodzenia',
    growth: 'Wzrost',
  },
  carrier: {
    tableName: 'Nosnik',
    ID: 'ID',
    type: 'Typ',
  },
  cast: {
    tableName: 'Obsada',
    opusID: 'DzieloID',
    actorID: 'AktorID',
  },
  loanHistory: {
    tableName: 'HistoriaWypozyczen',
    userID: 'UzytkownikID',
    opusCopyID: 'KopiaDzielaID',
    loanDate: 'DataWypozyczenia',
    returnDate: 'DataZwrotu',
  },
  opus: {
    ID: 'ID',
    tableName: 'Dzielo',
    title: 'Tytul',
    yearOfProduction: 'RokProdukcji',
    director: 'Rezyser',
    country: 'Kraj',
  },
  opusType: {
    tableName: 'GatunekDziela',
    opusID: 'DzieloID',
    typeID: 'GatunekID',
  },
  reservations: {
    tableName: 'Rezerwacje',
    userID: 'UzytkownikID',
    opusCopyID: 'KopiaDzielaID',
  },
  role: {
    tableName: 'Role',
    ID: 'ID',
    role: 'Rola',
  },
  type: {
    tableName: 'Gatunek',
    ID: 'ID',
    typeName: 'NazwaGatunku',
  },
  user: {
    tableName: 'Uzytkownik',
    ID: 'ID',
    firstName: 'Imie',
    lastName: 'Nazwisko',
    nick: 'Nick',
    password: 'Haslo',
    dateOfBirth: 'DataUrodzenia',
    pesel: 'PESEL',
    city: 'Miejscowosc',
    street: 'Ulica',
    flatNumber: 'NumerDomu',
  },
  userPermissions: {
    tableName: 'UprawnieniaUzytkownikow',
    userID: 'UzytkownikID',
    roleID: 'RoleID',
  },
  warehouse: {
    tableName: 'Magazyn',
    ID: 'ID',
    opusID: 'DzieloID',
    carrierID: 'NosnikID',
    isAvailable: 'CzyWolne',
  },
};

export default function dictionary(modelName = null) {
  if (!modelName) {
    return config;
  }
  return config[modelName];
}
