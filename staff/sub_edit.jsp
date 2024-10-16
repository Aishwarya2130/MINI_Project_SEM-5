<!-- Top Design Start-->
<jsp:include page="meta.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<div class="container-fluid">

  
	<h1 class="h3 mb-2 text-gray-800" style="display:inline-block;">Subject Details</h1>
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
String sid=request.getParameter("id");
if(sid==null)
{
out.println("<script>history.back();</script>");
}
else
{
ResultSet rs=s.stm.executeQuery("select * from subject where sub_id='"+sid+"'");
rs.next();
%>
<form id="WFS_Riz" name="form1" method="post" action="sub_update.jsp">
<input name="sid" type="hidden" value="<%=sid%>">
  <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Subject Name</strong></label>
          <input class="validate[required] form-control" name="sn" value="<%=rs.getString("sub_name")%>" type="text" id="sn">
        </div>
    
	<div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Subject code</strong></label>
          <input class="validate[required] form-control" name="sc" value="<%=rs.getString("sub_code")%>" type="text" id="sc">
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

