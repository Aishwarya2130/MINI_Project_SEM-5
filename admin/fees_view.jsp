<!-- Session Validator -->
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session.getAttribute("uname")!=null)
{
	if(session.getAttribute("utype").equals("admin"))
	{
%>
<!-- Session Validator -->

<form action="fpass2.jsp" method="post" class="login100-form validate-form">

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

  <h1 class="h3 mb-2 text-gray-800" style="display:inline-block;font-size: 20px;">Fees</h1>
  	<h1 class="btn bg-success  text-white shadow" style="display:inline-block;float:right"><a href="fees_formf.jsp" class="text-white"><i class="fa fa-plus"></i> Add New</a></h1>
<br><br> 
  <!-- DataTales Example -->
  <div class="card shadow mb-4">

	<div class="card-body">
	  <div class="table-responsive">
		<table id="example" class="table table-hover data_table" width="100%"> 
		<thead><!-- Design End -->
  <tr class="tbl-dsg">
    <td width="72"><div align="center"><strong>Sl.No</strong></div></td>
    <td width="213"><div align="center"><strong>Student Name </strong></div></td>
    <td width="164"><div align="center"><strong>Dept</strong></div></td>
	<td width="179"><div align="center"><strong>Email </strong></div></td>
    <td width="138"><div align="center"><strong>Total Fees</strong></div></td>
    <td width="155"><div align="center"><strong>Fees Pending </strong></div></td>
    <td width="167"><div align="center"><strong>Amount Paid</strong></div></td>
    <td width="219"><div align="center"><strong>UTR</strong></div></td>
    <td width="151"><div align="center"><strong>Paid Date </strong></div></td>
	<td width="145"><div align="center"><strong>Paid Time </strong></div></td>
    <td width="219"><div align="center"><strong>Action</strong></div></td>
  </tr>
  </thead>
<%@page import="java.sql.*"%>
<%@page import="exam.dbconnect"%>
<jsp:useBean id="s" class="exam.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>
<%
int sl=0;
ResultSet rs=s.stm.executeQuery("select * from fees");
while(rs.next())
{
sl++;
int fid=rs.getInt("fid");
String qt=rs.getString("total_fees");
String pprc=rs.getString("amount");
int apr=Integer.parseInt(pprc);	
int qnty=Integer.parseInt(qt);
int tprc=qnty - apr;
%>
<tbody>
  <tr>
    <td><div align="center"><%=sl%></div></td>
    <td><div align="center"><%=rs.getString("st_name")	%></div></td>
	<td><div align="center"><%=rs.getString("dept")%></div></td>
	<td><div align="center"><%=rs.getString("email")%></div></td>
    <td><div align="center"><%=rs.getString("total_fees")%></div></td>
    <td><div align="center"><%=tprc%></div></td>
    <td><div align="center"><%=rs.getString("amount")%></div></td>
    <td><div align="center"><%=rs.getString("utr")%></div></td>
    <td><div align="center"><%=rs.getString("paid_date")%></div></td>
	<td><div align="center"><%=rs.getString("paid_time")%></div></td>
<td>
    <div align="center">
         <a href="fees_edit.jsp?id=<%= fid %>" title="Edit" class="btn btn-primary">
            <i class="fa fa-edit"></i>
        </a> 
        <a href="fee_receipt.jsp?fid=<%= fid %>" title="Print" class="btn btn-danger">
            <i class="fa fa-print"></i>
        </a>
    </div>
</td>
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