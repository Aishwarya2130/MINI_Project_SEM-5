<%@page import="java.sql.*"%>
<%@page import="exam.dbconnect"%>
<jsp:useBean id="s" class="exam.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>
<%
String fid=request.getParameter("id");
if(fid==null)
{
out.println("<script>history.back();</script>");
}
else
{
int z=s.stm.executeUpdate("delete from feedback where f_id='"+fid+"'");
out.println("<script>alert('Deleted...');document.location='feedback_view.jsp';</script>");
%>
<%
}
%>