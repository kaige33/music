//获取所有排行榜
function rank1(){
	$.ajax({
		type: "get",
		data:{
			format: "jsonp",
			version:9108,
			plat:0,
			showtype:2,
			parentid:0,
			apiver:6,
			area_code:1,
			withsong:1
		},
		url: "http://mobilecdnbj.kugou.com/api/v3/rank/list",
		dataType: "jsonp",
		jsonp: "callback",
		async: true,
		success: function(data) {
			var rank=data.data.info;
			var biaoshneg=rank[0];
		},
		error: function(e) {
			alert(e.statusText);
		},
		});
}