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
String a=request.getParameter("stid");
String b=request.getParameter("dn");
String c=request.getParameter("dt");
String d=request.getParameter("rd");
String e=request.getParameter("st");
int z=s.stm.executeUpdate("insert into document_details values(null,'"+a+"','"+b+"','"+c+"','"+d+"','"+e+"')");
out.println("<script>alert('Document Details Added');document.location='dcmnt_view.jsp';</script>");
}
%>