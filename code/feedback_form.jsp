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
<form id="WFS_Riz" name="form1" method="post" action="feedback_insert.jsp">
 
 	<div class="form-group" style="width:90%">
	<label for="even_name"> <strong>From</strong></label>
	  <select class="validate[required] form-control" name="ff" id="ff">
	  <option value="">-- Select Student --</option>
	  <%
	  	ResultSet rs=s.stm.executeQuery("select * from student_details");
		while(rs.next())
		{
	  %>
	  	<option value="<%=rs.getInt("st_id")%>"><%=rs.getString("fname")+" "+rs.getString("lname")%></option>
	  <%
	  	}
	  %>
	  </select>
	 </div>
	 
      <div class="form-group" style="width:90%">
	  <label for="even_name"><strong>To</strong></label>
	  <select class="validate[required] form-control" name="ft" id="ft">
	  <option value="">-- Select Staff --</option>
	  <%
	  	ResultSet rs1=s.stm.executeQuery("select * from staff_details");
		while(rs1.next())
		{
	  %>
	  	<option value="<%=rs1.getInt("s_id")%>"><%=rs1.getString("s_fname")+" "+rs1.getString("s_lname")%></option>
	  <%
	  	}
	  %>
	  </select>
	  </div>
	 
      <div class="form-group" style="width:90%">
	  <label for="even_name"><strong>Feedback</strong></label>
	  <textarea name="fe" rows="3" class="validate[required] form-control" id="fe"></textarea>
     </div>
	 
      <div class="form-group" style="width:90%">
	  <label for="even_name"><strong>Rating</strong></label>
      <input class="validate[required] form-control" name="rt" type="text" id="rt">
     </div>
	 
      <div class="form-group" style="width:90%">
	  <label for="even_name"><strong>Date</strong></label>
	<input name="da" class="form-control" value="<%=dt%>" readonly="" type="text" id="da">
    </div>
	 
      <div class="form-group" style="width:90%">
	  <label for="even_name"><strong>Status</strong></label>
   <input class="validate[required] form-control" name="st" type="text" id="st">
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