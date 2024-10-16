<%@ page import="java.sql.*" %>
<%@ page import="exam.dbconnect" %>
<jsp:useBean id="s" class="exam.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>

<!-- Session Validator -->
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session.getAttribute("uname") != null) {
    if(session.getAttribute("utype").equals("admin")) {
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Receipt</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }
        .receipt-container {
            max-width: 700px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            border-bottom: 2px solid #333;
            padding-bottom: 10px;
        }
        .logo-container {
            display: flex;
            align-items: center;
        }
        .logo {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin-right: 10px;
            object-fit: cover;
        }
        .company-info {
            flex: 1;
            text-align: right;
            margin-top: 0;
        }
        .company-info h4 {
            margin: 5px 0;
        }
        h2 {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }
        .receipt-section {
            margin-bottom: 20px;
        }
        .receipt-section p {
            font-size: 16px;
            margin: 5px 0;
        }
        .receipt-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .receipt-table th, .receipt-table td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: left;
        }
        .receipt-table th {
            background-color: #f2f2f2;
        }
        .text-center {
            text-align: center;
        }
        .btn {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            text-decoration: none;
            margin-right: 10px;
            display: inline-block;
        }
        .btn-print {
            background-color: #007bff;
        }
        .btn-email {
            background-color: #ff5722;
        }
        .btn:hover {
            opacity: 0.9;
        }
        .btn-container {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="receipt-container">
    <div class="header">
        <div class="logo-container">
            <img src="../wfs_tmp/img/logo.png" alt="Logo" class="logo">
            <h2>UTKARSH MIND'S</h2>
        </div>
        <div class="company-info">
            <h4>Phone:  096199 97797</h4>
            <h4>Address: Borivali East,<br>Mumbai, Maharashtra</h4>
        </div>
    </div>
    <h2>Fee Receipt</h2>

    <%
    // Retrieve fid from the request parameter
    String fidParam = request.getParameter("fid");

    // Check if fid is provided
    if (fidParam != null) {
        int fid = Integer.parseInt(fidParam); // Parse the fid

        // Execute the query using the fid
        ResultSet rs = s.stm.executeQuery("SELECT * FROM fees WHERE fid=" + fid);
        if (rs.next()) {
            String studentName = rs.getString("st_name");
            String department = rs.getString("dept");
            String email = rs.getString("email");
            String totalFees = rs.getString("total_fees");
            String amountPaid = rs.getString("amount");
            String utr = rs.getString("utr");
            String paidDate = rs.getString("paid_date");
            String paidTime = rs.getString("paid_time");
            int totalFeesInt = Integer.parseInt(totalFees);
            int amountPaidInt = Integer.parseInt(amountPaid);
            int pendingFees = totalFeesInt - amountPaidInt;
    %>

    <!-- Student Information Section -->
    <div class="receipt-section">
        <p><strong>Student Name:</strong> <%= studentName %></p>
        <p><strong>Department:</strong> <%= department %></p>
        <p><strong>Email:</strong> <%= email %></p>
        <p><strong>UTR Number:</strong> <%= utr %></p>
    </div>

    <!-- Fees Information Table -->
    <table class="receipt-table">
        <thead>
            <tr>
                <th>Total Fees</th>
                <th>Amount Paid</th>
                <th>Pending Fees</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Rs. <%= totalFees %></td>
                <td>Rs. <%= amountPaid %></td>
                <td>Rs. <%= pendingFees %></td>
            </tr>
        </tbody>
    </table>

    <!-- Payment Date & Time -->
    <div class="receipt-section">
        <p><strong>Paid Date:</strong> <%= paidDate %></p>
        <p><strong>Paid Time:</strong> <%= paidTime %></p>
    </div>

    <div class="btn-container">
        <button class="btn btn-print" onclick="window.print()">Print Receipt</button>
        <form method="post" action="send_mail.jsp" style="display:inline;">
            <input type="hidden" name="recipient" value="<%= email %>"> <!-- Student's email -->
            <input type="hidden" name="fid" value="<%= fid %>"> <!-- Fee ID -->
            <input type="submit" class="btn btn-email" value="Send via Email">
        </form>
    </div>

    <%
        } else {
            out.println("<p>No data found for this student.</p>");
        }
    } else {
        out.println("<p>Invalid Fee ID. Please go back.</p>");
    }
    %>

</div>
</body>
</html>

<%
    } else {
        out.println("<script>alert('Invalid Action. Please Re-Login');document.location='../sessionreset.jsp';</script>");
    }
} else {
    out.println("<script>alert('Your Session Expired. Please Re-Login');document.location='../index.jsp';</script>");
}
%>
