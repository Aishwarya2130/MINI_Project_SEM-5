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
String a=request.getParameter("st");
String b=request.getParameter("did");
String c=request.getParameter("em");
String d=request.getParameter("tf");
String e=request.getParameter("am");
String f=request.getParameter("ut");
String g=request.getParameter("pd");
String h=request.getParameter("pt");
ResultSet rs=s.stm.executeQuery("select * from fees where utr='"+f+"'");
if(rs.next())
{
out.println("<script>alert('UTR no. already exist');history.back();</script>");
}

	else
	{
	 int z=s.stm.executeUpdate("insert into fees values(null,'"+a+"','"+b+"','"+c+"','"+d+"','"+e+"','"+f+"','"+g+"','"+h+"')");
	 
		out.println("<script>alert('Fees Added');document.location='fees_view.jsp';</script>");
	}

}
%>