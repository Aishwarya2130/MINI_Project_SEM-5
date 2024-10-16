<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>

<%
    String recipientEmail = request.getParameter("student_email");
    final String senderEmail = "huddaraishwarya097@gmail.com"; // Change this to your email
    final String senderPassword = "iyxdeqrdjxctpvpe"; // Change this to your app password

    // Set up properties for the mail session
    Properties props = new Properties();
    props.put("mail.smtp.host", "smtp.gmail.com");
    props.put("mail.smtp.port", "587");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");

    // Create a session with an authenticator
    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(senderEmail, senderPassword);
        }
    });

    try {
        // Create a MimeMessage
        MimeMessage message = new MimeMessage(mailSession);
        message.setFrom(new InternetAddress(senderEmail));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
        message.setSubject("Fee Receipt");
        message.setText("Dear Student,\n\nYour fee receipt has been sent.\n\nBest Regards,\nUTKARSH MIND'S");
        
        // Send the message
        Transport.send(message);
        out.println("<h3>Email sent successfully to " + recipientEmail + "!</h3>");
    } catch (MessagingException e) {
        out.println("<h3>Error sending email: " + e.getMessage() + "</h3>");
        // Optionally log the stack trace to a log file instead of printing it to the output
        e.printStackTrace(); // Just print to console or log file, not to out
    }
%>
