import { FastifyInstance, FastifyRequest, FastifyReply } from "fastify";

import EmailSchema from "schema/EmailSchema";
import * as sendEmailController from "controllers/sendEmailController";

const routes = async (fastify: FastifyInstance) => {
  fastify.get("/", async (req: FastifyRequest, res: FastifyReply) => {
    res.type("text/html").send("<h1>Welcome to the notification service</h1>");
  });

  fastify.get("/ping", async (req: FastifyRequest, res: FastifyReply) => {
    res.type("text/html").send("<h1>Welcome to the notification service</h1>");
  });

  fastify.post("/email", EmailSchema, sendEmailController.sendEmail);
};

export default routes;
