<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconnect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<section>
<h2>회원목록조회/수정</h2>
<form>
<table border="1">
	<tr>
		<td> 회원번호 </td>
		<td> 회원성명 </td>
		<td> 전화번호 </td>
		<td> 주소 </td>
		<td> 가입일자 </td>
		<td> 고객등급 </td>
		<td> 거주지역 </td>
	</tr>
	<%
		request.setCharacterEncoding("UTF-8");
		String grade="";	
		try {
			String sql = "SELECT * FROM tbl_member_202205 ORDER BY custno" ;
			PreparedStatement pstmt = conn.prepareStatement(sql) ;
			ResultSet rs = pstmt.executeQuery() ;
			while(rs.next()) {
				grade = rs.getString(6) ;
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
		<td> <a href="modify.jsp?custno=<%=rs.getString(1) %>"> <%=rs.getString(1) %> </a> </td>
		<td> <%=rs.getString(2) %> </td>
		<td> <%=rs.getString(3) %> </td>
		<td> <%=rs.getString(4) %> </td>
		<td> <%=rs.getDate(5) %> </td>
		<td> <%=grade %> </td>
		<td> <%=rs.getString(7) %> </td>
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
<jsp:include page="footer.jsp" />
</body>
</html>