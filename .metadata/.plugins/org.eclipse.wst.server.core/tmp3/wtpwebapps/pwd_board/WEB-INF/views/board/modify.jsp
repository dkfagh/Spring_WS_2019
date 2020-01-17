<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<%@include file="../includes/header.jsp" %>

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Board</h1>
          
		  
          <!-- DataTales Example -->
          <form role="form" action="/board/modify" method="post">
          
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h4 class="m-0 font-weight-bold text-primary">Modify</h4>                                         
            </div>
            
            <div class="card-body">
            
		            <div class="form-group">
						<label>Bno</label> 
						<input class="form-control" name="bno" value='<c:out value="${board.bno}"/>' readonly="readonly">
					</div>
            
					<div class="form-group">
						<label>Title</label> 
						<input class="form-control" name="title" value='<c:out value="${board.title}"/>'>
					</div>
					
					<div class="form-group">
						<label>Content</label>
						<textarea class="form-control" rows="10" name='content'><c:out value="${board.content}"/></textarea>
					</div>
					
					<div class="form-group">
						<label>Writer</label> 
						<input class="form-control" name='writer' value='<c:out value="${board.writer}"/>' readonly="readonly">
					</div>
					
					<button type="submit" data-oper="modify" class="btn btn-secondary btn-sm">Modify</button>
					<button type="submit" data-oper="remove" class="btn btn-danger btn-sm">Remove</button>
					<button type="submit" data-oper="list" class="btn btn-primary btn-sm">List</button>

            </div>
          </div>
		  </form>
        </div>
        <!-- /.container-fluid -->

<%@ include file="../includes/footer.jsp" %>


<script>
$(document).ready(function() {
	var formObj = $("form");
	
	$('button').on("click", function(e) {
		
		e.preventDefault();
		
		var operation = $(this).data("oper");  // data-oper 속성값을 구함
		console.log(operation);
		
		if(operation === 'remove') {
			if (confirm("삭제하시겠습니까?") == true){    //확인
				formObj.attr("action", "/board/remove");  // action 변경
			} else {
				return;
			}
		} else if(operation === 'list') {
			// move to list
			self.location="/board/list";  // 목록으로 이동
			return;
		}
		formObj.submit();  //  form의 데이터 전송
	})
})
</script>