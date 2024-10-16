<title>Processing...</title>
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
String id=request.getParameter("did");
String a=request.getParameter("dn");
int z=s.stm.executeUpdate("update department_details set dept_name='"+a+"' where dept_id='"+id+"'");
out.println("<script>alert('Department Details updated');document.location='dept_view.jsp';</script>");
}
%>

