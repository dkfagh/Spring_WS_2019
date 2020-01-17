var pwdService = (function(){
	
	// 함수 호출 -> pwdService.check();
	function check(pwd, callback, error){
		console.log("check pwd...............");
		
		$.ajax({
			type : 'post',
			url : '/pwd/check',
			data : JSON.stringify(pwd),
			contentType : "application/json; charset=UTF-8",
			success : function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		})
	}
})();