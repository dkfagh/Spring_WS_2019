<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
</head>
<body>
	<h2>비밀번호 확인</h2>
	<form action="/board/pwdcheck" method="get" name="frm">
		비밀번호 <input type="text" name="userid" value="${password}">
			<input type="submit" value="확인">
		<br>
		<c:if test="${result == 1}">
			<script type="text/javascript">
				opener.document.frm.userid.value="";
			</script>
			비밀번호가 일치하지 않습니다.
		</c:if>
		<c:if test="${result == -1}">
			<input type="button" value="사용" class="cancel" onclick="idok()">
		</c:if>
	</form>
</body>
</html>