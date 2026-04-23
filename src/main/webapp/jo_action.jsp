<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconnect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="java.js"></script>
<%
String custno = request.getParameter("custno");
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String joindate = request.getParameter("joindate");
String grade = request.getParameter("grade");
String city = request.getParameter("city");

try{
    Statement stmt = conn.createStatement();
    int result = stmt.executeUpdate(
        "INSERT INTO tbl_member VALUES('" 
        + custno + "','" 
        + custname + "','" 
        + phone + "','" 
        + address + "','" 
        + joindate + "','" 
        + grade + "','" 
        + city + "')"
    );

    if(result > 0){
%>
        <script>
            alert("회원등록 완료");
            location.href="list.jsp";
        </script>
<%
    }

    stmt.close();
    conn.close();
}
catch(Exception e){
    out.print("DB 오류 :" + e.getMessage());
}
%>

</body>
</html>