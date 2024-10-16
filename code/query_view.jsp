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

  <h1 class="h3 mb-2 text-gray-800" style="display:inline-block;font-size: 20px;">Query Details</h1>
  	<h1 class="btn bg-success  text-white shadow" style="display:inline-block;float:right"><a href="query_form.jsp" class="text-white"><i class="fa fa-plus"></i> Add New</a></h1>
<br><br> 
  <!-- DataTales Example -->
  <div class="card shadow mb-4">

	<div class="card-body">
	  <div class="table-responsive">
		<table id="example" class="table table-hover data_table" width="100%"> 
		<thead><!-- Design End -->
  <tr class="tbl-dsg">
    <td width="88"><div align="center"><strong>Query ID </strong></div></td>
    <td width="113"><div align="center"><strong>Query From </strong></div></td>
    <td width="92"><div align="center"><strong>Query To </strong></div></td>
    <td width="54"><div align="center"><strong>Query</strong></div></td>
    <td width="107"><div align="center"><strong>Asked Date</strong></div></td>
    <td width="86"><div align="center"><strong>Reply</strong></div></td>
    <td width="142"><div align="center"><strong>Replied Date </strong></div></td>
    <td width="121"><div align="center"><strong>Action</strong></div></td>
  </tr>
  </thead>
<%@page import="java.sql.*"%>
<%@page import="exam.dbconnect"%>
<jsp:useBean id="s" class="exam.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>
<%
int sl=0;
ResultSet rs=s.stm.executeQuery("select * from query q,student_details st,staff_details s where q.q_from=st.st_id and q.q_to=s.s_id");
while(rs.next())
{
sl++;
int qid=rs.getInt("q_id");
%>
<tbody>
  <tr>
    <td><div align="center"><%=sl%></div></td>
    <td><div align="center"><%=rs.getString("fname")+" "+rs.getString("lname")%></div></td>
    <td><div align="center"><%=rs.getString("s_fname")+" "+rs.getString("s_lname")%></div></td>
    <td><div align="center"><%=rs.getString("query")%></div></td>
    <td><div align="center"><%=rs.getString("a_date")%></div></td>
    <td><div align="center"><%=rs.getString("reply")%></div></td>
    <td><div align="center"><%=rs.getString("r_date")%></div></td>
    <td><div align="center"><a href="query_edit.jsp?id=<%=qid%>" title="Edit" class="btn btn-primary"><i class="fa fa-edit"></i></a>  <a onClick="return confirm('Are you sure..?')" href="query_delete.jsp?id=<%=qid%>" title="Delete" class="btn btn-danger"><i class="fa fa-trash"></i></a> </div></td>
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