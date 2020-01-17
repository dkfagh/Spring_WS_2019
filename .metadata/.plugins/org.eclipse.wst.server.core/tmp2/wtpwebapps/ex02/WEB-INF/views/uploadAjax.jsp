<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.uploadResult { width:100%;
				background-color: gray;	
}

.uploadResult ul{ display:flex;
				  flex-flow:row;
				  justify-content:center;
				  align-items:center;
}

.uploadResult ul li{list-style:none;
					padding:10px;
}

.uploadResult ul li img{width:50px;
}

.uploadResult ul li span {color:white;
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

.bigPicture img {width:600px;
}

</style>
</head>
<body>
<h1>Upload with Ajax</h1>

<div class='bigPictureWrapper'>
	<div class='bigPicture'>
	</div>
</div>

<div class='uploadDiv'>
	<input type='file' name='uploadFile' multiple>
</div>
<button id='uploadBtn'>Upload</button>
<div class='uploadResult'>
	<ul>
	
	</ul>
</div>

<script	src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script>

	function showImage(fileCallPath) {
		//alert(fileCallPath);
		
		$(".bigPictureWrapper").css("display", "flex").show;
		
		$(".bigPicture").html("<img src='/display?fileName=" + encodeURI(fileCallPath) + "'>").animate({width:'100%', height:'100%'}, 1000);
	}
	
	$(document).ready(function() {
		
		var uploadResult=$(".uploadResult ul");  // 업로드 결과 출력 영역
		
		function showUploadedFile(uploadResultArr) {
			
			var str = "";
			
			$(uploadResultArr).each(function(i, obj) {
				
				// 이미지 파일이 아닌 경우
				if(!obj.image) {
					//str += "<li><img src='/resources/img/attach.png'>" + obj.fileName + "</li>";
					
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
					
					var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
					
					str += "<li><div><a href='/download?fileName=" + fileCallPath + "'><img src='/resources/img/attach.png'>" + obj.fileName + "</a>" +
							"<span data-file=\'" + fileCallPath + "\' data-type='file'> X </span></div></li>";
					
				} else {
					//str += "<li>" + obj.fileName + "</li>";
					
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
					
					//str += "<li><img src='/display?fileName=" + fileCallPath + "'></li>";
					
					// 원본 파일 경로
					var originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
					
					originPath = originPath.replace(new RegExp(/\\/g), "/");
					
					str += "<li><a href=\"javascript:showImage(\'" + originPath + "\')\"><img src='/display?fileName=" + fileCallPath + "'></a>" +
							"<span data-file=\'" + fileCallPath + "\' data-type='image'> X </span></li>";
				}
			});
			
			uploadResult.append(str);
		}
		
		$(".uploadResult").on("click", "span", function(e) {
		
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			console.log(targetFile);
			
			$.ajax({
				url:'/deleteFile',
				data:{fileName: targetFile, type: type},
				dataType:'text',
				type:'POST',
				success:function(result) {
					alert(result);
				}
			});
		});
		
		$(".bigPictureWrapper").on("click", function(e) {
			$(".bigPicture").animate({width:'0%', height:'0%'}, 1000);
			setTimeout(function() {
				$('.bigPictureWrapper').hide();
			}, 1000);
		})
		
		var cloneObj = $(".uploadDiv").clone();  // 복제
		
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
		
		$("#uploadBtn").on("click", function(e) {
			
			var formData = new FormData();
			
			var inputFile = $("input[name='uploadFile']");
			
			var files = inputFile[0].files;
			
			console.log(files);
			
			// formData에 file 추가
			for(var i = 0; i < files.length; i++) {
				
				// 파일 확장자, 파일 크기 체크
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
				dataType: 'json',
				success: function(result) {

					console.log(result);
					
					// 업로드 파일 리스트 출력
					showUploadedFile(result);
					
					$(".uploadDiv").html(cloneObj.html());
				}
			});  // $.ajax
			
		});
	});
</script>
</body>
</html>