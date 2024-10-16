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
<jsp:include page="val.jsp"></jsp:include>
<form id="WFS_Riz" name="form1" method="post" action="stud_reg.jsp">

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
	    <label for="even_name"> <strong>Sem</strong></label>
      <select class="validate[required] form-control" name="sem" id="sem">
          <option>I</option>
          <option>II</option>
          <option>III</option>
          <option>IV</option>
          <option>V</option>
          <option>VI</option>
		  <option>VII</option>
		  <option>VIII</option>
        </select>
</div>
	  
		<div class="form-group" style="width:90%">
	    <label for="even_name"> <strong>Reg No</strong></label>
        <input class="validate[required,length[10,10]] form-control" autocomplete="off" name="strg" type="text" id="strg">
      
	  </div>
	  
      <div class="form-group" style="width:90%">
	  <label for="even_name"> <strong>First Name</strong></label>
      <input class="validate[required,custom[onlyLetter] form-control" autocomplete="off" name="fn" type="text" id="fn" >
      </div>
	  
	 
	  
	  <div class="form-group" style="width:90%">
	  <label for="even_name"> <strong>Last Name</strong></label>
      <input class="validate[required,custom[onlyLetter]] form-control" autocomplete="off" name="ln" type="text" id="ln">
      </div>
	  
	  <div class="form-group" style="width:90%">
	  <label for="even_name"> <strong>Mobile No</strong></label>
      <input class="validate[required,custom[mobile]] form-control" autocomplete="off" name="mb" type="text" id="mb">
      </div>
	  
	  <div class="form-group" style="width:90%">
	  <label for="even_name"> <strong>Email</strong></label>
      <input class="validate[required,custom[email]] form-control" autocomplete="off" name="em" type="text" id="em">
      </div>
	  
	  <div class="form-group" style="width:90%">
	  <label for="even_name"> <strong>Total Fees</strong></label>
      <input class="validate[required,custom[onlyNumber]] form-control" autocomplete="off" name="tf" type="text" id="tf">
      </div>
	  
	 
      <div align="center">
             <input type="submit" class="btn btn-primary" name="Submit" value="Submit">
             <input type="reset" class="btn btn-secondary" name="Reset" value="Reset">
	  </div>
</form>
<script>
function validateForm() {
    const email = document.getElementById('em').value;
    if (!email.endsWith('@gmail.com')) {
        alert('Email must end with @gmail.com');
        return false; // Prevent form submission
    }
    return true; // Allow form submission
}
</script>
</div>
       </div>
       </div>
</div> 
<!-- /.container-fluid -->
<jsp:include page="footer.jsp"></jsp:include>
