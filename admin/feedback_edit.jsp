<!-- Top Design Start-->
<jsp:include page="meta.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<div class="container-fluid">

  
	<h1 class="h3 mb-2 text-gray-800" style="display:inline-block;">Feedback Details</h1>
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
String fid=request.getParameter("id");
if(fid==null)
{
out.println("<script>history.back();</script>");
}
else
{
ResultSet rs=s.stm.executeQuery("select * from feedback where f_id='"+fid+"'");
rs.next();
%>
<form id="WFS_Riz" name="form1" method="post" action="feedback_update.jsp">
<input name="fid" type="hidden" value="<%=fid%>">
 <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>From</strong></label>
   <input class="validate[required] form-control" readonly="" name="ff"  value="<%=rs.getString("f_from")%>"type="text" id="ff">
   </div>
   
   <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>To</strong></label>
      <input class="validate[required] form-control" readonly="" name="ft"  value="<%=rs.getString("f_to")%>"type="text" id="ft">
	  </div>
	  
      <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Feedback</strong></label>
    <input class="validate[required] form-control" name="fe" value="<%=rs.getString("feedback")%>"type="text" id="fe">
	</div>
	
      <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Rating</strong></label>
      <input class="validate[required] form-control" name="rt" value="<%=rs.getString("rating")%>"type="text" id="rt">
  </div>
  
  <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Date</strong></label>
      <input name="da"  class="form-control" readonly="" value="<%=rs.getString("fdate")%>"type="text" id="da">
	  </div>
	  
	  <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Status</strong></label>
      <input class="validate[required] form-control" name="st" value="<%=rs.getString("status")%>"type="text" id="st">
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