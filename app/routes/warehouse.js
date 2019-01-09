import { getWarehouseList, getWarehouseListForOpus } from '../controllers/warehouseController';

const getWarehouseObjects = {
  method: 'GET',
  path: '/warehouse',
  handler: (request, h) => getWarehouseList(request, h),
  config: {
    cors: {
      origin: ['*'],
      additionalHeaders: ['cache-control', 'x-requested-with'],
    },
  },
};

const getWarehouseObject = {
  method: 'GET',
  path: '/warehouse/{opusID}',
  handler: (request, h) => getWarehouseListForOpus(request, h),
  config: {
    cors: {
      origin: ['*'],
      additionalHeaders: ['cache-control', 'x-requested-with'],
    },
  },
};

export default [
  getWarehouseObjects,
  getWarehouseObject,
];
