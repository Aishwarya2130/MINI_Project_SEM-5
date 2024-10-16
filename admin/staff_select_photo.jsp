<!-- Top Design Start-->
<jsp:include page="meta.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<div class="container-fluid">

  
	<h1 class="h3 mb-2 text-gray-800" style="display:inline-block;">Staff Details |<a href="staff_view.jsp" onClick="return confirm('Are you sure?')" class="btn btn-danger btn-sm">Cancel</a></h1>
	</br></br>
		 <div class="row">
	 	<div class="container">
  <div class="card shadow mb-4">

<div class="card-body">
<!-- Top Design End-->
<%
String id=request.getParameter("id");
session.setAttribute("sid",id);

%>
<form id="WFS_Riz" form name="form1" enctype="multipart/form-data" method="post" action="staff_upload_photo.jsp">
   
   <div class="form-group" style="width:90%">
	<label for="even_name"> <strong>Photo</strong></label>
      <input class="validate[required] form-control" name="photo" type="file" id="photo">
   </div>
   
       <div align="center">
        <input type="submit" class="btn btn-primary"name="Submit" value="Submit">
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