<%@page import="java.sql.*"%>
<%@page import="exam.dbconnect"%>
<jsp:useBean id="s" class="exam.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>
<%
String sid=request.getParameter("id");
if(sid==null)
{
out.println("<script>history.back();</script>");
}
else
{
int z=s.stm.executeUpdate("Delete from staff_details where s_id='"+sid+"'");
out.println("<script>alert('Deleted..');document.location='staff_view.jsp';</script>");
%>
<%
}
%>