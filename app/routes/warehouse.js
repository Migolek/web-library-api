// import Joi from 'joi';
// import dictionary from '../extensions/dictionary';
// import db from '../models';

// async function getWarehouseList(request, resolve) {
//   try {
//     const warehouse = await db.warehouse.findAll({
//       rejectOnEmpty: true,
//     });
//     return resolve
//       .response(warehouse)
//       .type('json')
//       .code(200);
//   } catch (error) {
//     return resolve
//       .response(error.message)
//       .code(500);
//   }
// }

// async function addWarehouseObject(request, resolve) {
//   const config = await dictionary('warehouse');
//   try {
//     const warehouse = await db.warehouse
//       .findOrCreate({
//         where: {
//           [config.opusID]: request.payload.opusID,
//           [config.carrierID]: request.payload.carrierID,
//           [config.isAvailable]: request.payload.isAvailable,
//         },
//       })
//       .spread((record, created) => {
//         console.log(record.get({
//           plain: true,
//         }));
//         console.log(created);
//       });
//     return resolve
//       .response(warehouse)
//       .type('json')
//       .code(200);
//   } catch (error) {
//     return resolve
//       .response(error.message)
//       .code(500);
//   }
// }

// async function updateWarehouseObject(request, resolve) {
//   const config = await dictionary('warehouse');
//   try {
//     const warehouse = await db.warehouse
//       .update({
//         [config.opusID]: request.payload.opusID,
//         [config.carrierID]: request.payload.carrierID,
//         [config.isAvailable]: request.payload.isAvailable,
//       }, {
//         returning: true,
//         where: {
//           [config.ID]: request.payload.ID,
//         },
//       });
//     return resolve
//       .response(warehouse)
//       .type('json')
//       .code(200);
//   } catch (error) {
//     return resolve
//       .response(error.message)
//       .code(500);
//   }
// }

// async function deleteWarehouseObject(request, resolve) {
//   const config = await dictionary('warehouse');
//   try {
//     const warehouse = await db.warehouse
//       .destroy({
//         where: {
//           [config.ID]: request.payload.ID,
//         },
//       });
//     return resolve
//       .response(warehouse)
//       .type('json')
//       .code(200);
//   } catch (error) {
//     return resolve
//       .response(error.message)
//       .code(500);
//   }
// }

// const getWarehouseObjects = {
//   method: 'GET',
//   path: '/warehouse-objects',
//   handler: (request, h) => getWarehouseList(request, h),
//   config: {
//     cors: {
//       origin: ['*'],
//       additionalHeaders: ['cache-control', 'x-requested-with'],
//     },
//   },
// };

// const createSingleWarehouseObject = {
//   method: 'POST',
//   path: '/warehouse',
//   handler: (request, h) => addWarehouseObject(request, h),
//   config: {
//     cors: {
//       origin: ['*'],
//       additionalHeaders: ['cache-control', 'x-requested-with'],
//     },
//     validate: {
//       payload: Joi.object({
//         opusID: Joi.number().required(),
//         carrierID: Joi.number().required(),
//         isAvailable: Joi.boolean().required(),
//       }),
//     },
//   },
// };

// const updateSingleWarehouseObject = {
//   method: 'PUT',
//   path: '/warehouse',
//   handler: (request, h) => updateWarehouseObject(request, h),
//   config: {
//     cors: {
//       origin: ['*'],
//       additionalHeaders: ['cache-control', 'x-requested-with'],
//     },
//     validate: {
//       payload: Joi.object({
//         ID: Joi.number().required(),
//         opusID: Joi.number().required(),
//         carrierID: Joi.number().required(),
//         isAvailable: Joi.boolean().required(),
//       }),
//     },
//   },
// };

// const deleteSingleWarehouseObject = {
//   method: 'DELETE',
//   path: '/warehouse',
//   handler: (request, h) => deleteWarehouseObject(request, h),
//   config: {
//     cors: {
//       origin: ['*'],
//       additionalHeaders: ['cache-control', 'x-requested-with'],
//     },
//     validate: {
//       payload: Joi.object({
//         ID: Joi.number().required(),
//       }),
//     },
//   },
// };

// export default [
//   getWarehouseObjects,
//   createSingleWarehouseObject,
//   updateSingleWarehouseObject,
//   deleteSingleWarehouseObject,
// ];
