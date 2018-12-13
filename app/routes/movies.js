const editMovies = {
  method: 'GET',
  path: '/test/{name}',
  handler: (request, reply) => (request.params.name),
};

const getMovies = {
  method: 'GET',
  path: '/hello/{name}',
  handler: (request, reply) => (request.params.name),
};

export default [
  editMovies,
  getMovies,
];
