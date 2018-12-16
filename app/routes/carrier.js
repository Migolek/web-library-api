import Joi from 'joi';
import dictionary from '../extensions/dictionary';
import db from '../models';

async function getCarrierList(request, resolve) {
  try {
    const carriers = await db.carrier.findAll({
      rejectOnEmpty: true,
    });
    return resolve
      .response(carriers)
      .type('json')
      .code(200);
  } catch (error) {
    return resolve
      .response(error.message)
      .code(500);
  }
}

async function addCarrier(request, resolve) {
  const config = await dictionary('carrier');
  try {
    const carrier = await db.carrier
      .findOrCreate({
        where: {
          [config.firstName]: request.payload.firstName,
          [config.lastName]: request.payload.lastName,
          [config.dateOfBirth]: await new Date(request.payload.dateOfBirth),
          [config.growth]: request.payload.growth,
        },
      })
      .spread((user, created) => {
        console.log(user.get({
          plain: true,
        }));
        console.log(created);
      });
    return resolve
      .response(actor)
      .type('json')
      .code(200);
  } catch (error) {
    return resolve
      .response(error.message)
      .code(500);
  }
}

async function updateActor(request, resolve) {
  const config = await dictionary('actor');
  try {
    const actor = await db.actor
      .update({
        [config.firstName]: request.payload.firstName,
        [config.lastName]: request.payload.lastName,
        [config.dateOfBirth]: await new Date(request.payload.dateOfBirth),
        [config.growth]: request.payload.growth,
      }, {
        returning: true,
        where: {
          [config.ID]: request.payload.ID,
        },
      });
    return resolve
      .response(actor)
      .type('json')
      .code(200);
  } catch (error) {
    return resolve
      .response(error.message)
      .code(500);
  }
}

async function deleteActor(request, resolve) {
  const config = await dictionary('actor');
  try {
    const actor = await db.actor
      .destroy({
        where: {
          [config.ID]: request.payload.ID,
        },
      });
    return resolve
      .response(actor)
      .type('json')
      .code(200);
  } catch (error) {
    return resolve
      .response(error.message)
      .code(500);
  }
}

const getActors = {
  method: 'GET',
  path: '/actors',
  handler: (request, h) => getActorList(request, h),
};

const createSingleActor = {
  method: 'POST',
  path: '/actor',
  handler: (request, h) => addActor(request, h),
  config: {
    validate: {
      payload: Joi.object({
        firstName: Joi.string().required(),
        lastName: Joi.string().required(),
        dateOfBirth: Joi.date(),
        growth: Joi.number(),
      }),
    },
  },
};

const updateSingleActor = {
  method: 'PUT',
  path: '/actor',
  handler: (request, h) => updateActor(request, h),
  config: {
    validate: {
      payload: Joi.object({
        ID: Joi.number().required(),
        firstName: Joi.string().required(),
        lastName: Joi.string().required(),
        dateOfBirth: Joi.date(),
        growth: Joi.number(),
      }),
    },
  },
};

const deleteSingleActor = {
  method: 'DELETE',
  path: '/actor',
  handler: (request, h) => deleteActor(request, h),
  config: {
    validate: {
      payload: Joi.object({
        ID: Joi.number().required(),
      }),
    },
  },
};

export default [
  getActors,
  createSingleActor,
  updateSingleActor,
  deleteSingleActor,
];
