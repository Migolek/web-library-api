// import Joi from 'joi';
// import dictionary from '../extensions/dictionary';
// import db from '../models';

// async function getCastList(request, resolve) {
//   const config = await dictionary('cast');
//   try {
//     const casts = await db.cast.findAll({
//       where: {
//         [config.cast]: 1,
//       },
//       rejectOnEmpty: true,
//     });
//     return resolve
//       .response(casts)
//       .type('json')
//       .code(200);
//   } catch (error) {
//     return resolve
//       .response(error.message)
//       .code(500);
//   }
// }

// async function addCast(request, resolve) {
//   const config = await dictionary('cast');
//   try {
//     const cast = await db.cast
//       .findOrCreate({
//         where: {
//           [config.opusID]: request.payload.opusID,
//           [config.actorID]: request.payload.actorID,
//         },
//       })
//       .spread((record, created) => {
//         console.log(record.get({
//           plain: true,
//         }));
//         console.log(created);
//       });
//     return resolve
//       .response(cast)
//       .type('json')
//       .code(200);
//   } catch (error) {
//     return resolve
//       .response(error.message)
//       .code(500);
//   }
// }

// async function updateCast(request, resolve) {
//   const config = await dictionary('cast');
//   try {
//     const cast = await db.cast
//       .update({
//         [config.opusID]: request.payload.opusID,
//         [config.actorID]: request.payload.actorID,
//       }, {
//         returning: true,
//         where: {
//           [config.ID]: request.payload.ID,
//         },
//       });
//     return resolve
//       .response(cast)
//       .type('json')
//       .code(200);
//   } catch (error) {
//     return resolve
//       .response(error.message)
//       .code(500);
//   }
// }

// async function deleteCast(request, resolve) {
//   const config = await dictionary('cast');
//   try {
//     const cast = await db.cast
//       .destroy({
//         where: {
//           [config.ID]: request.payload.ID,
//         },
//       });
//     return resolve
//       .response(cast)
//       .type('json')
//       .code(200);
//   } catch (error) {
//     return resolve
//       .response(error.message)
//       .code(500);
//   }
// }

// const getCasts = {
//   method: 'GET',
//   path: '/casts',
//   handler: (request, h) => getCastList(request, h),
// };

// const createSingleCast = {
//   method: 'POST',
//   path: '/cast',
//   handler: (request, h) => addCast(request, h),
//   config: {
//     validate: {
//       payload: Joi.object({
//         opusID: Joi.number().required(),
//         actorID: Joi.number().required(),
//       }),
//     },
//   },
// };

// const updateSingleCast = {
//   method: 'PUT',
//   path: '/cast',
//   handler: (request, h) => updateCast(request, h),
//   config: {
//     validate: {
//       payload: Joi.object({
//         ID: Joi.number().required(),
//         actorID: Joi.number().required(),
//       }),
//     },
//   },
// };

// const deleteSingleCast = {
//   method: 'DELETE',
//   path: '/cast',
//   handler: (request, h) => deleteCast(request, h),
//   config: {
//     validate: {
//       payload: Joi.object({
//         ID: Joi.number().required(),
//       }),
//     },
//   },
// };

// export default [
//   getCasts,
//   createSingleCast,
//   updateSingleCast,
//   deleteSingleCast,
// ];
