<!-- Top Design Start-->
<jsp:include page="meta.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<div class="container-fluid">

  
	<h1 class="h3 mb-2 text-gray-800" style="display:inline-block;">Document Details</h1>
	</br></br>
		 <div class="row">
	 	<div class="container">
  <div class="card shadow mb-4">

<div class="card-body">
<!-- Top Design End-->

<title>document details</title>
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
ResultSet rs=s.stm.executeQuery("select * from document_details where d_id='"+did+"'");
rs.next();
%>
<form id="WFS_Riz" name="form1" method="post" action="dcmnt_update.jsp">
<input name="did" type="hidden" value="<%=did%>">
  <div class="form-group" style="width:90%">
	  <label for="even_name"><strong>Student ID</strong></label>
      <input name="stid"  class="form-control" readonly="" value="<%=rs.getString("st_id")%>"type="text" id="stid">
   </div>
   
   <div class="form-group" style="width:90%">
	  <label for="even_name"><strong>Document Name</strong></label>
      <input class="validate[required] form-control" name="dn" value="<%=rs.getString("d_name")%>" type="text" id="dn">
   </div>
   
   <div class="form-group" style="width:90%">
	  <label for="even_name"><strong>Document Type</strong></label>
      <input class="validate[required] form-control" name="dt"  value="<%=rs.getString("d_type")%>"type="text" id="dt">
    </div>
	
	<div class="form-group" style="width:90%">
	  <label for="even_name"><strong>Return Date</strong></label>
      <input name="rd" class="form-control" readonly="" value="<%=rs.getString("r_date")%>"type="text" id="rd">
   </div>
   
   <div class="form-group" style="width:90%">
	  <label for="even_name"><strong>Status</strong></label>
      <input class="validate[required] form-control" name="st"  value="<%=rs.getString("status")%>"type="text" id="st">
   </div>
   
           <div align="center">
          <input type="submit" class="btn btn-primary" name="Submit" value="Submit">        
          <input type="reset" class="btn btn-secondary" name="Reset" value="Reset">      
      </div></td>
    </tr>
	<%
	}
	%>
  </table>
</form>
<!-- Bottom Design Start-->
</div>
       </div>
       </div>
</div> 
<!-- /.container-fluid -->
<jsp:include page="footer.jsp"></jsp:include>

<!-- Bottom Design End-->
