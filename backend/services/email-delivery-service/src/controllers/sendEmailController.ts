import { FastifyReply, FastifyRequest } from "fastify";

import SendEmailRequest from "types/sendEmailRequest";
import * as SendEmailService from "services/sendEmailService";

export const sendEmail = async (req: FastifyRequest, res: FastifyReply) => {
  const payload = req.body as SendEmailRequest;

  await SendEmailService.sendEmail(payload);

  res.code(200).send({
    message: "Email sent successfully",
  });
};
