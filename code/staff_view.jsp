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

  <h1 class="h3 mb-2 text-gray-800" style="display:inline-block;font-size: 20px;">Staff Details</h1>
  	<h1 class="btn bg-success  text-white shadow" style="display:inline-block;float:right"><a href="staff_form.jsp" class="text-white"><i class="fa fa-plus"></i> Add New</a></h1>
<br><br> 
  <!-- DataTales Example -->
  <div class="card shadow mb-4">

	<div class="card-body">
	  <div class="table-responsive">
		<table id="example" class="table table-hover data_table" width="100%"> 
		<thead><!-- Design End -->
  <tr class="tbl-dsg">
    <td width="111" height="35"><div align="center"><strong>Sl. No.</strong></div></td>
    <td width="176"><div align="center"><strong>Dept. Name</strong></div></td>
    <td width="136"><div align="center"><strong>Firstname</strong></div></td>
    <td width="133"><div align="center"><strong>Lastname</strong></div></td>
    <td width="107"><div align="center"><strong>Mobile.No</strong></div></td>
    <td width="122"><div align="center"><strong>City</strong></div></td>
    <td width="131"><div align="center"><strong>Email</strong></div></td>
    <td width="88"><div align="center"><strong>Photo</strong></div></td>
    <td width="132"><div align="center"><strong>Action</strong></div></td>
  </tr>
  </thead>
  <%@page import="java.sql.*"%>
<%@page import="exam.dbconnect"%>
<jsp:useBean id="s" class="exam.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>
<%
int sl=0;
ResultSet rs=s.stm.executeQuery("select * from staff_details s,department_details d where s.dept_id=d.dept_id");
while(rs.next())
{
sl++;
int sid=rs.getInt("s_id");
%>
<tbody>
  <tr>
    <td height="30"><div align="center"><%=sl%></div></td>
    <td><div align="center"><%=rs.getString("dept_name")%></div></td>
    <td><div align="center"><%=rs.getString("s_fname")%></div></td>
    <td><div align="center"><%=rs.getString("s_lname")%></div></td>
    <td><div align="center"><%=rs.getString("mobile")%></div></td>
    <td><div align="center"><%=rs.getString("city")%></div></td>
    <td><div align="center"><%=rs.getString("email")%></div></td>
    <td><div align="center"><img src="../uploads/<%=rs.getString("photo")%>" width="120px" height="120px"/><br><a href="staff_select_photo.jsp?id=<%=sid%>">Change photo</a></div></td>
    <td><div align="center"><a href="staff_edit.jsp?id=<%=sid%>" title="Edit" class="btn btn-primary"><i class="fa fa-edit"></i></a>  <a onClick="return confirm('Are you sure..?')" href="staff_delete.jsp?id=<%=sid%>" title="Delete" class="btn btn-danger"><i class="fa fa-trash"></i></a> </div></td>
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

