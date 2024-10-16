<!-- Top Design Start-->
<jsp:include page="meta.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<div class="container-fluid">

  
	<h1 class="h3 mb-2 text-gray-800" style="display:inline-block;">Query Details </h1>
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
String qid=request.getParameter("id");
if(qid==null)
{
out.println("<script>history.back();</script>");
}
else
{
ResultSet rs=s.stm.executeQuery("select * from query where q_id='"+qid+"'");
rs.next();
%>
<form id="WFS_Riz" name="form1" method="post" action="query_update.jsp">
<input name="qid" type="hidden" value="<%=qid%>">
 <div class="form-group" style="width:90%">
	<label for="even_name"> <strong> Query From</strong></label>
     <input class="validate[required] form-control" readonly="" name="qf" value="<%=rs.getString("q_from")%>"type="text" id="qf">
   </div>
   
   <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Query To</strong></label>
      <input class="validate[required] form-control" readonly="" name="qt" value="<%=rs.getString("q_to")%>"type="text" id="qt">
    </div>
	
	<div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Query</strong></label>
      <input class="validate[required] form-control" name="qu" value="<%=rs.getString("query")%>"type="text" id="qu">
    </div>
	
	<div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Asked Date</strong></label>
      <input name="ad" class="form-control" value="<%=dt%>" readonly="" value="<%=rs.getString("a_date")%>"type="text" id="ad">
    </div>
	
	<div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Reply</strong></label>
      <input class="validate[required] form-control" name="rl" value="<%=rs.getString("reply")%>"type="text" id="rl">
    </div>
	
	<div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Replied Date</strong></label>
      <input name="rd" class="form-control" value="<%=dt%>" readonly="" value="<%=rs.getString("r_date")%>"type="text" id="rd">
    </div>
	
	<div align="center">
          <input type="submit" class="btn btn-primary" name="Submit" value="Submit">      
          <input type="reset"  class="btn btn-secondary"name="Reset" value="Reset">
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