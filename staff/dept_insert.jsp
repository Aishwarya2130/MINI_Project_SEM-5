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
String a=request.getParameter("dn");
int z=s.stm.executeUpdate("insert into department_details values(null,'"+a+"')");
out.println("<script>alert('Department Details Added');document.location='dept_view.jsp';</script>");
}
%>

