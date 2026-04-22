<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconnect.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

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
        "UPDATE tbl_member_202205 SET "
        + "custname='" + custname + "', "
        + "phone='" + phone + "', "
        + "address='" + address + "', "
        + "joindate='" + joindate + "', "
        + "grade='" + grade + "', "
        + "city='" + city + "' "
        + "WHERE custno='" + custno + "'"
    );
%>
<jsp:forward page="list.jsp"></jsp:forward>
<%		
}
catch(Exception e){
    out.print("DB 오류 :" + e.getMessage());
}
%>
