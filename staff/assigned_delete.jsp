<%@page import="java.sql.*"%>
<%@page import="exam.dbconnect"%>
<jsp:useBean id="s" class="exam.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>
<%
String asid=request.getParameter("id");
String sid=request.getParameter("id");
if(asid==null)
{
out.println("<script>history.back();</script>");
}
else
{
int z=s.stm.executeUpdate("delete from assigned_subject where as_id='"+asid+"'");
out.println("<script>alert('Deleted...');document.location='assigned_view.jsp';</script>");
%>
<%
}
%>