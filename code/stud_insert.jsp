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
String b=request.getParameter("strg");
String c=request.getParameter("fn");
String d=request.getParameter("mn");
String e=request.getParameter("ln");
String f=request.getParameter("mtn");
String g=request.getParameter("dob");
String h=request.getParameter("mb");
String i=request.getParameter("em");
String j=request.getParameter("ct");
//String k=request.getParameter("ph");
ResultSet rs=s.stm.executeQuery("select * from student_details where mob='"+h+"'");
if(rs.next())
{
  out.println("<script>alert('mobile no. already exists');history.back();</script>");
}
else
{
ResultSet rs1=s.stm.executeQuery("select * from student_details where email='"+i+"'");
if(rs1.next())
{
  out.println("<script>alert('email already exists');history.back();</script>");
}
else
{
int z=s.stm.executeUpdate("insert into student_details values(null,'"+a+"','"+b+"','"+c+"','"+d+"','"+e+"','"+f+"','"+g+"','"+h+"','"+i+"','"+j+"','no-img.png')");
out.println("<script>alert('student Details Added');alert('upload the photo');document.location='stud__select_photo.jsp';</script>");
}
}
}
%>
