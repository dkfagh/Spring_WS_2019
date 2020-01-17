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
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h4 class="m-0 font-weight-bold text-primary">Read</h4>
              
              
              
            </div>
            <div class="card-body">
		            <div class="form-group">
						<label>Bno</label> 
						<input class="form-control" name="bno" value='<c:out value="${board.bno}"/>' readonly="readonly">
					</div>
            
					<div class="form-group">
						<label>Title</label> 
						<input class="form-control" name="title" value='<c:out value="${board.title}"/>' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>Content</label>
						<textarea class="form-control" rows="10" name='content' readonly="readonly"><c:out value="${board.content}"/></textarea>
					</div>
					
					<div class="form-group">
						<label>Writer</label> 
						<input class="form-control" name='writer' value='<c:out value="${board.writer}"/>' readonly="readonly">
					</div>
					
			          <form id='operForm' action="/board/modify" method="get">
			          	<input type="hidden" id="bno" name="bno" value="${board.bno}">
			          	<input type="hidden" name="pageNum" value="${cri.pageNum}">
			          	<input type="hidden" name="amount" value="${cri.amount}">
			          	<input type="hidden" name="keyword" value="${cri.keyword}">
			          	<input type="hidden" name="type" value="${cri.type}">
			          	<button class="btn btn-primary btn-sm">Modify</button>
			          	<button data-oper="remove" class="btn btn-danger btn-sm">Remove</button>
						<a class="btn btn-primary btn-sm" href="/board/list">List</a>
			          </form>									
            </div>
          </div>
          
        </div>
        <!-- /.container-fluid -->
        
        <!-- Modal 추가 -------------------------------------------------------------------------------------------------------------->
                
                <!-- The Modal -->
				<div class="modal" id="myModal">
				  <div class="modal-dialog">
				    <div class="modal-content">
				
				      <!-- Modal Header -->
				      <div class="modal-header">
				        <h4 class="modal-title">Password Check</h4>
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				      </div>
				
				      <!-- Modal body -->
				      <div class="modal-body">
				       	<div class="form-group">
				       		<label>Password</label>
				       		<input class="form-control" name="pwd" value="password">
				       	</div>
				      </div>
				
				      <!-- Modal footer -->
				      <div class="modal-footer">
				        <button type="button" class="btn btn-primary" id='modalCheckBtn'>Check</button>
				        <button type="button" class="btn btn-default" id='modalCloseBtn'>Close</button>
				      </div>
				
				    </div>
				  </div>
				</div>
                
                <!-- Modal 추가 끝 -------------------->

<%@ include file="../includes/footer.jsp" %>

<script>
$(document).ready(function() {
	var formObj = $("form");
	
	$('button').on("click", function(e) {
		
		e.preventDefault();
		
/* 		var url = "pwdCheck?password=" + ${board.password};
		window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
 */		
		var operation = $(this).data("oper");  // data-oper 속성값을 구함
		console.log(operation);
		
		if(operation === 'remove') {
			if (confirm("삭제하시겠습니까?") == true){    //확인
				modal.find("input").val("");  // 입력 항목 초기화
				
				$("#myModal").modal("show");  // 모달창 보이게
				
				//formObj.attr("action", "/board/remove");  // action 변경
			} else {
				return;
			}
		}
		formObj.submit();  //  form의 데이터 전송
	})
	
	
	var modal = $(".modal");
	var modalInputPwd = modal.find("input[name='pwd']");  // 비밀번호 입력	
	
	var modalCheckBtn = $("#modalCheckBtn");  // 확인 버튼
	
	// confirm 확인 버튼 클릭 시 모달 띄우기
	$("#addReplyBtn").on("click", function(e) {
		
		
		
	});
	
	// Register 버튼 클릭시 댓글 등록
	modalCheckBtn.on("click", function(e){
		
		var pwd = {
				pwd: modalInputPassword.val(),
				bno: bnoValue
		};
		console.log(pwd);
		pwdService.check(pwd, function(result){
			
			alert(result);
			
			modal.find("input").val();
			modal.modal("hide");
			
			formObj.attr("action", "/board/remove");  // action 변경
		});
	});
})
</script>