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
          [config.type]: request.payload.type,
        },
      })
      .spread((record, created) => {
        console.log(record.get({
          plain: true,
        }));
        console.log(created);
      });
    return resolve
      .response(carrier)
      .type('json')
      .code(200);
  } catch (error) {
    return resolve
      .response(error.message)
      .code(500);
  }
}

async function updateCarrier(request, resolve) {
  const config = await dictionary('carrier');
  try {
    const carrier = await db.carrier
      .update({
        [config.type]: request.payload.type,
      }, {
        returning: true,
        where: {
          [config.ID]: request.payload.ID,
        },
      });
    return resolve
      .response(carrier)
      .type('json')
      .code(200);
  } catch (error) {
    return resolve
      .response(error.message)
      .code(500);
  }
}

async function deleteCarrier(request, resolve) {
  const config = await dictionary('carrier');
  try {
    const carrier = await db.carrier
      .destroy({
        where: {
          [config.ID]: request.payload.ID,
        },
      });
    return resolve
      .response(carrier)
      .type('json')
      .code(200);
  } catch (error) {
    return resolve
      .response(error.message)
      .code(500);
  }
}

const getCarriers = {
  method: 'GET',
  path: '/carriers',
  handler: (request, h) => getCarrierList(request, h),
};

const createSingleCarrier = {
  method: 'POST',
  path: '/carrier',
  handler: (request, h) => addCarrier(request, h),
  config: {
    validate: {
      payload: Joi.object({
        type: Joi.string().required(),
      }),
    },
  },
};

const updateSingleCarrier = {
  method: 'PUT',
  path: '/carrier',
  handler: (request, h) => updateCarrier(request, h),
  config: {
    validate: {
      payload: Joi.object({
        ID: Joi.number().required(),
        type: Joi.string().required(),
      }),
    },
  },
};

const deleteSingleCarrier = {
  method: 'DELETE',
  path: '/carrier',
  handler: (request, h) => deleteCarrier(request, h),
  config: {
    validate: {
      payload: Joi.object({
        ID: Joi.number().required(),
      }),
    },
  },
};

export default [
  getCarriers,
  createSingleCarrier,
  updateSingleCarrier,
  deleteSingleCarrier,
];
