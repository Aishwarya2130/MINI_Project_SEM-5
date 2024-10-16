<%@page import="java.sql.*"%>
<%@page import="exam.dbconnect"%>
<jsp:useBean id="s" class="exam.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>
<%
String bid=request.getParameter("id");
if(bid==null)
{
out.println("<script>history.back();</script>");
}
else
{
int z=s.stm.executeUpdate("delete from bank where bid='"+bid+"'");
out.println("<script>alert('Deleted...');document.location='bank_view.jsp';</script>");
%>
<%
}
%>