<!-- Top Design Start-->
<jsp:include page="meta.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<div class="container-fluid">

  
	<h1 class="h3 mb-2 text-gray-800" style="display:inline-block;">Assigned Subject</h1>
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
String asid=request.getParameter("id");
if(asid==null)
{
out.println("<script>history.back();</script>");
}
else
{
ResultSet rs=s.stm.executeQuery("select * from assigned_subject where as_id='"+asid+"'");
rs.next();
%>
<form id="WFS_Riz" name="form1" method="post" action="assigned_update.jsp">
<input name="asid" type="hidden" value="<%=asid%>">
   <div class="form-group" style="width:90%">
   <label for="even_name"><strong>Subject ID</strong></label>
      <input class="validate[required] form-control" name="sid" value="<%=rs.getString("sub_id")%>"type="text" id="sid">
  </div>
  
   <div class="form-group" style="width:90%">
	  <label for="even_name"><strong>Staff ID</strong></label>
      <input class="validate[required] form-control"  name="stid" value="<%=rs.getString("s_id")%>"type="text" id="stid">
	  </div>
	  
	   <div class="form-group" style="width:90%">
	  <label for="even_name"><strong>Assigned Date</strong></label>
      <input name="ad" class="form-control" readonly="" value="<%=rs.getString("a_date")%>"type="type" id="ad">
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
