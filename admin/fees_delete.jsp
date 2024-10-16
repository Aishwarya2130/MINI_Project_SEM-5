
<form action="fpass2.jsp" method="post" class="login100-form validate-form">

<!-- Design Start -->
<jsp:include page="meta.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
<style>
    .receipt-container {
        width: 100%;
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
        border: 2px solid #000;
        font-family: Arial, sans-serif;
    }
    .receipt-header {
        text-align: center;
        margin-bottom: 20px;
    }
    .receipt-details, .fees-section {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    .receipt-details td, .fees-section td {
        padding: 10px;
        border: 1px solid #000;
    }
    .receipt-details td:first-child {
        font-weight: bold;
        width: 150px;
    }
    .fees-section td {
        text-align: center;
    }
    .total-row {
        font-weight: bold;
    }
    .fees-pending {
        text-align: center;
        font-size: 1.2em;
        margin-top: 20px;
        font-weight: bold;
    }
</style>

<div class="receipt-container">
    <div class="receipt-header">
        <h2>UTKARSH MINDS</h2>
        <p>ADDRESS</p>
    </div>
	<%@page import="java.sql.*"%>
<%@page import="exam.dbconnect"%>
<jsp:useBean id="s" class="exam.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>
<%
int sl=0;
ResultSet rs=s.stm.executeQuery("select * from fees a,student_details sb,department_details s where a.st_id=sb.st_id and a.dept_id=s.dept_id");
while(rs.next())
{
sl++;
int fid=rs.getInt("fid");
String qt=rs.getString("total_fees");
String pprc=rs.getString("amount");
int apr=Integer.parseInt(pprc);	
int qnty=Integer.parseInt(qt);
int tprc=qnty - apr;
%>

    <table class="receipt-details">
        <tr>
            <td>RECEIPT DATE:</td>
            <td><div align="center"><%=rs.getString("paid_date")%></div></td>
        </tr>
        <tr>
            <td>STUDENT NAME:</td>
            <td><%=rs.getString("fname")+" "+rs.getString("lname")%></td>
        </tr>
        <tr>
            <td>STUDENT DEPT:</td>
            <td><%=rs.getString("dept_name")%></td>
        </tr>
        <tr>
            <td>UTR:</td>
            <td><%=rs.getString("utr")%></td>
        </tr>
    </table>

    <table class="fees-section">
        <tr>
            <td>TOTAL FEES</td>
            <td>FEES PAID</td>
        </tr>
        <tr>
            <td><div align="center"><%=rs.getString("total_fees")%></td>
            <td><div align="center"><%=rs.getString("amount")%></td>
        </tr>
    </table>
	

    <div class="fees-pending">
        FEES PENDING:<%=tprc%>
    </div>
</div>
