import { Type } from "@sinclair/typebox";

const EmailSchema = Type.String({ format: "email" });

const ProviderSchema = Type.Optional(
  Type.Union([
    Type.Literal("mailtrap"),
    Type.Literal("sendgrid"),
    Type.Literal("sqs"),
  ])
);

const EmailRequestSchema = Type.Object({
  from: EmailSchema,
  recipients: Type.Array(EmailSchema),
  subject: Type.String(),
  body: Type.String(),
  provider: ProviderSchema,
});

const EmailResponseSchema = Type.Object({
  message: Type.String(),
  statusCode: Type.Integer(),
});

export default {
  schema: {
    body: EmailRequestSchema,
  },
  response: {
    200: EmailResponseSchema,
  },
};
