<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<%@include file="../includes/header.jsp" %>

<style>

.uploadResult { width:100%;
				border: 1px solid lightgray;
				border-radius: 5px;
}

.uploadResult ul{ display:flex;
				  flex-flow:row;
				  justify-content:center;
				  align-items:center;
}

.uploadResult ul li{list-style:none;
					padding:10px;
}

.uploadResult ul li img{width:100px;
}

.uploadResult ul li span {color:gray;
}

.bigPictureWrapper {position:absolute;
					display:none;
					justify-content:center;
					align-items:center;
					top:0;
					width:100%;
					height:100%;
					background-color:gray;
					z-index:100;
					background:rgba(255, 255, 255, 0.5);
}

.bigPicture {position:relative;
			 display:flex;
			 justify-content:center;
			 align-items:center;
}

.bigPicture img {width:100%;
}

</style>

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Board</h1>
          
		  
          <!-- DataTales Example -->
          <form role="form" action="/board/modify" method="post">
          
          <!------------------------------------------------------- 중요!!! ----------------------------------------------------------------->
		  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
          
          <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
          <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
          <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
          <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
          
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
					
					<div class="form-group">
						<label>File Attach</label>
        				        				
        				<div class='uploadResult'>
        					<div class="uploadDiv" style="padding-left:10px; padding-top:10px;">
	        					<input type="file" name='uploadFile' multiple>
	        				</div>
        					<ul>        					       					
        					</ul>
        				</div>
        			</div>
					
					<sec:authentication property="principal" var="pinfo" />
					
	          		<sec:authorize access="isAuthenticated()">
	          			<c:if test="${pinfo.username eq board.writer }">
	          				<button type="submit" data-oper="modify" class="btn btn-secondary btn-sm">Modify</button>
							<button type="submit" data-oper="remove" class="btn btn-danger btn-sm">Remove</button>
	          			</c:if>
	          		</sec:authorize>
					<button type="submit" data-oper="list" class="btn btn-primary btn-sm">List</button>

            </div>
          </div>
		  </form>
        </div>
        <!-- /.container-fluid -->

<%@ include file="../includes/footer.jsp" %>


<script>
$(document).ready(function() {
	
	// 익명함수 정의와 동시에 호출
	(function(){
		
		var bno = '<c:out value="${board.bno}"/>';
		
		$.getJSON("/board/getAttachList", {bno: bno}, function(arr){
			
			console.log(arr);
			
			var str = "";
			
			$(arr).each(function(i, attach) {
				
				// image type
				if(attach.fileType) {
					
					var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
					
					str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "'>";
					str += "	<div>";
					str += "		<span>" + attach.fileName + "</span>";
					str += "		<button type='button' data-file='" + fileCallPath + "' data-type = 'image' class='btn btn-sm btn-danger btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "		<img src='/display?fileName=" + fileCallPath + "'>";
					str += "	</div>";
					str += "</li>";
					
				} else {
										
					str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "'>";
					str += "	<div>";
					str += "		<span>" + attach.fileName + "</span>";
					str += "		<button type='button' data-file='" + fileCallPath + "' data-type = 'file' class='btn btn-sm btn-danger btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "		<img src='/resources/img/attach.png'>";
					str += "	</div>";
					str += "</li>";
				}
			});
			
			$(".uploadResult ul").html(str);
			
		});  // end getJSON
		
	})();  // end function
	
		
	$(".uploadResult").on("click", "button", function(e) {
		
		console.log("delete file");
		
		if (confirm( "Remove this file? ")) {
			
			var targetLi = $(this).closest("li");
			targetLi.remove();
		}
	});
	
	
	// 업로드 파일 확장자 필터링
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880;  // 5MB
	
	function checkExtension(fileName, fileSize) {

		if (fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}

		if (regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$("input[type='file']").change(function(e) {
		
		// 폼태그에 대응되는 객체
		var formData = new FormData();
		
		var inputFile = $("input[name='uploadFile']");
		
		var files = inputFile[0].files;
		
		// formData에 file 추가
		for(var i = 0 ; i < files.length ; i++) {
			
			// 파일 확장자, 크기 체크
			if(!checkExtension(files[i].name, files[i].size)) {
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url:'/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			beforeSend: function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
			},
			dataType: 'json',
			success: function(result) {

				console.log(result);
				
				// 업로드 파일 리스트 출력
				showUploadResult(result);
				
			}
		});  // $.ajax
	})
	
	function showUploadResult(uploadResultArr){
		
		if(!uploadResultArr || uploadResultArr.length == 0){
			return;
		}
		
		var uploadUL = $(".uploadResult ul");
		
		var str = "";
		
		$(uploadResultArr).each(function(i, obj) {
			
			// image type
			if(obj.image) {
				
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
				
				str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename=" + obj.fileName + "' data-type='" + obj.image + "'>";
				str += "	<div>";
				str += "		<span>" + obj.fileName + "</span>";
				str += "		<button type='button' data-file='" + fileCallPath + "' data-type = 'image' class='btn btn-sm btn-danger btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "		<img src='/display?fileName=" + fileCallPath + "'>";
				str += "	</div>";
				str += "</li>";
				
			} else {
				
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
				
				var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
				
				str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename=" + obj.fileName + "' data-type='" + obj.image + "'>";
				str += "	<div>";
				str += "		<span>" + obj.fileName + "</span>";
				str += "		<button type='button' data-file='" + fileCallPath + "' data-type = 'file' class='btn btn-sm btn-danger btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "		<a><img src='/resources/img/attach.png'></a>";
				str += "	</div>";
				str += "</li>";
			}
		});
		
		uploadUL.append(str);
	}

	

	var formObj = $("form");
	
	$('button').on("click", function(e) {
		
		e.preventDefault();  // 전송을 막는다
		
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
			/* self.location="/board/list";  // 목록으로 이동
			return; */
			formObj.attr("action", "/board/list").attr("method", "get");
			
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var typeTag = $("input[name='type']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			
			formObj.empty();
			
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(typeTag);
			formObj.append(keywordTag);
			
		} else if(operation === 'modify') {
			
			console.log("submit clicked");
			
			var str = "";
			
			$(".uploadResult ul li").each(function(i, obj) {
				
				var jobj = $(obj);
				
				console.dir(jobj);
				
				str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].fileType' value='" + jobj.data("type") + "'>";
				
			});
			formObj.append(str).submit();
		}
		
		formObj.submit();  //  form의 데이터 전송
	});
});
</script>