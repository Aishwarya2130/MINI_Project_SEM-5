<title>Processing..</title>
<%@page import="java.sql.*"%>
<%@page import="exam.dbconnect"%>
<jsp:useBean id="s" class="exam.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>
<%
String chk = request.getParameter("Submit");
if (chk == null) {
    out.println("<script>history.back();</script>");
} else {
    String id = request.getParameter("fid");
    String a = request.getParameter("st");
    String b = request.getParameter("did");
    String c = request.getParameter("em");
    String d = request.getParameter("tf");
    String newAmount = request.getParameter("am");
    String f = request.getParameter("ut");
    String g = request.getParameter("pd");
    String h = request.getParameter("pt");

    // Get the previous amount from the database
    ResultSet rs = s.stm.executeQuery("SELECT amount FROM fees WHERE fid='" + id + "'");
    int prevAmount = 0;
    if (rs.next()) {
        prevAmount = Integer.parseInt(rs.getString("amount"));  // Convert to integer
    }

    // Add the previous amount to the new amount
    int updatedAmount = prevAmount + Integer.parseInt(newAmount);

    // Update the database with the new amount
    int z = s.stm.executeUpdate("UPDATE fees SET st_name='" + a + "', dept='" + b + "', email='" + c + "', total_fees='" + d + "', amount='" + updatedAmount + "', utr='" + f + "', paid_date='" + g + "', paid_time='" + h + "' WHERE fid='" + id + "'");

    out.println("<script>alert('Fees Updated');document.location='fees_view.jsp';</script>");
}
%>
