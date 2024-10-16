<!-- Top Design Start-->
<jsp:include page="meta.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<div class="container-fluid">

  
	<h1 class="h3 mb-2 text-gray-800" style="display:inline-block;">No Dues</h1>
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
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<jsp:include page="val.jsp"></jsp:include>
<%
	Date d=new Date();
	SimpleDateFormat sd=new SimpleDateFormat("dd-MM-yyyy");
	sd.setTimeZone(TimeZone.getTimeZone("IST"));
	String dt=sd.format(d);
%>
<%
String did=request.getParameter("id");
if(did==null)
{
out.println("<script>history.back();</script>");
}
else
{
ResultSet rs=s.stm.executeQuery("select * from no_dues where nd_id='"+did+"'");
rs.next();
%>
<form id="WFS_Riz" name="form1" method="post" action="dues_update.jsp">
<input name="did" type="hidden" value="<%=did%>">
 <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Student Id</strong></label>
   <input class="validate[required] form-control" readonly="" name="st"  value="<%=rs.getString("st_id")%>"type="text" id="st">
   </div>
  
  <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Date</strong></label>
      <input name="nd"  class="form-control" readonly="" value="<%=rs.getString("ndate")%>"type="text" id="nd">
	  </div>
	  
	  <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Status</strong></label>
      <input class="validate[required] form-control" name="sa" value="<%=rs.getString("status")%>"type="text" id="sa">
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