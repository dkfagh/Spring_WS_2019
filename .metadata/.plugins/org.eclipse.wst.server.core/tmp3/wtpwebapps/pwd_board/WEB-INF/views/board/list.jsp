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
              <h6 class="m-0 font-weight-bold text-primary h3">List
              <a href="/board/register" class="btn btn-primary btn-sm float-right" >Write</a></h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" width="100%" cellspacing="0">
                  <!-- <thead> -->
                    <tr>
                      <th>번호</th>
                      <th width="60%">제목</th>
                      <th>작성자</th>
                      <th>작성일</th>
                      <th>수정일</th>                     
                    </tr>
                  <!-- </thead> -->                 
                  
                  <!-- 테이블 내용 -------------------------------------------------------------------->
                  <c:forEach items="${list}" var="board">
                  <tr>
                  	<td>
	                  	<c:out value="${board.bno}" />
                  	</td>
                  	<td>
             	     	<a href='/board/get?bno=<c:out value="${board.bno}" />'><c:out value="${board.title}" /></a>
                  	</td>
                  	<td>
             	     	<c:out value="${board.writer}" />
                  	</td>
                  	<td>
               	   		<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" />
                  	</td>
                  	<td>
                	  	<fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}" />
                  	</td>
                  </tr>
                  </c:forEach>
                  <!-- 테이블 내용 끝 --------------->
                </table>
                
                <!-- 검색창 ----------------------------------------------------------------------------->
                <div class='row'>
                	<div class="col-lg-12">
                		
                	<form id='searchForm' action="/board/list" method='get'>
                		<select name='type'>
                			<option value="">--</option>
                			<option value="T">제목</option>
                			<option value="C">내용</option>
                			<option value="W">작성자</option>
                			<option value="TC">제목 or 내용</option>
                			<option value="TW">제목 or 작성자</option>
                			<option value="TWC">제목 or 내용 or 작성자</option>
                		</select>
                		<input type='text' name='keyword' />
                		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
                		<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
                		<button class='btn btn-primary'>Search</button>
                	</form>
                	</div>
                </div>
                <!-- 검색창 끝 --------------------->
                
                <!-- start Pagination ---------------------------------------------------------------->
                <div class='pull-right'>
                	<ul class="pagination justify-content-end">
                		
                		<c:if test="${pageMaker.prev}">
                			<li class="page-item previous">
                				<a class="page-link" href="${pageMaker.startPage -1}">Previous</a>
                			<li>
                		</c:if>
                		
                		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                			<li class="page-item ${pageMaker.cri.pageNum == num ? "active":""} ">
                				<a class="page-link" href="${num}">${num}</a>
                			</li>
                		</c:forEach>
                		
                		<c:if test="${pageMaker.next}">
                			<li class="page-item next">
                				<a class="page-link" href="${pageMaker.endPage +1}">Next</a>
                			</li>
                		</c:if>
                	</ul>
                </div>
                <!-- end Pagination ------------->
                
                <form id='actionForm' action="/board/list" method='get'>
                	<input type='hidden' name='pageNum' value="${pageMaker.cri.pageNum}">
                	<input type='hidden' name='amount' value="${pageMaker.cri.amount}">
                	<input type='hidden' name='type' value="${pageMaker.cri.type}">
                	<input type='hidden' name='keyword' value="${pageMaker.cri.keyword}">
                </form>
                
                <!-- Modal 추가 -------------------------------------------------------------------->
                
                <!-- The Modal -->
				<div class="modal" id="myModal">
				  <div class="modal-dialog">
				    <div class="modal-content">
				
				      <!-- Modal Header -->
				      <div class="modal-header">
				        <h4 class="modal-title">알림</h4>
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				      </div>
				
				      <!-- Modal body -->
				      <div class="modal-body">
				       	처리가 완료되었습니다.
				      </div>
				
				      <!-- Modal footer -->
				      <div class="modal-footer">
				        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				      </div>
				
				    </div>
				  </div>
				</div>
                
                <!-- Modal 추가 끝 -------------->
                
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->
        

<%@ include file="../includes/footer.jsp" %>          

<script>
	$(document).ready(function() {
		
		var result = '<c:out value="${result}"/>';
		
		checkModal(result);
		
		history.replaceState({}, null, null);
		
		function checkModal(result) {
			
			if (result === "" || history.state) {
				return;
			}
			
			if (parseInt(result) > 0) {
				$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
			}
			
			if (result == "modified") {
				$(".modal-body").html("수정되었습니다.");
			}
			
			if (result == "removed") {
				$(".modal-body").html("삭제되었습니다.");
			}
			
			$("#myModal").modal("show");
		}
		
		var actionForm = $("#actionForm");
		
		$(".page-item a").on("click", function(e) {
			
			e.preventDefault();  // 페이지 이동을 막는다
			
			console.log('click');
			
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();  // 전송. list 페이지로 이동
		});
		
		var searchForm = $("#searchForm");
		
		$("#searchForm button").on("click", function(e) {
			
			if(!searchForm.find("option:selected").val()){
				alert("검색 종류를 선택하세요.");
				return false;
			}
			
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요.");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDafault();
			
			searchForm.submit();
		})
		
	});
</script>