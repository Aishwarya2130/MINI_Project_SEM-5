<%@page import="java.sql.*"%>
<%@page import="exam.dbconnect"%>
<jsp:useBean id="s" class="exam.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>
<%
String chk=request.getParameter("Submit");
if(chk==null)
{
out.println("<script>history.back();</script>");
}
else
{
String un=request.getParameter("uname");
String b=request.getParameter("np");
String c=request.getParameter("cp");
if(b.equals(c))
{
int z=s.stm.executeUpdate("update login set password='"+c+"' where username='"+un+"'");
out.println("<script>alert('Password Reset Successfully..!');document.location='index.jsp';</script>");
}
else
{
out.println("<script>alert('New & Confirm Password Does Not Matched..!');history.back();</script>");
}
}
%>