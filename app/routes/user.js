import Joi from 'joi';
import dictionary from '../extensions/dictionary';
import db from '../models';

async function getUserList(request, resolve) {
  try {
    const users = await db.user.findAll({
      rejectOnEmpty: true,
    });
    return resolve
      .response(users)
      .type('json')
      .code(200);
  } catch (error) {
    return resolve
      .response(error.message)
      .code(500);
  }
}

async function addUser(request, resolve) {
  const config = await dictionary('user');
  try {
    const user = await db.user
      .findOrCreate({
        where: {
          [config.firstName]: request.payload.firstName,
          [config.lastName]: request.payload.lastName,
          [config.nick]: request.payload.nick,
          [config.password]: request.payload.password,
          [config.dateOfBirth]: new Date(request.payload.dateOfBirth),
          [config.pesel]: request.payload.pesel,
          [config.city]: request.payload.city,
          [config.street]: request.payload.street,
          [config.flatNumber]: request.payload.flatNumber,
        },
      })
      .spread((record, created) => {
        console.log(record.get({
          plain: true,
        }));
        console.log(created);
      });
    return resolve
      .response(user)
      .type('json')
      .code(200);
  } catch (error) {
    return resolve
      .response(error.message)
      .code(500);
  }
}

async function updateUser(request, resolve) {
  const config = await dictionary('user');
  try {
    const user = await db.user
      .update({
        [config.firstName]: request.payload.firstName,
        [config.lastName]: request.payload.lastName,
        [config.nick]: request.payload.nick,
        [config.password]: request.payload.password,
        [config.dateOfBirth]: new Date(request.payload.dateOfBirth),
        [config.pesel]: request.payload.pesel,
        [config.city]: request.payload.city,
        [config.street]: request.payload.street,
        [config.flatNumber]: request.payload.flatNumber,
      }, {
        returning: true,
        where: {
          [config.ID]: request.payload.ID,
        },
      });
    return resolve
      .response(user)
      .type('json')
      .code(200);
  } catch (error) {
    return resolve
      .response(error.message)
      .code(500);
  }
}

async function deleteUser(request, resolve) {
  const config = await dictionary('user');
  try {
    const user = await db.user
      .destroy({
        where: {
          [config.ID]: request.payload.ID,
        },
      });
    return resolve
      .response(user)
      .type('json')
      .code(200);
  } catch (error) {
    return resolve
      .response(error.message)
      .code(500);
  }
}

const getUsers = {
  method: 'GET',
  path: '/users',
  handler: (request, h) => getUserList(request, h),
};

const createSingleUser = {
  method: 'POST',
  path: '/user',
  handler: (request, h) => addUser(request, h),
  config: {
    validate: {
      payload: Joi.object({
        firstName: Joi.string().required(),
        lastName: Joi.string().required(),
        nick: Joi.string().required(),
        password: Joi.string().required(),
        dateOfBirth: Joi.date().required(),
        pesel: Joi.number(),
        city: Joi.string().required(),
        street: Joi.string(),
        flatNumber: Joi.number().required(),
      }),
    },
  },
};

const updateSingleUser = {
  method: 'PUT',
  path: '/user',
  handler: (request, h) => updateUser(request, h),
  config: {
    validate: {
      payload: Joi.object({
        ID: Joi.number().required(),
        firstName: Joi.string().required(),
        lastName: Joi.string().required(),
        nick: Joi.string().required(),
        password: Joi.string().required(),
        dateOfBirth: Joi.date().required(),
        pesel: Joi.number(),
        city: Joi.string().required(),
        street: Joi.string(),
        flatNumber: Joi.number().required(),
      }),
    },
  },
};

const deleteSingleUser = {
  method: 'DELETE',
  path: '/user',
  handler: (request, h) => deleteUser(request, h),
  config: {
    validate: {
      payload: Joi.object({
        ID: Joi.number().required(),
      }),
    },
  },
};

export default [
  getUsers,
  createSingleUser,
  updateSingleUser,
  deleteSingleUser,
];
