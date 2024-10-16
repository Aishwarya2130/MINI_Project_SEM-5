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
String a=request.getParameter("fn");
String b=request.getParameter("ln");
String c=request.getParameter("mob");
String d=request.getParameter("email");
String e=request.getParameter("qa");
String f=request.getParameter("exp");
String g=request.getParameter("ph");
ResultSet rs=s.stm.executeQuery("select * from principal_details where pr_mobile='"+c+"'");
if(rs.next())
{
out.println("<script>('Mobile No. already exist');history.back();</script>");
}
else
{
ResultSet rs1=s.stm.executeQuery("select * from principal_details where pr_email='"+d+"'");
if(rs1.next())
{
out.println("<script>('Email already exist');history.back();</script>");
}
else
{
int z=s.stm.executeUpdate("insert into principal_details values(null,'"+a+"','"+b+"','"+c+"','"+d+"','"+e+"','"+f+"','"+g+"')");
out.println("<script>alert('Principal details added');document.location='principal_view.jsp';</script>");
}
}
}
%>