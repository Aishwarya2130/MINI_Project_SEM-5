<!-- Session Validator -->
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session.getAttribute("uname")!=null)
{
%>
<!-- Session Validator -->

<!-- Top Design Start-->
<jsp:include page="meta.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<div class="container-fluid">

  
	<h1 class="h3 mb-2 text-gray-800" style="display:inline-block;">Staff Details</h1>
	</br></br>
		 <div class="row">
	 	<div class="container">
  <div class="card shadow mb-4">

<div class="card-body">
<!-- Top Design End-->
<%@page import="java.sql.*"%>
<%@page import="exam.dbconnect"%>
<jsp:useBean id="s" class="exam.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>
<jsp:include page="val.jsp"></jsp:include>
<form id="WFS_Riz" form name="form1" method="post" action="staff_insert.jsp">
  
  <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Dept.ID</strong></label>
	  <select class="validate[required] form-control" name="did" id="did">
	  <option>-- Select Department --</option>
	  <%
	  ResultSet rs=s.stm.executeQuery("select * from department_details");
	  while(rs.next())
	  {
	  %>
	  <option value="<%=rs.getInt("dept_id")%>"><%=rs.getString("dept_name")%></option>
	  <%
	  }
	  %>
	  </select>
	  </div>
	  
	  <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>First Name</strong></label>
	        <input class="validate[required,custom[onlyLetter]] form-control" name="fn" type="text" id="fn">
			</div>
			
			<div class="form-group" style="width:90%">
	<label for="even_name"> <strong>last Name</strong></label>   
      <input class="validate[required,custom[onlyLetter]] form-control" name="ln" type="text" id="ln">
   </div>
   
   <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Mobile</strong></label>
      <input class="validate[required,custom[mobile]] form-control"  name="mb" type="text" id="mb">
   </div>
   
   <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>City</strong></label>
      <input class="validate[required] form-control" name="ct" type="text" id="ct">
   </div>
   
   <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Email</strong></label>
      <input class="validate[required,custom[email]] form-control" name="eml" type="text" id="eml">
   </div>
   
       <div align="center">
        <input type="submit" class="btn btn-primary"name="Submit" value="Submit">
        <input type="reset" class="btn btn-secondary" name="Reset" value="Reset">      
      </div>
</form>
<!-- Bottom Design Start-->
</div>
       </div>
       </div>
</div> 
<!-- /.container-fluid -->
<jsp:include page="footer.jsp"></jsp:include>

<!-- Bottom Design End-->
<!-- Session Validator -->
<%
}
else
{
out.println("<script>alert('Your Session Expired');document.location='../index.jsp';</script>");
}
%>
<!-- Session Validator -->