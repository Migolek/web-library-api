import dictionary from '../extensions/dictionary';
import db from '../models';

export async function getWarehouseList(request, resolve) {
  try {
    const warehouse = await db.warehouse.findAll({
      rejectOnEmpty: true,
    });
    return resolve
      .response(warehouse)
      .type('json')
      .code(200);
  } catch (error) {
    return resolve
      .response(error.message)
      .code(500);
  }
}

export async function getWarehouseListForOpus(request, resolve) {
  const config = await dictionary();
  try {
    const warehouse = await db.warehouse.findAll({
      rejectOnEmpty: true,
      include: [{
        model: db.carrier,
        as: config.carrier.tableName,
      },
      {
        model: db.opus,
        as: config.opus.tableName,
        where: {
          [config.opus.ID]: {
            [db.Op.eq]: request.params.opusID,
          },
        },
      }],
    });
    return resolve
      .response(warehouse)
      .type('json')
      .code(200);
  } catch (error) {
    return resolve
      .response(error.message)
      .code(500);
  }
}

export async function reserveOpus(request, resolve) {
  try {
    const warehouse = await db.warehouse.update({
      rejectOnEmpty: true,
      where: {
        
      },
    });
    return resolve
      .response(warehouse)
      .type('json')
      .code(200);
  } catch (error) {
    return resolve
      .response(error.message)
      .code(500);
  }
}
