<!-- Session Validator -->
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session.getAttribute("uname")!=null)
{
%>
<!-- Session Validator -->

<!-- Top Design Start-->
<jsp:include page="meta.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<div class="container-fluid">

  
	<h1 class="h3 mb-2 text-gray-800" style="display:inline-block;">Security Question</h1>
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
String un=session.getAttribute("uname").toString();
ResultSet rs=s.stm.executeQuery("select * from login where username='"+un+"'");
rs.next();
String qst=rs.getString("s_question");
%>
<form id="WFS_Riz" name="form1" method="post" action="secure.jsp">
<input type="hidden" value="<%=un%>" name="uname">      
      <div class="form-group" style="width:90%">
	  <label for="even_name"><strong>Security Question</strong></label>
       <select class="validate[required] form-control" name="sq" id="sq">
	    <% if(qst.equals("-")) { %>
        <option value="">-- Select New Question --</option>
		<% } else { %><option><%=qst%></option> <option value="">-- Select New Question --</option> <% } %>
	    <option>What is your Pet Name?</option>
        <option>What is your fav. Food?</option>
        <option>Where did you born?</option>
        <option>What is your mother name?</option>
      </select>
</div>
	 
	 <div class="form-group" style="width:90%">
	  <label for="even_name"><strong>Security Answer <font size="2" color="#666666">[Erase and Write New Answer]</font></strong></label>
      <input class="validate[required] form-control" name="sa" value="<%=rs.getString("s_answer")%>" type="password" id="sa">
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
<!-- Session Validator -->
<%
}
else
{
out.println("<script>alert('Your Session Expired');document.location='../index.jsp';</script>");
}
%>
<!-- Session Validator -->