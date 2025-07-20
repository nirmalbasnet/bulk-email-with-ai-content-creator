import MailtrapProvider from "providers/MailtrapProvider";
import SendEmailRequest from "types/sendEmailRequest";

export const sendEmail = async (payload: SendEmailRequest) => {
  const { from, recipients, subject, body, provider = "mailtrap" } = payload;

  switch (provider) {
    case "mailtrap": {
      const { MAILTRAP_USER, MAILTRAP_PASS } = process.env;

      if (!MAILTRAP_USER || !MAILTRAP_PASS) {
        console.error(
          "Mailtrap credentials are not set in environment variables."
        );
        throw new Error("Mailtrap credentials are not set");
      }

      const mailtrapProvider = new MailtrapProvider({
        user: MAILTRAP_USER,
        pass: MAILTRAP_PASS,
      });

      return mailtrapProvider.sendEmail({ from, recipients, subject, body });
    }

    default:
      console.error("Email provider not implemented:", provider);
      throw new Error("Email provider not implemented");
  }
};
