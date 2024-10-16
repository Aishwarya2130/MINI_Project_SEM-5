<%@page import="java.sql.*"%>
<%@page import="exam.dbconnect"%>
<%
    response.setContentType("application/json");
    int stId = Integer.parseInt(request.getParameter("stid"));
    
    dbconnect s = new dbconnect();
    String query = "SELECT dept_id, dept_name FROM student_details WHERE st_id = ?";
    try (PreparedStatement stmt = s.conn.prepareStatement(query)) {
        stmt.setInt(1, stId);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            int deptId = rs.getInt("dept_id");
            String deptName = rs.getString("dept_name");
            out.print("{\"dept_id\":" + deptId + ", \"dept_name\":\"" + deptName + "\"}");
        } else {
            out.print("{\"dept_id\":null, \"dept_name\":\"\"}");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
