<title>Processing..</title>
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
String k=request.getParameter("ph");
int z=s.stm.executeUpdate("update student_details set dept_id='"+a+"',st_regno='"+b+"',fname='"+c+"',mname='"+d+"',lname='"+e+"',mother_name='"+f+"',dob='"+g+"',mob='"+h+"',email='"+i+"',city='"+j+"',photo='"+k+"' where st_id='"+id+"'");
out.println("<script>alert('student Details updated');document.location='stud_view.jsp';</script>");
}
%>
