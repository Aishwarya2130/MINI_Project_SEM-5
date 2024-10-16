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
String a=request.getParameter("ff");
String b=request.getParameter("ft");
String c=request.getParameter("fe");
String d=request.getParameter("rt");
String e=request.getParameter("da");
String f=request.getParameter("st");
int z=s.stm.executeUpdate("insert into feedback values(null,'"+a+"','"+b+"','"+c+"','"+d+"','"+e+"','"+f+"')");
out.println("<script>alert('Feedback Added');document.location='feedback_view.jsp';</script>");
}
%>
