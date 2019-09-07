var laptopId = window.location.search.replace("?laptop=", "");

//用于记录现在是什么电脑
var id;

//设置左边图片
window.onscroll = function() {
	//变量t是滚动条滚动时，距离顶部的距离
	var t = document.documentElement.scrollTop || document.body.scrollTop;
	var top = 250;
	var bottom;
	if (laptopId >= 1 && laptopId <= 12) {
		bottom = 950
	}
	if (laptopId >= 13 && laptopId <= 60) {
		bottom = 850
	}
	var pic = document.getElementById('picture');
	//当滚动到距离顶部200px时，返回顶部的锚点显示
	if (t < top) {
		pic.style.position = "absolute";
		pic.style.top = top + "px";
	} else if (t >= top && t < bottom) {
		pic.style.position = "fixed";
		pic.style.top = 0;
	} else if (t >= bottom) {
		pic.style.position = "absolute";
		pic.style.top = bottom + "px";
	}
}

//air和pro不同的地方,添加的地方
$(function() {
	if (laptopId >= 1 && laptopId <= 12) {
		let html = `<img src="image/macbook-air_img/macbook-air.jpg">`;
		$("#picture").append(html);

		let cpu =
			`<div class="btn border w-80 text-left mt-3 isselect">1.6GHz 双核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 3.6GHz</div>`;
		$("#content>li:nth-child(1)").append(cpu);
		if (laptopId == 2 || laptopId == 8) {
			$("#content>li:nth-child(3)>br+div").removeClass("isselect");
			$("#content>li:nth-child(3)>br+div+div").addClass("isselect");
		}

	}
	if (laptopId >= 13 && laptopId <= 36) {
		let html = `<img src="image/macbook-pro_img/macbook-pro.jpg">`;
		$("#picture").append(html);

		let cpu =
			`<div class="btn border w-80 text-left mt-3 isselect">1.4GHz 四核第八代 Intel Core i5 处理器, Turbo Boost 最高可达 3.9GHz</div>
			<div class="btn border w-80 text-left mt-3">1.7GHz 四核第八代 Intel Core i7 处理器, Turbo Boost 最高可达 4.5GHz</div>`
		$("#content>li:nth-child(1)").append(cpu);
	}
	if (laptopId >= 37 && laptopId <= 60) {
		let html = `<img src="image/macbook-pro_img/macbook-pro.jpg">`;
		$("#picture").append(html);

		let cpu =
			`<div class="btn border w-80 text-left mt-3 isselect">2.4GHz 四核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 4.1GHz</div>
			<div class="btn border w-80 text-left mt-3">2.8GHz 四核第八代 Intel Core i7 处理器，Turbo Boost 最高可达 4.7GHz</div>`
		$("#content>li:nth-child(1)").append(cpu);
	}

	//第一次加入这些配件
	let $cpu = $("#content>li:nth-child(1) .isselect").text();
	let $memory = $("#content>li:nth-child(2) .isselect").text();
	let $disk = $("#content>li:nth-child(3) .isselect").text();
	let $keyboard = $("#content>li:nth-child(4) .isselect").text();
	if (laptopId == 1 || laptopId == 2 || laptopId == 13 || laptopId == 37) {
		$color = "深空灰色";
	}
	if (laptopId == 7 || laptopId == 8 || laptopId == 25 || laptopId == 49) {
		$color = "银色";
	}
	let $show =
		`<h4>定制你的笔记本电脑:</h4>
					<p>${$cpu}</p>
					<p>采用原彩显示技术的视网膜显示屏</p>
					<p>${$memory}</p>
					<p>${$disk}</p>
					<p>背光键盘 - 中文 - 拼音</p>
					<p>颜色:${$color}</p>
					<br><hr><br>`;
	$("#show").append($show);

	$.ajax({
		url: "http://127.0.0.1:8080/product/findlaptop",
		data: {
			cpu: $cpu,
			memory: $memory,
			disk: $disk,
			keyboard: $keyboard,
			color: $color
		},
		type: "post",
		dataType: "json",
		success: function(result) {
			let price = result[0].price;
			$("#price").text(`RMB ${price}`);
		}
	});

});



//点击事件
$(document).ready(function() {
	$("#content div").click(function() {
		$(this).siblings().removeClass("isselect");
		$(this).addClass("isselect");

		//先清空，再添加说明
		$("#show").empty();
		let $cpu = $("#content>li:nth-child(1) .isselect").text();
		let $memory = $("#content>li:nth-child(2) .isselect").text();
		let $disk = $("#content>li:nth-child(3) .isselect").text();
		let $keyboard = $("#content>li:nth-child(4) .isselect").text();
		let $color;
		if (laptopId == 1 || laptopId == 2 || laptopId == 13 || laptopId == 37) {
			$color = "深空灰色";
		}
		if (laptopId == 7 || laptopId == 8 || laptopId == 25 || laptopId == 49) {
			$color = "银色";
		}
		let $show =
			`<h4>定制你的笔记本电脑:</h4>
						<p>${$cpu}</p>
						<p>采用原彩显示技术的视网膜显示屏</p>
						<p>${$memory}</p>
						<p>${$disk}</p>
						<p>背光键盘 - 中文 - 拼音</p>
						<p>颜色:${$color}</p>
						<br><hr><br>`;
		$("#show").append($show);


		$.ajax({
			url: "http://127.0.0.1:8080/product/findlaptop",
			data: {
				cpu: $cpu,
				memory: $memory,
				disk: $disk,
				keyboard: $keyboard,
				color: $color
			},
			type: "post",
			dataType: "json",
			success: function(result) {
				let price = result[0].price;
				$("#price").text(`RMB ${price}`);
			}
		});
	});
});



//添加到购物车
function addCart() {


	//获取用户名
	let $uid = sessionStorage.getItem("uid");
	
	//如果已经登录
	if ($uid!="") {
		let $cpu = $("#content>li:nth-child(1) .isselect").text();
		console.log($cpu);
		let $memory = $("#content>li:nth-child(2) .isselect").text();
		console.log($memory);
		let $disk = $("#content>li:nth-child(3) .isselect").text();
		console.log($disk);
		let $keyboard = $("#content>li:nth-child(4) .isselect").text();
		console.log($keyboard);
		let $color;
		if (laptopId == 1 || laptopId == 2 || laptopId == 13 || laptopId == 37) {
			$color = "深空灰色";
		}
		if (laptopId == 7 || laptopId == 8 || laptopId == 25 || laptopId == 49) {
			$color = "银色";
		}
		console.log($color);

		$.ajax({
			url: "http://127.0.0.1:8080/product/addCart",
			data: {
				uid: $uid,
				cpu: $cpu,
				memory: $memory,
				disk: $disk,
				keyboard: $keyboard,
				color: $color
			},
			type: "post",
			dataType: "json",
			success: function(result) {
				if (result) {
					alert("商品添加成功！");
				} else {
					alert("商品添加失败。。。");
				}
			}
		});
	}else{
		alert("请先登录！！！");
		window.location.href = `../login.html`;
	}
}
