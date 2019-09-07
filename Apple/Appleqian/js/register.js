function register() {
	let $uname = $("#uname").val();
	let $upwd = $("#upwd").val();
	let $upwdagain = $("#upwdagain").val();
	let $email = $("#email").val();
	let $phone = $("#phone").val();
	let $user_name = $("#user_name").val();
	let $gender = $("#gender").val();

	$.ajax({
		url: "http://127.0.0.1:8080/user/reg",
		data: {
			uname: $uname,
			upwd: $upwd,
			email: $email,
			phone: $phone,
			user_name: $user_name,
			gender: $gender
		},
		type: "post",
		dataType: "json",
		success: function(result) {
			alert("注册成功!");
			window.location.href = 'login.html';
		}
	});
}

//检测帐号
function checkuname() {
	let $uname = $("#uname").val();

	if ($uname == null) {
		$("#reg").attr("disabled", true);
		$("#reg").css("pointer-events", "none");
		$("#uname").css("border", "3px solid red");
	}

	if ($uname != "") {
		$.ajax({
			url: "http://127.0.0.1:8080/user/check",
			data: {
				uname: $uname
			},
			type: "post",
			dataType: "json",
			success: function(result) {
				if (result) {
					$("#reg").attr("disabled", true);
					$("#reg").css("pointer-events", "none");
					$("#uname").css("border", "3px solid red");
				} else {
					$("#reg").attr("disabled", false);
					$("#reg").css("pointer-events", "auto").css({
						opacity: 1
					});
					$("#uname").css("border", "3px solid green");
				}
			}
		});
	}
}

function checkupwd() {
	let $upwd = $("#upwd").val();
	let $upwdagain = $("#upwdagain").val();

	if($upwd==null || $upwdagain==null){
		$("#reg").attr("disabled", true).css("pointer-events", "none");
		$("#upwd").css("border", "3px solid red");
		$("#upwdagain").css("border", "3px solid red");
	}

	if ($upwd != "" && $upwdagain != "") {
		if ($upwd != $upwdagain) {
			$("#reg").attr("disabled", true).css("pointer-events", "none");
			$("#upwd").css("border", "3px solid red");
			$("#upwdagain").css("border", "3px solid red");
		} else {
			$("#reg").attr("disabled", false).css("pointer-events", "auto").css({
				opacity: 1
			});
			$("#upwd").css("border", "3px solid green");
			$("#upwdagain").css("border", "3px solid green");
		}
	}
}
