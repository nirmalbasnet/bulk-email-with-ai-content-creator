interface SendEmailRequest {
  from: string;
  recipients: string | string[];
  subject: string;
  body: string;
  provider?: "mailtrap" | "sendgrid" | "sqs";
}

export default SendEmailRequest;
