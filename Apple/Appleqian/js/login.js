function login(){
	let $uname = $("#uname").val();
	let $upwd = $("#upwd").val();
	
	$.ajax({
		url: "http://127.0.0.1:8080/user/login",
		data: {
			uname: $uname,
			upwd: $upwd
		},
		type: "post",
		dataType: "json",
		success: function(result) {
			if(result){
				alert("登录成功!");
				let JSONuid=JSON.stringify(result[0].uid);
				let JSONuname=JSON.stringify($uname);
				sessionStorage.setItem("uname",JSONuname);
				sessionStorage.setItem("uid",JSONuid);
				
				window.location.href = `Apple.html`;
			}else{
				alert("账号密码错误!");
			}
		}
	});
}