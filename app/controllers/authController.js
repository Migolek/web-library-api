import db from '../models';
import dictionary from '../extensions/dictionary';

async function authUser(login, password) {
  const configUser = await dictionary('user');
  const user = await db.user.findOne({
    where: {
      [configUser.nick]: login,
      [configUser.password]: password,
    },
  });
  if (!user) {
    return {
      message: 'User doesn\'t exist or password is wrong',
      authorized: false,
    };
  }
  const configUserPermissions = await dictionary('userPermissions');
  const userPermissions = await db.userPermissions.findOne({
    where: {
      [configUserPermissions.userID]: user[configUser.ID],
    },
  });
  const configRoles = await dictionary('role');
  const role = await db.role.findOne({
    where: {
      [configRoles.ID]: userPermissions[configUserPermissions.roleID],
    },
  });
  return {
    authorized: true,
    role: role[configRoles.role],
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

export default {
  loginUser,
};
