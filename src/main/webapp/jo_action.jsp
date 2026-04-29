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
Integer custno = Integer.valueOf(request.getParameter("custno"));
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String joindate = request.getParameter("joindate");
String grade = request.getParameter("grade");
String city = request.getParameter("city");

try{
	String sql = "INSERT INTO TBL_MEMBER values(?,?,?,?,?,?,?)";
	PreparedStatement rstmt = conn.prepareStatement(sql);
	rstmt.setInt(1, custno);
	rstmt.setString(2, custname);
	rstmt.setString(3, phone);
	rstmt.setString(4, address);
	rstmt.setString(5, joindate);
	rstmt.setString(6, grade);
	rstmt.setString(7, city);
	
	int result = rstmt.executeUpdate();

    if(result > 0){
%>
        <script>
            alert("회원등록 완료");
            location.href="list.jsp";
        </script>
<%
    }
    rstmt.close();
    conn.close();
}
catch(Exception e){
    out.print("DB 오류 :" + e.getMessage());
}
%>

</body>
</html>