<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- all or member or admin -->

<h1>/sample/all page</h1>


<!-- 로그인 하지 않은 경우 -->
<sec:authorize access="isAnonymous()">

	<a href="/customLogin">Login</a>
	
</sec:authorize>


<!-- 로그인 한 경우 -->
<sec:authorize access="isAuthenticated()">

	<a href="/customLogout">Logout</a>
	
</sec:authorize>

</body>
</html>