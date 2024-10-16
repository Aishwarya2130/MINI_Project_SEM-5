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
String b=request.getParameter("sem");
String c=request.getParameter("strg");
String d=request.getParameter("fn");
String e=request.getParameter("mn");
String f=request.getParameter("ln");
String g=request.getParameter("mtn");
String h=request.getParameter("dob");
String i=request.getParameter("mb");
String j=request.getParameter("em");
String k=request.getParameter("ct");
String l=request.getParameter("tf");
//String m=request.getParameter("pn");
//String l=request.getParameter("ph");
ResultSet rs=s.stm.executeQuery("select * from student_details where mob='"+i+"'");
if(rs.next())
{
  out.println("<script>alert('mobile no. already exists');history.back();</script>");
}
else
{
ResultSet rs1=s.stm.executeQuery("select * from student_details where email='"+j+"'");
if(rs1.next())
{
  out.println("<script>alert('email already exists');history.back();</script>");
}
else
{
int z=s.stm.executeUpdate("insert into student_details values(null,'"+a+"','"+b+"','"+c+"','"+d+"','-','"+f+"','-','-','"+i+"','"+j+"','-','"+l+"','no-img.png')");
int z1=s.stm.executeUpdate("insert into login values('"+c+"','"+i+"','student','-','-','active')");
out.println("<script>alert('You have Registred Successfully');alert('Username: Reg. No. & Password: Reg. Mobile No.');document.location='index.jsp';</script>");
}
}
}
%>
