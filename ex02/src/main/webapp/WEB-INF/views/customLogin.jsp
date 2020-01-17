<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="./includes/header.jsp" %>

 	<!-- Begin Page Content -->
    <div class="container-fluid">
        
		<h1 class="h3 mb-2 text-gray-800">Custom Login Page</h1>
				
		
		<div class="card shadow mb-4" style="width:60%; margin:auto;">
		
			<div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary h3">Login</h6>
            </div>
					
			<div class="card-body">
			
				<form role="form" method="post" action="/login">
				
					<div class="form-group">
						<input class="form-control" placeholder="userID" type="text" name="username">
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="PassWord" type="password" name="password">
					</div>
					<div class="checkbox">
						<!-- <input type="checkbox" name="remember-me"> Remember Me -->
						<label> <input name="remember-me" type="checkbox"> Remeber Me </label>
					</div>
					<div class="form-group">
						<input class="form-control" type="submit" value="Login">
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
					
				</form>
				
			<!-- end card-body -->
			</div>
			
			<div class="card-footer">
			
				<h5 style="color:red; text-align:center;"><c:out value="${error }" /></h5>
				<%-- <h5 style="color:red; text-align:center;"><c:out value="${logout }" /></h5> --%>
				
			<!-- end card-footer -->
			</div>
			
		<!-- end card -->
		</div>
		
	<!-- /.container-fluid -->
	</div>
        
<%@ include file="./includes/footer.jsp" %>

<c:if test="${param.logout != null }">
	<script>
		$(document).ready(function() {
			
			if(history.state) {
				return;
			}
			
			alert("로그아웃 되었습니다.")
			
			history.replaceState({}, null, null);
		});
	</script>
</c:if>