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
    String un=session.getAttribute("uname").toString();
	String os=request.getParameter("opass");
	String ns=request.getParameter("npass");
	String cs=request.getParameter("cpass");
ResultSet rs=s.stm.executeQuery("select * from login where username='"+un+"' and password='"+os+"'");
	if(rs.next())
	{
		if(ns.equals(cs))
		{
			int z=s.stm.executeUpdate("update login set password='"+ns+"' where username='"+un+"'");
			out.println("<script>alert('Password Changed Successfully...');document.location='home.jsp';</script>");
		}
		else
		{
			out.println("<script>alert('New & Confirm Password Dose not Matched...');document.location='changepassf.jsp';</script>");
		}
	}
	else
	{
	 out.println("<script>alert('Old Password Dose not Matched...');document.location='chngpassf.jsp';</script>");
	}
}
%>


