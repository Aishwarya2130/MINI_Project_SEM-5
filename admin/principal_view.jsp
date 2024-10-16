<a href="principal_form.jsp">AddNew</a>
<table width="870" border="1" align="center">
  <tr>
    <td width="75"><div align="center"><strong>Sl No. </strong></div></td>
    <td width="119"><div align="center"><strong>First Name</strong></div></td>
    <td width="102"><div align="center"><strong>Last Name</strong></div></td>
    <td width="66"><div align="center"><strong>Mobile</strong></div></td>
    <td width="48"><div align="center"><strong>Email</strong></div></td>
    <td width="109"><div align="center"><strong>Qualification</strong></div></td>
    <td width="100"><div align="center"><strong>Experience</strong></div></td>
    <td width="81"><div align="center"><strong>Photo</strong></div></td>
    <td width="112"><strong>Action</strong></td>
  </tr>
<%@page import="java.sql.*"%>
<%@page import="exam.dbconnect"%>
<jsp:useBean id="s" class="exam.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>
<%
int sl=0;
ResultSet rs=s.stm.executeQuery("select * from assigned_subject a,subject sb,staff_details s where a.sub_id=sb.sub_id and a.s_id=s.s_id");
while(rs.next())
{
sl++;
int asid=rs.getInt("as_id");
%>
  <tr>
    <td><div align="center"><%=sl%></div></td>
    <td><div align="center"><%=rs.getString("pr_fname")%></div></td>
    <td><div align="center"><%=rs.getString("pr_lname")%></div></td>
    <td><div align="center"><%=rs.getString("pr_mobile")%></div></td>
    <td><div align="center"><%=rs.getString("pr_email")%></div></td>
    <td><div align="center"><%=rs.getString("pr_qualification")%></div></td>
    <td><div align="center"><%=rs.getString("pr_exp")%></div></td>
    <td><div align="center"><%=rs.getString("pr_photo")%></div></td>
    <td>Edit | Delete </td>
  </tr>
  <%
	}
	%>
</table>
