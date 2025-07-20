import {FastifyInstance} from 'fastify';
import swaggerUI from '@fastify/swagger-ui';
import fp from 'fastify-plugin';

const swaggerUIPlugin = async (fastify: FastifyInstance) => {
  await fastify.register(swaggerUI, {
    routePrefix: '/docs',
    uiConfig: {
      docExpansion: 'full',
      deepLinking: false
    },
    staticCSP: true
  });
}

export default fp(swaggerUIPlugin);
