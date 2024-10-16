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
String a=request .getParameter("stid");
String b=request.getParameter("dn");
String c=request.getParameter("dt");
String d=request.getParameter("rd");
String e=request.getParameter("st");
int z=s.stm.executeUpdate("update document_details set st_id='"+a+"',d_name='"+b+"',d_type='"+c+"',r_date='"+d+"',status='"+e+"' where d_id='"+id+"'");
out.println("<script>alert('document Details updated');document.location='dcmnt_view.jsp';</script>");
}
%>
