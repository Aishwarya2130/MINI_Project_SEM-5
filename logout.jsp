<title>LoggingOut...</title>
<%
   session.removeAttribute("uname");
   session.invalidate();
   out.println("<script>alert('Logged out successfully');document.location='index.jsp';</script>");
%>