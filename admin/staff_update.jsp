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
String id=request.getParameter("sid");
String a=request.getParameter("did");
String b=request.getParameter("fn");
String c=request.getParameter("ln");
String d=request.getParameter("mb");
String e=request.getParameter("ct");
String f=request.getParameter("eml");
String g=request.getParameter("ph");
int z=s.stm.executeUpdate("update staff_details set dept_id='"+a+"',s_fname='"+b+"',s_lname='"+c+"',mobile='"+d+"',city='"+e+"',email='"+f+"',photo='"+g+"' where s_id='"+id+"'");
out.println("<script>alert('staff Details updated');document.location='staff_view.jsp';</script>");
}
%>