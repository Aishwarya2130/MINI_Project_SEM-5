<!-- Session Validator -->
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session.getAttribute("uname")!=null)
{
	if(session.getAttribute("utype").equals("admin"))
	{
%>
<!-- Session Validator -->

<!-- Top Design Start-->
<jsp:include page="meta.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<div class="container-fluid">
  
	<h1 class="h3 mb-2 text-gray-800" style="display:inline-block;">Fees Details</h1>
	</br></br>
		 <div class="row">
	 	<div class="container">
  <div class="card shadow mb-4">

<div class="card-body">
<!-- Top Design End-->

<%@ page import="java.sql.*" %>
<%@ page import="exam.dbconnect" %>
<jsp:useBean id="s" class="exam.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>

<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%
SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
Date d = new Date();
sd.setTimeZone(TimeZone.getTimeZone("IST"));
String Today = sd.format(d);
%>
<%
SimpleDateFormat sd1 = new SimpleDateFormat("hh:mm:ss");
Date da = new Date();
sd1.setTimeZone(TimeZone.getTimeZone("IST"));
String time = sd1.format(da);
%>

<%
    // Get the registration number from the request
    String regno = request.getParameter("regno");
    String fname = "", mname = "", lname = "", dept = "", totalFees = "", email = "", pendingFees = "-";

    // Query the student details including email using the registration number
    if (regno != null && regno.trim().length() > 0) {
        ResultSet rs = s.stm.executeQuery("SELECT sd.fname, sd.mname, sd.lname, dd.dept_name, sd.total_fees, sd.email FROM student_details sd JOIN department_details dd ON sd.dept_id = dd.dept_id WHERE sd.st_regno = '" + regno + "'");

        if (rs.next()) {
            fname = rs.getString("fname");
            mname = rs.getString("mname");
            lname = rs.getString("lname");
            dept = rs.getString("dept_name");
            totalFees = rs.getString("total_fees");
            email = rs.getString("email"); // Fetching the email address
        }
    }
%>

<form id="WFS_Riz" name="form1" method="post" action="fees_insert.jsp">
    <!-- Student Name Field (Read-Only) -->
    <div class="form-group" style="width:90%">
        <label for="even_name"> <strong>Student Name</strong></label>
        <input class="form-control" type="text" value="<%=fname + ' ' + lname%>" name="st" id="st" readonly>
    </div>

    <!-- Department Field (Read-Only) -->
    <div class="form-group" style="width:90%">
        <label for="even_name"> <strong>Dept</strong></label>
        <input class="form-control" type="text" value="<%=dept%>" name="did" id="did" readonly>
    </div>

    <!-- Email Field (Read-Only) -->
    <div class="form-group" style="width:90%">
        <label for="even_name"> <strong>Email</strong></label>
        <input class="form-control" type="email" value="<%=email%>" name="em" id="em" readonly>
    </div>

    <!-- Total Fees (Read-Only) -->
    <div class="form-group" style="width:90%">
        <label for="even_name"> <strong>Total Fees</strong></label>
        <input class="form-control" type="text" value="<%=totalFees%>" name="tf" id="tf" readonly>
    </div>

    <!-- Amount (User Input) -->
   <div class="form-group" style="width:90%">
    <label for="am"> <strong>Amount</strong></label>
    <input class="validate[required,custom[onlyNumber]] form-control" 
           autocomplete="off" 
           name="am" 
           type="number" 
           id="am" 
           min="0" 
           required>
</div>

<!-- UTR No. (User Input) -->
<div class="form-group" style="width:90%">
    <label for="ut"> <strong>UTR No.</strong></label>
    <input class="validate[required,custom[onlyNumber],length[12,12]] form-control" 
           autocomplete="off" 
           name="ut" 
           type="text" 
           id="ut" 
           pattern="\d{12}" 
           maxlength="12" 
           minlength="12" 
           required>
    <small class="form-text text-muted">Please enter exactly 12 digits.</small>
</div>



    <!-- Paid Date (Read-Only) -->
    <div class="form-group" style="width:90%">
        <label for="even_name"> <strong>Paid Date</strong></label>
        <input name="pd" class="form-control" value="<%=Today%>" readonly type="text" id="pd">
    </div>

    <div class="form-group" style="width:90%">
        <label for="even_name"> <strong>Paid Time</strong></label>
        <input name="pt" class="form-control" value="<%=time%>" readonly type="text" id="pt">
    </div>

    <div align="center">
        <input type="submit" class="btn btn-primary" name="Submit" value="Submit">
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
  	out.println("<script>alert('Invalid Action. Please Re-Login');document.location='../sessionreset.jsp';</script>");
  }
}
else
{
out.println("<script>alert('Your Session Expired. Please Re-Login');document.location='../index.jsp';</script>");
}
%>
<!-- Session Validator -->