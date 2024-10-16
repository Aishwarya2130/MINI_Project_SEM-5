<!-- Session Validator -->
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session.getAttribute("uname")!=null)
{
	if(session.getAttribute("utype").equals("admin"))
	{
%>
<!-- Session Validator -->

<jsp:include page="meta.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<div class="container-fluid">

  
	<h1 class="h3 mb-2 text-gray-800" style="display:inline-block;">Student Details</h1>
	</br></br>
		 <div class="row">
	 	<div class="container">
  <div class="card shadow mb-4">

<div class="card-body">

<%@page import="java.sql.*"%>
<%@page import="exam.dbconnect"%>
<jsp:useBean id="s" class="exam.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%
	Date d=new Date();
	SimpleDateFormat sd=new SimpleDateFormat("yyyy");
	sd.setTimeZone(TimeZone.getTimeZone("IST"));
	String cyr=sd.format(d);
	int mage=18;
	int yr=Integer.parseInt(cyr);
	int mxyr=yr-mage;
%>
<form id="WFS_Riz" name="form1" method="post" action="stud_insert.jsp">

    <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Dept.ID</strong></label>
          <select class="validate[required] form-control" name="did" id="did">
		  <option value="">-- Select Depapartment --</option>
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
	    <label for="even_name"> <strong>Reg No</strong></label>
        <input class="validate[required,length[10,10]] form-control" name="strg" type="text" id="strg">
      
	  </div>
	  
      <div class="form-group" style="width:90%">
	  <label for="even_name"> <strong>First Name</strong></label>
      <input class="validate[required,custom[onlyLetter]] form-control" name="fn" type="text" id="fn">
      </div>
	  
	  <div class="form-group" style="width:90%">
	  <label for="even_name"> <strong>Middle Name</strong></label>
      <input class="validate[required,custom[onlyLetter]] form-control" name="mn" type="text" id="mn">
      </div>
	  
	  <div class="form-group" style="width:90%">
	  <label for="even_name"> <strong>last Name</strong></label>
      <input class="validate[required,custom[onlyLetter]] form-control" name="ln" type="text" id="ln">
      </div>
	  
	  <div class="form-group" style="width:90%">
	  <label for="even_name"> <strong>Mother Name</strong></label>
      <input class="validate[required,custom[onlyLetter]] form-control" name="mtn" type="text" id="mtn">
      </div>
	  
	  <div class="form-group" style="width:90%">
	  <label for="even_name"> <strong>DOB</strong></label>
      <input name="dob" class="form-control" required max="<%=mxyr%>-12-31" type="date" id="dob">
      </div>
	  
	  <div class="form-group" style="width:90%">
	  <label for="even_name"> <strong>Mobile No</strong></label>
      <input class="validate[required,custom[mobile]] form-control" name="mb" type="text" id="mb">
      </div>
	  
	  <div class="form-group" style="width:90%">
	  <label for="even_name"> <strong>Email</strong></label>
      <input class="validate[required,custom[email]] form-control" name="em" type="text" id="em">
      </div>
	  
	  <div class="form-group" style="width:90%">
	  <label for="even_name"> <strong>City</strong></label>
      <input class="validate[required] form-control" name="ct" type="text" id="ct">
      </div>
	  
      <div align="center">
             <input type="submit" class="btn btn-primary" name="Submit" value="Submit">
             <input type="reset" class="btn btn-secondary" name="Reset" value="Reset">
	  </div>
</form>
</div>
       </div>
       </div>
</div> 
<!-- /.container-fluid -->
<jsp:include page="footer.jsp"></jsp:include>
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