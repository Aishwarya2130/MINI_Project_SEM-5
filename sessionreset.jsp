<title>Processing...</title>
<%
   session.removeAttribute("uname");
   session.removeAttribute("utype");
   session.invalidate();
   out.println("<script>document.location='index.jsp';</script>");
%>