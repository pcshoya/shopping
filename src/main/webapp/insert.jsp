<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconnect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
</head>
<body>
<script src="java.js"></script>
<jsp:include page="header.jsp" />
<section>
    <h2>홈쇼핑 회원 등록</h2>
    <!-- 입력 유효성 검사, action 작성 -->
    <form name="frm" onsubmit="return checkIn()" action="in_action.jsp" >
        <table border="1">
        <% 
        	try {
	    	String sql = "SELECT MAX(custno) + 1 custno FROM tbl_member" ;
	    	PreparedStatement pstmt = conn.prepareStatement(sql); 
			ResultSet rs = pstmt.executeQuery(); 
			rs.next();
		%>
        
	        <tr>
		        <td>회원번호(자동발생)</td>
		        <td><input type="text" name="custno" value="<%=rs.getString(1) %>" readonly ></td>
			</tr>
	
			<tr>
				<td>회원성명</td>
				<td><input type="text" name="custname"></td>
			</tr>
	
			<tr>
				<td>회원전화</td>
				<td><input type="text" name="phone"></td>
			</tr>	
			<tr>
				<td>회원주소</td>
				<td><input type="text" name="address"></td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td><input type="text" name="joindate"></td>
			</tr>
			<tr>
				<td>고객등급[A:VIP.B:일반,C:직원]</td>
				<td><input type="text" name="grade"></td>
			</tr>
			<tr>
				<td>도시코드</td>
				<td><input type="text" name="city"></td>
			</tr>
			<tr>
				<td colspan="2" class="td-center">
						<input type="submit" value="등록">
						<input type="reset" value="다시쓰기">
				</td>
			</tr>
		<%
			rs.close();
			pstmt.close();
			conn.close();
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