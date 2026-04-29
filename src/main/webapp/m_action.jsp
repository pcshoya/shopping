<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconnect.jsp" %>

<%
/* ※주의. custno는 db에서 int형으로 만들어짐. */ 
Integer custno = Integer.valueOf(request.getParameter("custno")); 
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String joindate = request.getParameter("joindate");
String grade = request.getParameter("grade");
String city = request.getParameter("city");

try {
	String sql = "UPDATE tbl_member SET CUSTNAME=?, PHONE=?, ADDRESS=?, JOINDATE=?, GRADE=?, CITY=? WHERE CUSTNO=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, custname);
	pstmt.setString(2, phone);
	pstmt.setString(3, address);
	pstmt.setString(4, joindate);
	pstmt.setString(5, grade);
	pstmt.setString(6, city);
	pstmt.setInt(7, custno);

	int result = pstmt.executeUpdate();
%>
<jsp:forward page="list.jsp"></jsp:forward>
<%		
}
catch(Exception e){
    out.print("DB 오류 :" + e.getMessage());
}
%>