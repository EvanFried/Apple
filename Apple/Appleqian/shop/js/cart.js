$(function() {
	//获取用户名
	let $uid = sessionStorage.getItem("uid");
	$.ajax({
		url: "http://127.0.0.1:8080/product/getCart",
		data: {
			uid: $uid
		},
		type: "post",
		dataType: "json",
		success: function(result) {
			if (result) {
				$('#totalshop').text(result.length); //统计一共有多少件商品!!!

				let $selectshop = 0; //统计多少商品被选中
				let $totalprice = 0; //统计总价
				for (let i = 0; i < result.length; i++) {
					let $iid = result[i].iid;
					let $lid = result[i].product_id;
					let $is_checked = result[i].is_checked;
					//取出laptop各项数据
					$.ajax({
						url: "http://127.0.0.1:8080/product/getlaptop",
						data: {
							lid: $lid
						},
						type: "post",
						dataType: "json",
						success: function(presult) {
							let $imgurl;
							if (presult[0].lname == "MacBook Air") {
								$imgurl = `image/macbook-air_img/macbook-air.jpg`;
							}
							if (presult[0].lname == "MacBook Pro") {
								$imgurl = `image/macbook-pro_img/macbook-pro.jpg`;
							}
							let $lid = presult[0].lid;
							let $lname = presult[0].lname;
							let $resolution = presult[0].resolution;
							let $cpu = presult[0].cpu;
							$cpu = $cpu.split("，")[0];
							$cpu = $cpu.split(",")[0];
							let $memory = presult[0].memory;
							let $disk = presult[0].disk;
							let $keyboard = presult[0].keyboard;
							let $price = presult[0].price;

							//生成html片段
							let html = ``;

							if ($is_checked == 1) {
								html += `<tr><td><input type="checkbox" cartData=${$iid} checked /></td>`

								$selectshop++; //被选中商品加1
								$totalprice += $price; //累加总价的金额
							}
							if ($is_checked == 0) {
								html += `<tr><td><input type="checkbox" cartData=${$iid} /></td>`
							}
							//填充html
							html +=
								`<td><img src="${$imgurl}"></td>
							<td>${$lname}</td>
							<td>${$resolution}</td>
							<td>${$cpu}</td>
							<td>${$memory}</td>
							<td>${$disk}</td>
							<td>${$keyboard}</td>
							<td>${$price}</td>
							<td><a href="javascript:;" cartData=${$iid} >删除</a></td><tr>
							`;
							$("#things table").append(html); //把商品放入表格中
							$('#selectshop').text($selectshop); //统计一共有多少件商品被选中
							$('#totalprice').text($totalprice); //统计商品的总价
						}
					})
				}
			} else {
				console.log("购物车为空!");
			}

		}
	})
});

//a标签点击删除事件
$(document).ready(function() {
	$("#things").on("click", "a", function() {
		let $iid = $(this).attr("cartData");

		if (window.confirm("是否确认要删除?")) {
			$.ajax({
				url: "http://127.0.0.1:8080/product/deleteCart",
				data: {
					iid: $iid
				},
				type: "post",
				dataType: "json",
				success: function(result) {
					if (result) {
						alert("删除成功!");
						//刷新页面，重新加载
						window.location.reload();
					} else {
						alert("删除失败。。。");
					}
				}
			});
		} else {
			alert("不删了");
		}
	});

	$('#things').on("click", "input", function() {
		let status = $(this).prop("checked");
		if (status == false) {
			status = 0;
			console.log(status);
		}
		if (status == true) {
			status = 1;
			console.log(status);
		}
		let $iid = $(this).attr("cartData");
		$.ajax({
			url: "http://127.0.0.1:8080/product/changeChecked",
			data: {
				iid: $iid,
				is_checked: status
			},
			type: "post",
			dataType: "json",
			success: function(result) {
				if (result) {
					//获取用户名
					let $uid = sessionStorage.getItem("uid");
					$.ajax({
						url: "http://127.0.0.1:8080/product/getCart",
						data: {
							uid: $uid
						},
						type: "post",
						dataType: "json",
						success: function(result) {
							if (result) {
								$('#totalshop').text(result.length); //统计一共有多少件商品!!!

								let $selectshop = 0; //统计多少商品被选中
								let $totalprice = 0; //统计总价
								for (let i = 0; i < result.length; i++) {
									let $lid = result[i].product_id;
									let $is_checked = result[i].is_checked;
									//取出laptop各项数据
									$.ajax({
										url: "http://127.0.0.1:8080/product/getlaptop",
										data: {
											lid: $lid
										},
										type: "post",
										dataType: "json",
										success: function(presult) {
											let $price = presult[0].price;

											if ($is_checked == 1) {
												$selectshop++; //被选中商品加1
												$totalprice += $price; //累加总价的金额
											}
											if ($is_checked == 0) {}
											$('#selectshop').text($selectshop); //统计一共有多少件商品被选中
											$('#totalprice').text($totalprice); //统计商品的总价
										}
									})
								}
							}else {
								console.log("购物车为空!");
							}
						}
					})
				} else {
					alert("商品选中状态改变失败。");
				}
			}
		});
	});


});
