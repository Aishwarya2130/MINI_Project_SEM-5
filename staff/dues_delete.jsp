<%@page import="java.sql.*"%>
<%@page import="exam.dbconnect"%>
<jsp:useBean id="s" class="exam.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>
<%
String did=request.getParameter("id");
if(did==null)
{
out.println("<script>history.back();</script>");
}
else
{
int z=s.stm.executeUpdate("delete from no_dues where nd_id='"+did+"'");
out.println("<script>alert('Deleted...');document.location='dues_view.jsp';</script>");
%>
<%
}
%>