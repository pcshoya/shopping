<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconnect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원매출조회</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h2>회원매출조회</h2>
	<form>
	<table border="1">
	<tr>
		<td>회원번호</td>
		<td>회원성명</td>
		<td>고객등급</td>
		<td>매출</td>
	</tr>	
	<% 
		String grade="";
		try {
		String sql= "SELECT me.custno, me.custname, me.grade, sum(mo.price) price " +
				"FROM tbl_member me, tbl_money mo " +
				"WHERE me.custno = mo.custno " +
				"GROUP BY me.custno, me.custname, me.grade " +
				"ORDER BY sum(mo.price) desc" ;	
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			grade = rs.getString(3) ;
			switch(grade) {
			case "A" :
				grade = "VIP";
			break;
			case "B" :
				grade = "일반";
			break;
			case "C" :
				grade = "직원";
			break;
			}
	%>
		<tr>
			<td> <%=rs.getString(1) %> </td>
			<td> <%=rs.getString(2) %> </td>
			<td> <%=grade %> </td>
			<td> <%=rs.getString(4) %> </td>
		</tr>
		<% 
		}
	}
		catch(Exception e){
    	    out.print("DB 오류 :" + e.getMessage());
		}
		%>	
</table>	
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>