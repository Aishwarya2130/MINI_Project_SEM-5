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
String a=request.getParameter("sn");
String b=request.getParameter("sc");
int z=s.stm.executeUpdate("insert into subject values(null,'"+a+"','"+b+"')");
out.println("<script>alert('sujects Details Added');document.location='sub_view.jsp';</script>");
}
%>
