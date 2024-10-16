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
String a=request.getParameter("qf");
String b=request.getParameter("qt");
String c=request.getParameter("qu");
String d=request.getParameter("ad");
String e=request.getParameter("rl");
String f=request.getParameter("rd");
int z=s.stm.executeUpdate("insert into query values(null,'"+a+"','"+b+"','"+c+"','"+d+"','"+e+"','"+f+"')");
out.println("<script>alert('Query Added');document.location='query_view.jsp';</script>");
}
%>
