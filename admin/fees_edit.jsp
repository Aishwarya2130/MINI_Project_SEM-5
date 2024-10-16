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

    // Get the 'fid' parameter from the request
    String fid = request.getParameter("id");

    if (fid == null) {
        out.println("<script>history.back();</script>"); // Go back if 'fid' is not provided
    } else {
        // Query the 'fees' table based on 'fid'
        ResultSet rs = s.stm.executeQuery("SELECT * FROM fees WHERE fid='" + fid + "'");
        
        // Move to the first row of the result
        if (rs.next()) {
           
String qt=rs.getString("total_fees");
String pprc=rs.getString("amount");
int apr=Integer.parseInt(pprc);	
int qnty=Integer.parseInt(qt);
int tprc=qnty - apr;

%>
<form id="WFS_Riz" name="form1" method="post" action="fees_update.jsp">
    <!-- Hidden field for 'fid' -->
    <input name="fid" type="hidden" value="<%=fid%>">

    <!-- Student Name (Read-Only) -->
    <div class="form-group" style="width:90%">
        <label for="even_name"><strong>Student Name</strong></label>
        <input class="form-control" name="st" value="<%=rs.getString("st_name")%>" type="text" id="st" readonly>
    </div>

    <!-- Department (Read-Only) -->
    <div class="form-group" style="width:90%">
        <label for="even_name"><strong>Department</strong></label>
        <input class="form-control" name="did" value="<%=rs.getString("dept")%>" type="text" id="did" readonly>
    </div>
<!-- Email Field (Read-Only) -->
    <div class="form-group" style="width:90%">
        <label for="even_name"> <strong>Email</strong></label>
        <input class="form-control" type="email" value="<%=rs.getString("email")%>" name="em" id="em" readonly>
    </div>
    <!-- Total Fees (Read-Only) -->
    <div class="form-group" style="width:90%">
        <label for="even_name"><strong>Total Fees</strong></label>
        <input class="form-control" name="tf" value="<%=rs.getString("total_fees")%>" type="text" id="tf" readonly>
    </div>

    <!-- Amount (Editable) - Difference between Total Fees and Amount Paid -->
    <div class="form-group" style="width:90%">
        <label for="even_name"><strong>Fees Pending</strong></label>
        <input class="form-control" name="ap" value="<%=tprc%>" readonly="" type="text" id="ap">
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
        <label for="even_name"><strong>Paid Date</strong></label>
        <input name="pd" class="form-control" value="<%=Today%>" readonly type="text" id="pd">
    </div>
	
	 <div class="form-group" style="width:90%">
        <label for="even_name"><strong>Paid Time</strong></label>
        <input name="pt" class="form-control" value="<%=time%>" readonly type="text" id="pt">
    </div>

    <div align="center">
        <input type="submit" class="btn btn-primary" name="Submit" value="Submit">
        <input type="reset" class="btn btn-secondary" name="Reset" value="Reset">
    </div>
</form>
<%
        } else {
            out.println("<script>alert('No record found for the given ID');history.back();</script>");
        }
    }
%>

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