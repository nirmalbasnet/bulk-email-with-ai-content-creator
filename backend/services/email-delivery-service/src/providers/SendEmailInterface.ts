export interface SendEmailParams {
  from: string;
  recipients: string | string[];
  subject: string;
  body: string;
}

interface SendEmailInterface {
  sendEmail({
    from,
    recipients,
    subject,
    body,
  }: SendEmailParams): Promise<void>;
}

export default SendEmailInterface;
