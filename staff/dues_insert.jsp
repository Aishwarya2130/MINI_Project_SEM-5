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
String a=request.getParameter("st");
String b=request.getParameter("nd");
String c=request.getParameter("sa");
int z=s.stm.executeUpdate("insert into no_dues values(null,'"+a+"','"+b+"','"+c+"')");
out.println("<script>alert('No Dues Added');document.location='dues_view.jsp';</script>");
}
%>
