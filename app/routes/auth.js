import authController from '../controllers/authController';

const login = {
  method: 'POST',
  path: '/login',
  handler: (request, h) => authController.loginUser(request, h),
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
