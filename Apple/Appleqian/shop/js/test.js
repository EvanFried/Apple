$(function() {
	var i=window.location.hash.replace("#?lid=","");
	console.log(i);
    $.ajax({
        url: "http://127.0.0.1:8080/product/getlaptop",
				data:{lid:i},
        type: "post",
        dataType: "json",
        success: function(result) {
            console.log(result);
        }
    })
});
