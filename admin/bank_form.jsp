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

  
	<h1 class="h3 mb-2 text-gray-800" style="display:inline-block;">Bank Details</h1>
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
<form id="WFS_Riz" name="form1" method="post" action="bank_insert.jsp">
	 
      <div class="form-group" style="width:90%">
	  <label for="even_name"><strong>Bank Name</strong></label>
	  <input name="bn" class="validate[required] form-control" id="bn"></textarea>
     </div>
	 
      <div class="form-group" style="width:90%">
	  <label for="even_name"><strong>Bank Acc.No.</strong></label>
      <input class="validate[required] form-control" name="an" type="text" id="an">
     </div>
	 
      <div class="form-group" style="width:90%">
	  <label for="even_name"><strong>Account Holder</strong></label>
	<input name="ah" class="form-control" readonly="" value="UTKARSH MIND'S"  type="text" id="ah">
    </div>
	 
      <div class="form-group" style="width:90%">
	  <label for="even_name"><strong>UPI Id</strong></label>
   <input class="validate[required] form-control" name="ui" type="text" id="ui">
    </div>
	
	<!-- <div class="form-group" style="width:90%">
	  <label for="even_name"><strong>UPI Pin</strong></label>
   <input class="validate[required] form-control" name="up" type="text" id="up">
    </div>
	
	<div class="form-group" style="width:90%">
	  <label for="even_name"><strong>Amount</strong></label>
   <input class="validate[required] form-control" name="at" type="text" id="at">
    </div> -->
    
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