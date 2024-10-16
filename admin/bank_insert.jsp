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
String a=request.getParameter("bn");
String b=request.getParameter("an");
String c=request.getParameter("ah");
String d=request.getParameter("ui");
String e=request.getParameter("up");
String f=request.getParameter("at");
int z=s.stm.executeUpdate("insert into bank values(null,'"+a+"','"+b+"','"+c+"','"+d+"','"+e+"','"+f+"')");
out.println("<script>alert('Bank Details Added');document.location='bank_view.jsp';</script>");
}
%>
