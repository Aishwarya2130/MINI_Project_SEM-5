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

  <h1 class="h3 mb-2 text-gray-800" style="display:inline-block;font-size: 20px;">Feedback Details</h1>
  	<!-- <h1 class="btn bg-success  text-white shadow" style="display:inline-block;float:right"><a href="feedback_form.jsp" class="text-white"><i class="fa fa-plus"></i> Add New</a></h1> -->
<br><br> 
  <!-- DataTales Example -->
  <div class="card shadow mb-4">

	<div class="card-body">
	  <div class="table-responsive">
		<table id="example" class="table table-hover data_table" width="100%"> 
		<thead><!-- Design End -->
  <tr class="tbl-dsg">
    <td width="86"><div align="center"><strong>Sl. No.</strong></div></td>
    <td width="86"><div align="center"><strong> From </strong></div></td>
    <td width="86"><div align="center"><strong> To</strong></div></td>
    <td width="93"><div align="center"><strong>Feedback</strong></div></td>
    <td width="78"><div align="center"><strong>Rating</strong></div></td>
    <td width="82"><div align="center"><strong>Date</strong></div></td>
    <td width="90"><div align="center"><strong>Status</strong></div></td>
    <!-- <td width="105"><div align="center"><strong>Action</strong></div></td> -->
  </tr>
  </thead>
<%@page import="java.sql.*"%>
<%@page import="exam.dbconnect"%>
<jsp:useBean id="s" class="exam.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>
<%
int sl=0;
ResultSet rs=s.stm.executeQuery("select * from feedback f,student_details st,staff_details s where f.f_from=st.st_id and f.f_to=s.s_id");
while(rs.next())
{
sl++;
int fid=rs.getInt("f_id");
%>
<tbody>
  <tr>
    <td><div align="center"><%=sl%></div></td>
    <td><div align="center"><%=rs.getString("fname")+" "+rs.getString("lname")%></div></td>
    <td><div align="center"><%=rs.getString("s_fname")+" "+rs.getString("s_lname")%></div></td>
    <td><div align="center"><%=rs.getString("feedback")%></div></td>
    <td><div align="center"><%=rs.getString("rating")%></div></td>
    <td><div align="center"><%=rs.getString("fdate")%></div></td>
    <td><div align="center"><%=rs.getString("status")%></div></td>
    <!-- <td><div align="center"><a href="feedback_edit.jsp?id=<%=fid%>" title="Edit" class="btn btn-primary"><i class="fa fa-edit"></i></a>  <a onClick="return confirm('Are you sure..?')" href="feedback_delete.jsp?id=<%=fid%>" title="Delete" class="btn btn-danger"><i class="fa fa-trash"></i></a> </div></td> -->
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