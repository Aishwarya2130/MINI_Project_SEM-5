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
String a=request.getParameter("st");
String b=request.getParameter("nd");
String c=request.getParameter("sa");
int z=s.stm.executeUpdate("update no_dues set st_id='"+a+"',ndate='"+b+"',status='"+c+"' where nd_id='"+id+"'");
out.println("<script>alert('Dues updated');document.location='dues_view.jsp';</script>");
}
%>
