$(function(){
	$.ajax({
		url:"header.html",
		type:"get",
		success:function(result){
			$(result).replaceAll("#header");
			$(`<link rel="stylesheet" href="../css/header.css">`).appendTo("head");
			$(`<link rel="stylesheet" href="../css/bootstrap.css">`).appendTo("head");
			$(`<script src="../js/jquery.min.js" type="text/javascript" charset="utf-8"></script>`).appendTo("head");
			$(`<script src="../js/popper.min.js" type="text/javascript" charset="utf-8"></script>`).appendTo("head");
			$(`<script src="../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>`).appendTo("head");
			
			let uname=sessionStorage.getItem("uname");
			if(!sessionStorage.getItem("uname")){
				$("#user").text("请先登录");
			}else{
				$("#user").text(`你好,${uname}`);
			}
			
		}
	})
})

function toCart(){
	if(!sessionStorage.getItem("uname")){
		alert("请先登录!");
	}else{
		window.location.href = `cart.html`;
	}
}

function toLogin(){
	if(!sessionStorage.getItem("uname")){
		window.location.href = `../login.html`;
	}else{
		if (window.confirm("是否注销账号?")){
			sessionStorage.removeItem("uname");
			sessionStorage.removeItem("uid");
			alert("注销成功!");
			window.location.href = `../login.html`;
		}else{
			alert("不注销了");
		}
	}
	
}