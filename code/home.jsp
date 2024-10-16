<!-- Session Validator -->
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session.getAttribute("uname")!=null)
{
%>
<!-- Session Validator -->
<jsp:include page="meta.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<!-- Begin Page Content -->
<div class="container-fluid">
  <div class="row">

	<!-- Earnings (Monthly) Card Example -->
	<div class="col-xl-12 col-md-6 mb-4">
	  <div class="card border-left-primary shadow h-100 py-2">
		<div class="card-body">
		  <div class="row no-gutters align-items-center">
			<div class="col mr-2">
			  <h4>Welcome to Admin Panel</h4>
			 <center> <img src="../wfs_tmp/img/admin.jpg" width="80%"></center>
			</div>
		  </div>
		</div>
	  </div>
	</div>
	<!--<div class="col-md-12" style="text-align:center;">
			<img src="img/admin_logo.png">
		</div> -->
  </div>
</div>
<!-- /.container-fluid -->

</div>
      <!-- End of Main Content -->
<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="x-script.jsp"></jsp:include>
<!-- Session Validator -->
<%
}
else
{
out.println("<script>alert('Your Session Expired');document.location='../index.jsp';</script>");
}
%>
<!-- Session Validator -->