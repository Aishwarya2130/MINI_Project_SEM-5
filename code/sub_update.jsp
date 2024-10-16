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
String a=request.getParameter("sn");
String b=request.getParameter("sc");
int z=s.stm.executeUpdate("update subject set sub_name='"+a+"',sub_code='"+b+"' where sub_id='"+id+"'");
out.println("<script>alert('sujects Details updated');document.location='sub_view.jsp';</script>");
}
%>
