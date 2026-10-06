package kimdong.vn.util;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;

public class EmailUtil {
	public static void sendOtpEmail(String toEmail, String otpCode) throws MessagingException {
		final String fromEmail = "tkd2k6@gmail.com";
		final String password = "idectmqrthzzjskk"; // Mật khẩu ứng dụng 16 ký tự của Google

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, password);
			}
		});

		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress(fromEmail));
		message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
		message.setSubject("Mã xác thực OTP");
		message.setText("Mã xác thực OTP của bạn là: " + otpCode + "\nMã có hiệu lực trong vòng 5 phút.");

		Transport.send(message);
	}
}