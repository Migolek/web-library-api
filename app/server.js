import Hapi from 'hapi';
import db from './models';
import routes from './routes';

const app = Hapi.server(
  {
    host: 'localhost',
    port: 3001,
  },
  {
    routes: {
      cors: true,
    },
  },
);

app.route(routes);

async function start() {
  console.log('uruchomione');
  db.connection.sync().then(() => {
    try {
      app.start();
    } catch (err) {
      console.log('Error with connection to database:', err);
      process.exit(1);
    }
    console.log('Server running at:', app.info.uri);
  });
}

start();

export default app;
