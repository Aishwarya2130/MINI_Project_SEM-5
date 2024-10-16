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
<%
String bid=request.getParameter("id");
if(bid==null)
{
out.println("<script>history.back();</script>");
}
else
{
ResultSet rs=s.stm.executeQuery("select * from bank where bid='"+bid+"'");
rs.next();
%>
<form id="WFS_Riz" name="form1" method="post" action="bank_update.jsp">
<input name="bid" type="hidden" value="<%=bid%>">
 <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Bank Name</strong></label>
   <input class="validate[required] form-control" name="bn"  value="<%=rs.getString("bname")%>"type="text" id="bn">
   </div>
   
   <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Account No.</strong></label>
      <input class="validate[required] form-control"name="an"  value="<%=rs.getString("b_acc")%>"type="text" id="an">
	  </div>
	  
      <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Account Holder</strong></label>
    <input class="validate[required] form-control" name="ah" value="<%=rs.getString("b_acc_holder")%>"type="text" id="ah">
	</div>
	
      <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>UPI ID</strong></label>
      <input class="validate[required] form-control" name="ui" value="<%=rs.getString("upi_id")%>"type="text" id="ui">
  </div>
  
  <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>UPI Pin</strong></label>
      <input name="up"  class="form-control"  value="<%=rs.getString("upi_pin")%>"type="text" id="up">
	  </div>
	  
	  <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Amount</strong></label>
      <input class="validate[required] form-control" readonly="" name="at" value="<%=rs.getString("amount")%>"type="text" id="at">
   </div>
   
   <div align="center">
          <input type="submit" class="btn btn-primary" name="Submit" value="Submit">      
          <input type="reset" class="btn btn-secondary" name="Reset" value="Reset">
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