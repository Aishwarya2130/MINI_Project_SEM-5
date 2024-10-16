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
<%@page import="java.sql.*"%>
<%@page import="exam.dbconnect"%>
<jsp:useBean id="s" class="exam.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>
 
<!-- Begin Page Content -->
<div class="container-fluid">

  <h1 class="h3 mb-2 text-gray-800" style="display:inline-block;font-size: 20px;">Bank Details</h1>
  <%
  ResultSet rs1=s.stm.executeQuery("select * from bank where b_acc_holder='SJPN Polytech'");
  if(!rs1.next())
  {
  %>
  	<h1 class="btn bg-success  text-white shadow" style="display:inline-block;float:right"><a href="bank_form.jsp" class="text-white"><i class="fa fa-plus"></i> Add New</a></h1>
  <% } %>
<br><br> 
  <!-- DataTales Example -->
  <div class="card shadow mb-4">

	<div class="card-body">
	  <div class="table-responsive">
		<table id="example" class="table table-hover data_table" width="100%"> 
		<thead><!-- Design End -->
  <tr class="tbl-dsg">
    <td width="86"><div align="center"><strong>Sl. No.</strong></div></td>
    <td width="86"><div align="center"><strong> Bank Name </strong></div></td>
    <td width="86"><div align="center"><strong> Account No.</strong></div></td>
    <td width="93"><div align="center"><strong>Account Holder</strong></div></td>
    <td width="78"><div align="center"><strong>UPI ID</strong></div></td>
    <td width="82"><div align="center"><strong>UPI Pin</strong></div></td>
    <td width="90"><div align="center"><strong>Amount</strong></div></td>
    <!-- <td width="105"><div align="center"><strong>Action</strong></div></td> -->
  </tr>
  </thead>
<%
int sl=0;
ResultSet rs=s.stm.executeQuery("select * from bank");
while(rs.next())
{
sl++;
int bid=rs.getInt("bid");
%>
<tbody>
  <tr>
    <td><div align="center"><%=sl%></div></td>
    <td><div align="center"><%=rs.getString("bname")%></div></td>
    <td><div align="center"><%=rs.getString("b_acc")%></div></td>
    <td><div align="center"><%=rs.getString("b_acc_holder")%></div></td>
    <td><div align="center"><%=rs.getString("upi_id")%></div></td>
    <td><div align="center"><%=rs.getString("upi_pin")%></div></td>
    <td><div align="center"><%=rs.getString("amount")%></div></td>
    <!-- <td><div align="center"><a href="bank_edit.jsp?id=<%=bid%>" title="Edit" class="btn btn-primary"><i class="fa fa-edit"></i></a>  <a onClick="return confirm('Are you sure..?')" href="bank_delete.jsp?id=<%=bid%>" title="Delete" class="btn btn-danger"><i class="fa fa-trash"></i></a> </div></td> -->
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