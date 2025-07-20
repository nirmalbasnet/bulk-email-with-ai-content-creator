import { FastifyInstance } from 'fastify';
import swagger from '@fastify/swagger';
import fp from 'fastify-plugin';

const swaggerPlugin = async(fastify: FastifyInstance) => {
  await fastify.register(swagger, {
    openapi: {
      info: {
        title: 'My Notification Service',
        description: 'API documentation',
        version: '1.0.0',
      },
      servers: [
        { url: 'http://localhost:8080', description: 'API Docs' }
      ],
    }
  });
}

export default fp(swaggerPlugin);
