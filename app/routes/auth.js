import db from '../models';
import dictionary from '../extensions/dictionary';

async function authUser(login, password) {
  const config = await dictionary('user');
  const user = await db.user.findOne({
    where: {
      [config.nick]: login,
      [config.password]: password,
    },
  });
  if (!user) {
    return {
      message: 'User doesn\'t exist or password is wrong',
      authorized: false,
    };
  }
  return {
    authorized: true,
  };
}

async function loginUser(request, resolve) {
  const {
    login,
    password,
  } = request.payload;
  try {
    const auth = await authUser(login, password);
    if (!auth.authorized) {
      return resolve
        .response(auth)
        .type('json')
        .code(403);
    };
    return resolve
      .response(auth)
      .type('json')
      .code(200);
  } catch (error) {
    return resolve
      .response(error.message)
      .code(500);
  }
}

const login = {
  method: 'POST',
  path: '/login',
  handler: (request, h) => loginUser(request, h),
  config: {
    cors: {
      origin: ['*'],
      additionalHeaders: ['cache-control', 'x-requested-with'],
    },
  },
};

export default [
  login,
];
