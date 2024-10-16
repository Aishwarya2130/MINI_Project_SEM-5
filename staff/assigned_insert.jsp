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
String a=request.getParameter("sid");
String b=request.getParameter("stid");
String c=request.getParameter("ad");
int z=s.stm.executeUpdate("insert into assigned_subject values(null,'"+a+"','"+b+"','"+c+"')");
out.println("<script>alert('Assigned subject Added');document.location='assigned_view.jsp';</script>");
}
%>
