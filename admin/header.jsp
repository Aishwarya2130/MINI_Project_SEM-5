 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>  

<style>
@media only screen and (min-width:768px) and (max-width:991px) {
   h1{
        display:none!important;
    }
  }
  @media only screen and (max-width:767px) {
   h1{
        display:none!important;
    }
  }
  @media only screen and (max-width:479px) {
   h1{
        display:none!important;
    }
  }
</style>
<div id="content-wrapper" class="d-flex flex-column">

  <!-- Main Content -->
  <div id="content">

	<!-- Topbar -->
	<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

	  <!-- Sidebar Toggle (Topbar) -->
	  <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
		<i class="fa fa-bars"></i>
	  </button>

	  <!-- Topbar Search -->
	  <h1  class="h3 mb-2 text-gray-800" style="color:#253257!important;">Admin Panel</h1>
	  <!-- Topbar Navbar -->
	  <ul class="navbar-nav ml-auto">

		
		<!-- Nav Item - Alerts -->
		
		<div class="topbar-divider d-none d-sm-block"></div><a onClick="return confirm('Are You Sure..?')" href="../logout.jsp" class="btn btn-warning"><i class="fa fa-lock"></i> Logout</a>
	<!--	<li class="nav-item dropdown no-arrow">
		<a class="dropdown-item" href="../logout.php" data-toggle="modal" data-target="#logoutModal">
			  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
			  Logout
			</a>
		</li> -->

  </ul>

</nav>
        <!-- End of Topbar -->