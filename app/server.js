import Hapi from 'hapi';
import Joi from 'joi';
import {
  Client,
} from 'pg';

import routes from './routes';

const app = Hapi.server({
  host: 'localhost',
  port: 3003,
});

app.route(routes);

const db = new Client({
  host: 'localhost',
  port: 5432,
  database: 'postgres',
  user: 'postgres',
  password: 'postgres',
});

db.connect()
  .then(() => console.log('connected to database'))
  .catch(err => console.error('connection error', err.message));

async function start() {
  try {
    await app.start();
  } catch (err) {
    console.log(err);
    process.exit(1);
  }

  console.log('Server running at:', app.info.uri);
};

start();

export default app;
