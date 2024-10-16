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
<%
String sid=request.getParameter("id");
if(sid==null)
{
out.println("<script>history.back();</script>");
}
else
{
ResultSet rs=s.stm.executeQuery("select * from staff_details where s_id='"+sid+"'");
rs.next();
%>
<form id="WFS_Riz" name="form1" method="post" action="staff_update.jsp">
<input name="sid" type="hidden" value="<%=sid%>">
 <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Dept.ID</strong></label>
     <input name="did" class="form-control" readonly="" value="<%=rs.getString("dept_id")%>" type="text" id="did">
    </div>
	
	<div class="form-group" style="width:90%">
	<label for="even_name"> <strong>First Name</strong></label>
      <input class="validate[required,custom[onlyLetter]] form-control" name="fn" value="<%=rs.getString("s_fname")%>" type="text" id="fn">
   </div>
   
   <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>last Name</strong></label>
      <input class="validate[required,custom[onlyLetter]] form-control" name="ln" value="<%=rs.getString("s_lname")%>" type="text" id="ln">
 </div>
 
    <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Mobile</strong></label>
      <input class="validate[required,custom[mobile] form-control" name="mb" value="<%=rs.getString("mobile")%>" type="text" id="mb">
    </div>
	
	<div class="form-group" style="width:90%">
	<label for="even_name"> <strong>City</strong></label>
      <input class="validate[required] form-control" name="ct" value="<%=rs.getString("city")%>" type="text" id="ct">
    </div>
	
	<div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Email</strong></label>
      <input class="validate[required,custom[email]] form-control" name="eml" value="<%=rs.getString("email")%>" type="text" id="eml">
    </div>
	
	<div class="form-group" style="width:90%">
	<label for="even_name"> <strong>photo</strong></label>
      <input class="validate[required] form-control" name="ph" value="<%=rs.getString("photo")%>" type="text" id="ph">
   </div>
   
        <div align="center">
        <input type="submit" class="btn btn-primary"  name="Submit" value="Submit">
        <input type="reset"  class="btn btn-secondary" name="Reset" value="Reset">      
      </div>
	<%
	}
	%>
</form>
<!-- Bottom Design Start-->
</div>
       </div>
       </div>
</div> 
<!-- /.container-fluid -->
<jsp:include page="footer.jsp"></jsp:include>

<!-- Bottom Design End-->
