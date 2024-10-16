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
int z=s.stm.executeUpdate("delete from document_details where d_id='"+did+"'");
out.println("<script>alert('Deleted...');document.location='dcmnt_view.jsp';</script>");
%>
<%
}
%>