import nodemailer from "nodemailer";

import SendEmailInterface, {
  SendEmailParams,
} from "providers/SendEmailInterface";

interface MailtrapCredentials {
  user: string;
  pass: string;
}

class MailtrapProvider implements SendEmailInterface {
  transport: nodemailer.Transporter;

  constructor(credentials: MailtrapCredentials) {
    this.transport = nodemailer.createTransport({
      host: "sandbox.smtp.mailtrap.io",
      port: 2525,
      auth: {
        user: credentials.user,
        pass: credentials.pass,
      },
    });
  }

  sendEmail({ from, recipients, subject, body }: SendEmailParams) {
    return this.transport.sendMail({
      from,
      to: recipients,
      subject,
      html: body,
    });
  }
}

export default MailtrapProvider;
