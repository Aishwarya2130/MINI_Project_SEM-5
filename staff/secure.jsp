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
	String un=request.getParameter("uname");
	String sq=request.getParameter("sq");
	String sa=request.getParameter("sa");

		int z=s.stm.executeUpdate("update login set s_question='"+sq+"',s_answer='"+sa+"' where username='"+un+"'");
		out.println("<script>alert('Security Details Updated');document.location='home.jsp';</script>");

}
%>
