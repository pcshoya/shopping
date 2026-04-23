<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconnect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
<script src="java.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h2>홈쇼핑 회원 정보 </h2>
	<form method = "post" action = "m_action.jsp" name=frm>	
		<table border="1">
		<%
			request.setCharacterEncoding("UTF-8");
			String custno = request.getParameter("custno") ;
			try {	
			String sql = "SELECT * FROM tbl_member WHERE custno = ?" ;
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, custno);
			ResultSet rs = pstmt.executeQuery();
			rs.next();	
		%>
			<tr>
				<td><b>회원번호</b></td>
				<td><input type="text" name="custno" value="<%=rs.getString(1)%>" readonly> </td>
			</tr>
			<tr>
				<td><b>회원성명</b></td>
				<td><input type="text" name="custname" value="<%=rs.getString(2)%>"></td>
			</tr>
			<tr>
				<td><b>회원전화</b></td>
				<td><input type="text" name="phone" value="<%=rs.getString(3)%>"></td>
			</tr>
			<tr>
				<td><b>회원주소</b></td>
				<td><input type="text" name="address" value="<%=rs.getString(4)%>"></td>
			</tr>
			<tr>
				<td><b>가입일자</b></td>
				<td><input type="text" name="joindate" value="<%=rs.getDate(5)%>"></td>
			</tr>
			<tr>
				<td><b>고객등급[A:VIP,B:일반,C:직원]</b></td>
				<td><input type="text" name="grade" value="<%=rs.getString(6)%>"></td>
			</tr>
			<tr>
				<td><b>도시코드</b></td>
				<td><input type="text" name="city" value="<%=rs.getString(7)%>"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="수정" onclick="return modify()"> &nbsp;
					<input type="button" value="조회" onclick="window.location = 'list.jsp'">
				</td>
			</tr>
		<%
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