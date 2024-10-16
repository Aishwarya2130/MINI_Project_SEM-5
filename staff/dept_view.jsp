<!-- Session Validator -->
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session.getAttribute("uname")!=null)
{
	if(session.getAttribute("utype").equals("admin"))
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

  <h1 class="h3 mb-2 text-gray-800" style="display:inline-block;font-size: 20px;">Department Details</h1>
  	<h1 class="btn bg-success  text-white shadow" style="display:inline-block;float:right"><a href="dept_form.jsp" class="text-white"><i class="fa fa-plus"></i> Add New</a></h1>
<br><br> 
  <!-- DataTales Example -->
  <div class="card shadow mb-4">

	<div class="card-body">
	  <div class="table-responsive">
		<table id="example" class="table table-hover data_table" width="100%"> 
		<thead><!-- Design End -->
  <tr class="tbl-dsg">
    <td width="134"><div align="center"><strong>SL. No.</strong></div></td><td width="158"><div align="center"><strong>Name</strong></div></td>
    <td width="199"><div align="center"><strong>Action</strong></div></td>
  </tr>
  </thead>
<%@page import="java.sql.*"%>
<%@page import="exam.dbconnect"%>
<jsp:useBean id="s" class="exam.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>
<%
int sl=0;
ResultSet rs=s.stm.executeQuery("select * from department_details");
while(rs.next())
{
sl++;
int did=rs.getInt("dept_id");
%>
  <tr>
    <td><div align="center"><%=sl%></div></td>
    <td><div align="center"><%=rs.getString("dept_name")%></div></td>
    <td><div align="center"><a href="dept_edit.jsp?id=<%=did%>"title="Edit" class="btn btn-primary"><i class="fa fa-edit"></i></a>  <a onClick="return confirm('Are you sure..?')" href="deptt_delete.jsp?id=<%=did%>" title="Delete" class="btn btn-danger"><i class="fa fa-trash"></i></a> </div></td>
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
  	out.println("<script>alert('Invalid Action. Please Re-Login');document.location='../sessionreset.jsp';</script>");
  }
}
else
{
out.println("<script>alert('Your Session Expired. Please Re-Login');document.location='../index.jsp';</script>");
}
%>
<!-- Session Validator -->