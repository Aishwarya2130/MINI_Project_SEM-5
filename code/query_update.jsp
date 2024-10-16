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
String id=request.getParameter("qid");
String a=request.getParameter("qf");
String b=request.getParameter("qt");
String c=request.getParameter("qu");
String d=request.getParameter("ad");
String e=request.getParameter("rl");
String f=request.getParameter("rd");
int z=s.stm.executeUpdate("update query set q_from='"+a+"',q_to='"+b+"',query='"+c+"',a_date='"+d+"',reply='"+e+"',r_date='"+f+"' where q_id='"+id+"'");
out.println("<script>alert('Query updated');document.location='query_view.jsp';</script>");
}
%>
