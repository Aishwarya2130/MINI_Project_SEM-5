<title>Processing..</title>
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
String id=request.getParameter("asid");
String a=request.getParameter("sid");
String b=request.getParameter("stid");
String c=request.getParameter("ad");
int z=s.stm.executeUpdate("update assigned_subject set sub_id='"+a+"',s_id='"+b+"',a_date='"+c+"' where as_id='"+id+"'");
;
out.println("<script>alert('Assigned subject Updated');document.location='assigned_view.jsp';</script>");
}
%>
