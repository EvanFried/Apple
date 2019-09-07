var id = window.location.search.replace("?laptop=", "");
$(function() {
	if (id >= 1 && id <= 12) {
		let html =
			`<img src="image/mac_img/macbook-air-space-select.jpg" class="isselect">
						<img src="image/mac_img/macbook-air-silver-select.jpg">`;
		$(".first>div").append(html);
		$(".second>div").append(html);
	}
	if (id >= 13 && id <= 60) {
		let html =
			`<img src="image/mac_img/macbook-pro-space-select.jpg" class="isselect">
						<img src="image/mac_img/macbook-pro-silver-select.jpg">`;
		$(".first>div").append(html);
		$(".second>div").append(html);
	}
});
// 替换颜色选择图片

var choosesilver1, choosesilver2, choosespace1, choosespace2;
if (window.location.search == '?laptop=1') {
	choosespace1 = function() {
		$(".first>div>img:nth-child(1)").addClass("isselect");
		$(".first>ul>li:nth-child(1)>span").addClass("isselect");

		$(".first>div>img:nth-child(2)").removeClass("isselect");
		$(".first>ul>li:nth-child(2)>span").removeClass("isselect");

		$("#product>div:nth-child(1)>a").attr('href', 'detail.html?laptop=1');
	}
	choosesilver1 = function() {
		$(".first>div>img:nth-child(2)").addClass("isselect");
		$(".first>ul>li:nth-child(2)>span").addClass("isselect");

		$(".first>div>img:nth-child(1)").removeClass("isselect");
		$(".first>ul>li:nth-child(1)>span").removeClass("isselect");

		$("#product>div:nth-child(1)>a").attr('href', 'detail.html?laptop=7');
	}
	choosespace2 = function() {
		$(".second>div>img:nth-child(1)").addClass("isselect");
		$(".second>ul>li:nth-child(1)>span").addClass("isselect");

		$(".second>div>img:nth-child(2)").removeClass("isselect");
		$(".second>ul>li:nth-child(2)>span").removeClass("isselect");

		$("#product>div:nth-child(2)>a").attr('href', 'detail.html?laptop=2');
	}
	choosesilver2 = function() {
		$(".second>div>img:nth-child(2)").addClass("isselect");
		$(".second>ul>li:nth-child(2)>span").addClass("isselect");

		$(".second>div>img:nth-child(1)").removeClass("isselect");
		$(".second>ul>li:nth-child(1)>span").removeClass("isselect");

		$("#product>div:nth-child(2)>a").attr('href', 'detail.html?laptop=8');
	}
}

if (window.location.search == '?laptop=13') {
	function choosespace1() {
		$(".first>div>img:nth-child(1)").addClass("isselect");
		$(".first>ul>li:nth-child(1)>span").addClass("isselect");

		$(".first>div>img:nth-child(2)").removeClass("isselect");
		$(".first>ul>li:nth-child(2)>span").removeClass("isselect");

		$("#product>div:nth-child(1)>a").attr('href', 'detail.html?laptop=13');
	}

	function choosesilver1() {
		$(".first>div>img:nth-child(2)").addClass("isselect");
		$(".first>ul>li:nth-child(2)>span").addClass("isselect");

		$(".first>div>img:nth-child(1)").removeClass("isselect");
		$(".first>ul>li:nth-child(1)>span").removeClass("isselect");

		$("#product>div:nth-child(1)>a").attr('href', 'detail.html?laptop=25');
	}

	function choosespace2() {
		$(".second>div>img:nth-child(1)").addClass("isselect");
		$(".second>ul>li:nth-child(1)>span").addClass("isselect");

		$(".second>div>img:nth-child(2)").removeClass("isselect");
		$(".second>ul>li:nth-child(2)>span").removeClass("isselect");

		$("#product>div:nth-child(2)>a").attr('href', 'detail.html?laptop=37');
	}

	function choosesilver2() {
		$(".second>div>img:nth-child(2)").addClass("isselect");
		$(".second>ul>li:nth-child(2)>span").addClass("isselect");

		$(".second>div>img:nth-child(1)").removeClass("isselect");
		$(".second>ul>li:nth-child(1)>span").removeClass("isselect");

		$("#product>div:nth-child(2)>a").attr('href', 'detail.html?laptop=49');
	}
}
//为四个颜色选择a标签添加事件，isselect

$(function() {
	console.log(id);
	if (id == 1) {
		$.ajax({
			url: "http://127.0.0.1:8080/product/getlaptop",
			data: {
				lid: 1
			},
			type: "post",
			dataType: "json",
			success: function(result) {
				let lid = result[0].lid;
				let title = result[0].title;
				let subtitle = result[0].subtitle;
				let price = result[0].price;

				let html =
					`<div>
					<h4>${title}</h4>
					<p>${subtitle}</p>
					<h4>RMB ${price}</h4>
					<a href="">24 个月免息分期, 每月仅约 RMB 371</a><br>
					<span>含增值税及其他法定税费：约 RMB 1,034。</span>
					<a href="detail.html?laptop=${lid}" class="choose">选择</a>
					</div>`;
				$("#product").append(html);
			}
		});
		$.ajax({
			url: "http://127.0.0.1:8080/product/getlaptop",
			data: {
				lid: 2
			},
			type: "post",
			dataType: "json",
			success: function(result) {
				let lid = result[0].lid;
				let title = result[0].title;
				let subtitle = result[0].subtitle;
				let price = result[0].price;
		
				let html =
					`<div>
					<h4>${title}</h4>
					<p>${subtitle}</p>
					<h4>RMB ${price}</h4>
					<a href="">24 个月免息分期, 每月仅约 RMB 371</a><br>
					<span>含增值税及其他法定税费：约 RMB 1,034。</span>
					<a href="detail.html?laptop=${lid}" class="choose">选择</a>
					</div>`;
				$("#product").append(html);
			}
		});
	}
	if(id==13){
		$.ajax({
			url: "http://127.0.0.1:8080/product/getlaptop",
			data: {
				lid: 13
			},
			type: "post",
			dataType: "json",
			success: function(result) {
				let lid = result[0].lid;
				let title = result[0].title;
				let subtitle = result[0].subtitle;
				let price = result[0].price;
		
				let html =
					`<div>
					<h4>${title}</h4>
					<p>${subtitle}</p>
					<h4>RMB ${price}</h4>
					<a href="">24 个月免息分期, 每月仅约 RMB 371</a><br>
					<span>含增值税及其他法定税费：约 RMB 1,034。</span>
					<a href="detail.html?laptop=${lid}" class="choose">选择</a>
					</div>`;
				$("#product").append(html);
			}
		});
		$.ajax({
			url: "http://127.0.0.1:8080/product/getlaptop",
			data: {
				lid: 37
			},
			type: "post",
			dataType: "json",
			success: function(result) {
				let lid = result[0].lid;
				let title = result[0].title;
				let subtitle = result[0].subtitle;
				let price = result[0].price;
		
				let html =
					`<div>
					<h4>${title}</h4>
					<p>${subtitle}</p>
					<h4>RMB ${price}</h4>
					<a href="">24 个月免息分期, 每月仅约 RMB 371</a><br>
					<span>含增值税及其他法定税费：约 RMB 1,034。</span>
					<a href="detail.html?laptop=${lid}" class="choose">选择</a>
					</div>`;
				$("#product").append(html);
			}
		})
	}
});
