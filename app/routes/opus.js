import Joi from 'joi';
import dictionary from '../extensions/dictionary';
import db from '../models';

async function getOpusList(request, resolve) {
  try {
    const opuses = await db.opus.findAll({
      rejectOnEmpty: true,
    });
    return resolve
      .response(opuses)
      .type('json')
      .code(200);
  } catch (error) {
    return resolve
      .response(error.message)
      .code(500);
  }
}

async function addOpus(request, resolve) {
  const config = await dictionary('opus');
  try {
    const opus = await db.opus
      .findOrCreate({
        where: {
          [config.title]: request.payload.title,
          [config.yearOfProduction]: new Date(request.payload.yearOfProduction),
          [config.director]: request.payload.director,
          [config.country]: request.payload.country,
        },
      })
      .spread((record, created) => {
        console.log(record.get({
          plain: true,
        }));
        console.log(created);
      });
    return resolve
      .response(opus)
      .type('json')
      .code(200);
  } catch (error) {
    return resolve
      .response(error.message)
      .code(500);
  }
}

async function updateOpus(request, resolve) {
  const config = await dictionary('opus');
  try {
    const opus = await db.opus
      .update({
        [config.title]: request.payload.title,
        [config.yearOfProduction]: request.payload.yearOfProduction,
        [config.director]: request.payload.director,
        [config.country]: request.payload.country,
      }, {
        returning: true,
        where: {
          [config.ID]: request.payload.ID,
        },
      });
    return resolve
      .response(opus)
      .type('json')
      .code(200);
  } catch (error) {
    return resolve
      .response(error.message)
      .code(500);
  }
}

async function deleteOpus(request, resolve) {
  const config = await dictionary('opus');
  try {
    const opus = await db.opus
      .destroy({
        where: {
          [config.ID]: request.payload.ID,
        },
      });
    return resolve
      .response(opus)
      .type('json')
      .code(200);
  } catch (error) {
    return resolve
      .response(error.message)
      .code(500);
  }
}

const getOpuses = {
  method: 'GET',
  path: '/opuses',
  handler: (request, h) => getOpusList(request, h),
};

const createSingleOpus = {
  method: 'POST',
  path: '/opus',
  handler: (request, h) => addOpus(request, h),
  config: {
    validate: {
      payload: Joi.object({
        title: Joi.string().required(),
        yearOfProduction: Joi.date().required(),
        director: Joi.string().required(),
        country: Joi.string().required(),
      }),
    },
  },
};

const updateSingleOpus = {
  method: 'PUT',
  path: '/opus',
  handler: (request, h) => updateOpus(request, h),
  config: {
    validate: {
      payload: Joi.object({
        ID: Joi.number().required(),
        title: Joi.string().required(),
        yearOfProduction: Joi.date().required(),
        director: Joi.string().required(),
        country: Joi.string().required(),
      }),
    },
  },
};

const deleteSingleOpus = {
  method: 'DELETE',
  path: '/opus',
  handler: (request, h) => deleteOpus(request, h),
  config: {
    validate: {
      payload: Joi.object({
        ID: Joi.number().required(),
      }),
    },
  },
};

export default [
  getOpuses,
  createSingleOpus,
  updateSingleOpus,
  deleteSingleOpus,
];
