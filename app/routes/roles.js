import db from '../models';

async function getRolesList(request, resolve) {
  try {
    const roles = await db.roles.findAll({
      rejectOnEmpty: true,
    });
    // const roles = {
    //   test: 'test xD',
    // };
    return resolve
      .response(roles)
      .type('json')
      .header('X-test', 'value')
      .code(200);
  } catch (error) {
    // console.log('czym jest req:', req, 'a czym res:', res);
    return resolve
      .response(error.message)
      .code(500);
  }
}

async function createSingleRole(request, resolve) {
  try {
    const roles = await db.roles.create({
      ID: 1,
      Rola: 'test',
    });
    // const roles = {
    //   test: 'test xD',
    // };
    return resolve
      .response(roles)
      .type('json')
      .header('X-test', 'value')
      .code(200);
  } catch (error) {
    // console.log('czym jest req:', req, 'a czym res:', res);
    return resolve
      .response(error.message)
      .code(500);
  }
}

const getRoles = {
  method: 'GET',
  path: '/roles',
  handler: (request, h) => getRolesList(request, h),
};

const createRole = {
  method: 'POST',
  path: '/roles/create',
  handler: (request, h) => createSingleRole(request, h),
};

export default [
  getRoles,
  createRole,
  // getMovies,
];
