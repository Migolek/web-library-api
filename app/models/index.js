import Sequelize from 'sequelize';
import fs from 'fs';
import path from 'path';

const config = {
  host: 'localhost',
  dialect: 'postgres',
  operatorsAliases: false,
  database: 'postgres',
  username: 'postgres',
  password: 'postgres',

  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000,
  },
};

const connection = new Sequelize(config);

connection.authenticate()
  .then(() => {
    console.log('Connection has been established successfully.');
  })
  .catch(err => console.error('Unable to connect to the database:', err));

const db = {};

fs.readdirSync(__dirname)
  .filter(file => (
    (file.indexOf('.') !== 0) && (file !== 'index.js')
  ))
  .forEach((file) => {
    const model = connection.import(path.join(__dirname, file));
    db[model.name] = model;
  });

Object.keys(db).forEach((modelName) => {
  if ('associate' in db[modelName]) {
    db[modelName].associate(db);
  }
});

db.connection = connection;
db.Sequelize = Sequelize;

export default db;
