<%@page import="java.sql.*"%>
<%@page import="exam.dbconnect"%>
<jsp:useBean id="s" class="exam.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>
<%
String qid=request.getParameter("id");
if(qid==null)
{
out.println("<script>history.back();</script>");
}
else
{
int z=s.stm.executeUpdate("delete from query where q_id='"+qid+"'");
out.println("<script>alert('Deleted...');document.location='query_view.jsp';</script>");
%>
<%
}
%>