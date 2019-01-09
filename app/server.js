import Hapi from 'hapi';
import db from './models';
import routes from './routes';

const app = Hapi.server({
  host: 'localhost',
  port: 3001,
}, {
  routes: {
    cors: true,
  },
});

app.route(routes);

async function start() {
  db.connection.sync().then(() => {
    try {
      app.start();
    } catch (err) {
      console.log(err);
      process.exit(1);
    }
    console.log('Server running at:', app.info.uri);
  });
};

start();

export default app;
