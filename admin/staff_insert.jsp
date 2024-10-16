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
String a=request.getParameter("did");
String b=request.getParameter("fn");
String c=request.getParameter("ln");
String d=request.getParameter("mb");
String e=request.getParameter("ct");
String f=request.getParameter("eml");
//String g=request.getParameter("ph");
ResultSet rs=s.stm.executeQuery("select * from staff_details where mobile='"+d+"'");
if(rs.next())
{
out.println("<script>alert('mobile no. already exist');history.back();</script>");
}
else
{
     ResultSet rs1=s.stm.executeQuery("select * from staff_details where email='"+f+"'");
     if(rs1.next())
	{
	out.println("<script>alert('email. already exist');history.back();</script>");
	}
	else
	{
	 int z=s.stm.executeUpdate("insert into staff_details values(null,'"+a+"','"+b+"','"+c+"','"+d+"','"+e+"','"+f+"','no-img.png')");
	 int z1=s.stm.executeUpdate("insert into login values('"+f+"','"+d+"','staff','-','-','active')");
		out.println("<script>alert('staff Details Added');alert('upload photo');document.location='staff_select_photo.jsp';</script>");
	}
}
}
%>