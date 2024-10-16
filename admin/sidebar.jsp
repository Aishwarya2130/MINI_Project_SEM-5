<body id="page-top">
  <!-- Page Wrapper -->
  <div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
        <div class="sidebar-brand-icon">
			<i class="fas fa-users"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Admin</div>
      </a>
      <!-- Divider -->
      <hr class="sidebar-divider my-0">
      <!-- Nav Item - Dashboard -->
<%@page import="java.sql.*"%>
<%@page import="exam.dbconnect"%>
<jsp:useBean id="s" class="exam.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>
<jsp:include page="val.jsp"></jsp:include>
 <%
 	String un=session.getAttribute("uname").toString();
	ResultSet rs=s.stm.executeQuery("select * from login where username='"+un+"' and s_question='-' and s_answer='-'");
	if(!rs.next())
	{
 %>    
      <li class="nav-item active">
        <a class="nav-link" href="home.jsp">
          <i class="fas fa-fw fa-home"></i>
          <span>Home</span></a>
      </li>
      <!-- Divider -->
      <hr class="sidebar-divider">
	  
	   <li class="nav-item">
        <a class="nav-link" href="bank_view.jsp">
          <i class="fa fa-building"></i>
          <span>Bank</span></a>
      </li>
	  
	  <li class="nav-item">
        <a class="nav-link" href="fees_view.jsp">
          <i class="fa fa-building"></i>
          <span>Fees</span></a>
      </li>
	  
	  <!-- <li class="nav-item">
        <a class="nav-link" href="assigned_view.jsp">
          <i class="fa fa-building"></i>
          <span>Assigned Subject</span></a>
      </li> -->
	  
	   <li class="nav-item">
        <a class="nav-link" href="dept_view.jsp">
          <i class="fas fa-fw fa-graduation-cap"></i>
          <span>Department Details </span></a>
      </li>
	  
	  <li class="nav-item">
        <a class="nav-link" href="sub_view.jsp">
          <i class="fas fa-fw fa-book"></i>
          <span>Subject Details</span></a>
      </li>
	  
	  <li class="nav-item">
        <a class="nav-link" href="staff_view.jsp">
          <i class="fas fa-fw fa-user"></i>
          <span>HOD Details</span></a>
      </li>
	  
	  <li class="nav-item">
        <a class="nav-link" href="stud_view.jsp">
          <i class="fas fa-fw fa-users"></i>
          <span>Students Details </span></a>
      </li>
	  
	   <li class="nav-item">
        <a class="nav-link" href="sample.jsp">
          <i class="fas fa-fw fa-file"></i>
          <span>sample mail </span></a>
      </li>
	  
	  <li class="nav-item">
        <a class="nav-link" href="feedback_view.jsp">
          <i class="fas fa-fw fa-envelope"></i>
          <span>Feedbacks </span></a>
      </li> -->
	<%
	}
	%>  	
	 <li class="nav-item">
        <a class="nav-link" href="securityf.jsp">
          <i class="fas fa-fw fa-key"></i>
          <span>Security Question</span></a>
      </li>
	  
	  <li class="nav-item">
        <a class="nav-link" href="chngpassf.jsp">
          <i class="fas fa-fw fa-lock-open"></i>
          <span>Change Password</span></a>
      </li>
	  
	  <li class="nav-item">
        <a class="nav-link" onClick="return confirm('Are You Sure..?')"href="../logout.jsp">
          <i class="fas fa-fw fa-lock"></i>
          <span>Logout</span></a>
      </li>
	
	  
      <!-- Sidebar Toggler (Sidebar) -->
     <!--  <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div> -->

    </ul>
    <!-- End of Sidebar -->