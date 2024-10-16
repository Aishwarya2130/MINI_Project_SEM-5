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
<jsp:include page="val.jsp"></jsp:include>
<%
	Date d=new Date();
	SimpleDateFormat sd=new SimpleDateFormat("yyyy");
	sd.setTimeZone(TimeZone.getTimeZone("IST"));
	String cyr=sd.format(d);
	int mage=18;
	int yr=Integer.parseInt(cyr);
	int mxyr=yr-mage;
%>
<%
String sid=request.getParameter("id");
if(sid==null)
{
out.println("<script>history.back();</script>");
}
else
{
ResultSet rs=s.stm.executeQuery("select * from student_details where st_id='"+sid+"'");
rs.next();
%>
<form id="WFS_Riz" name="form1" method="post" action="stud_update.jsp">
<input name="sid" type="hidden" value="<%=sid%>">
 <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Dept.ID</strong></label>
   <input class="validate[required]" name="did" readonly="" value="<%=rs.getString("dept_id")%>" type="text" id="did">      
   </div>
   
   <div class="form-group" style="width:90%">
	    <label for="even_name"> <strong>Reg No</strong></label>
        <input class="validate[required,length[10,10]] form-control" name="strg" value="<%=rs.getString("st_regno")%>" type="text" id="strg">
      </div>
	  
	  <div class="form-group" style="width:90%">
	  <label for="even_name"> <strong>First Name</strong></label>
        <input class="validate[required,custom[onlyLetter]] form-control" name="fn" value="<%=rs.getString("fname")%>" type="text" id="fn">
      </div>
	  
	  <div class="form-group" style="width:90%">
	  <label for="even_name"> <strong>Middle Name</strong></label>
        <input class="validate[required,custom[onlyLetter]] form-control" name="mn" value="<%=rs.getString("mname")%>" type="text" id="mn">
     </div>
	 
	 <div class="form-group" style="width:90%">
	  <label for="even_name"> <strong>Last Name</strong></label>
        <input class="validate[required,custom[onlyLetter]] form-control" name="ln" value="<%=rs.getString("lname")%>" type="text" id="ln">
      </div>
	  
	  <div class="form-group" style="width:90%">
	  <label for="even_name"> <strong>Mother Name</strong></label>
        <input class="validate[required,custom[onlyLetter]] form-control" name="mtn" value="<%=rs.getString("mother_name")%>" type="text" id="mtn">
     </div>
	 
	  <div class="form-group" style="width:90%">
	  <label for="even_name"> <strong>DOB</strong></label>
        <input name="dob" required max="<%=mxyr%>-12-31 form-control" value="<%=rs.getString("dob")%>" type="date" id="dob">
     </div>
	 
	 <div class="form-group" style="width:90%">
	  <label for="even_name"> <strong>Mobile No</strong></label>
        <input class="validate[required,custom[mobile]] form-control" name="mb" value="<%=rs.getString("mob")%>" type="text" id="mb">
      </div>
	  
	  <div class="form-group" style="width:90%">
	  <label for="even_name"> <strong>Email</strong></label>
        <input class="validate[required,custom[email]] form-control" name="em" value="<%=rs.getString("email")%>" type="text" id="em">
     </div>
	 
	 <div class="form-group" style="width:90%">
	  <label for="even_name"> <strong>City</strong></label>
        <input class="validate[required] form-control" name="ct" value="<%=rs.getString("city")%>" type="text" id="ct">
      </div>
	  
	   <div class="form-group" style="width:90%">
	  <label for="even_name"> <strong>Photo</strong></label>
        <input class="validate[required] form-control" name="ph" value="<%=rs.getString("photo")%>" type="text" id="ph">
      </div>
	  
     <div align="center">
        <input type="submit" class="btn btn-primary" name="Submit" value="Submit">
        <input type="reset" class="btn btn-secondary" name="Reset" value="Reset">
      </div>
	<%
	}
	%>
</form>

</div>
       </div>
       </div>
</div> 
<!-- /.container-fluid -->
<jsp:include page="footer.jsp"></jsp:include>