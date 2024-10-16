<!-- Session Validator -->
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session.getAttribute("uname")!=null)
{
%>
<!-- Session Validator -->
<!-- Design Start -->
<jsp:include page="meta.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<style>
 .text-center{
   text-align:center!important;
 }
 .pagination-li{
 	padding:5px 10px;
 }
 </style>
 
<!-- Begin Page Content -->
<div class="container-fluid">

  <h1 class="h3 mb-2 text-gray-800" style="display:inline-block;font-size: 20px;">Student Details</h1>
  	<h1 class="btn bg-success  text-white shadow" style="display:inline-block;float:right"><a href="stud_form.jsp" class="text-white"><i class="fa fa-plus"></i> Add New</a></h1>
<br><br> 
  <!-- DataTales Example -->
  <div class="card shadow mb-4">

	<div class="card-body">
	  <div class="table-responsive">
		<table id="example" class="table table-hover data_table" width="100%"> 
		<thead><!-- Design End -->
  <tr class="tbl-dsg">
    <td width="70"><div align="center">Sl No</div></td>
    <td width="68"><div align="center">Dept.Name</div></td>
    <td width="100"><div align="center">Reg No </div></td>
    <td width="106"><div align="center">F.name </div></td>
    <td width="126"><div align="center">M Name </div></td>
    <td width="79"><div align="center">L.Name </div></td>
    <td width="125"><div align="center">Mother Name </div></td>
    <td width="68"><div align="center">DOB</div></td>
    <td width="104"><div align="center">Mobile.No</div></td>
    <td width="85"><div align="center">Email</div></td>
    <td width="111"><div align="center">City</div></td>
    <td width="72"><div align="center">Photo</div></td>
    <td width="163"><div align="center">Action</div></td>
  </tr>
  </thead>
<%@page import="java.sql.*"%>
<%@page import="exam.dbconnect"%>
<jsp:useBean id="s" class="exam.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>
<%
int sl=0;
ResultSet rs=s.stm.executeQuery("select * from student_details s,department_details d where s.dept_id=d.dept_id");
while(rs.next())
{
sl++;
int sid=rs.getInt("st_id");
%>
<tbody>
  <tr>
    <td><div align="center"><%=sl%></div></td>
	<td><div align="center"><%=rs.getString("dept_name")%></div></td>
    <td><div align="center"><%=rs.getString("st_regno")%></div></td>
    <td><div align="center"><%=rs.getString("fname")%></div></td>
    <td><div align="center"><%=rs.getString("mname")%></div></td>
    <td><div align="center"><%=rs.getString("lname")%></div></td>
    <td><div align="center"><%=rs.getString("mother_name")%></div></td>
    <td><div align="center"><%=rs.getString("dob")%></div></td>
    <td><div align="center"><%=rs.getString("mob")%></div></td>
    <td><div align="center"><%=rs.getString("email")%></div></td>
    <td><div align="center"><%=rs.getString("city")%></div></td>
    <td><div align="center"><img src="../uploads/<%=rs.getString("photo")%>" width="120px" height="120px"/><br><a href="stud__select_photo.jsp?id=<%=sid%>">Change Photo</a></div></td>
    <td><div align="center"><a href="stud_edit.jsp?id=<%=sid%>" title="Edit" class="btn btn-primary"><i class="fa fa-edit"></i></a>  <a onClick="return confirm('Are you sure?')" href="stud_delete.jsp?id=<%=sid%>" tile="Delete"  class="btn btn-danger"><i class="fa fa-trash"></i></a> </div></td>
  </tr>
 <%
 }
 %>
<!-- Design Start -->
</tbody>
		</table>
	     
	  </div>
	 
	 </div>
  </div>
</div>
<!-- /.container-fluid -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- Design End -->
<!-- Session Validator -->
<%
}
else
{
out.println("<script>alert('Your Session Expired');document.location='../index.jsp';</script>");
}
%>
<!-- Session Validator -->
