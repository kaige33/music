$(function() {
	$("#imgfile").change(function(e) {
		var imgBox = e.target;
		uploadImg(imgBox);
	});
	function uploadImg(tag) {
		var file = tag.files[0];
		var imgSrc;
		if (!/image\/\w+/.test(file.type)) {
			return false;
		}
		var reader = new FileReader();
		reader.readAsDataURL(file);
		reader.onload = function() {
			// console.log(this.result);
			imgSrc = this.result;
			$("#imgsrc").attr("src", imgSrc);
		};
	}
});
function changeimg() {
	$("#imgfile").click();
}
function ajaxtest() {
	$.ajax({
		type : "get",
		data : {
			format : "jsonp",
			version : 9108,
			plat : 0,
			showtype : 2,
			parentid : 0,
			apiver : 6,
			area_code : 1,
			withsong : 1,
			with_res_tag : 1
		},
		url : "http://mobilecdnbj.kugou.com/api/v3/rank/list",
		dataType : "jsonp",
		jsonp : "callback",
		async : true,
		success : function(data) {
			alert("111");
		},
		error : function(e) {
			alert(e.statusText);
		},
	});
}
// 根据歌名查找歌曲
function ajax() {
	$("#Searchfrom").submit();
	$.ajax({
				type : "get",
				data : {
					format : "jsonp",// 必须要加,不然返回load错误
					keyword : $("#keyword").val(),
					page : 1,
					pagesize : 20,
					showtype : 1
				},
				url : "http://mobilecdn.kugou.com/api/v3/search/song",
				dataType : "jsonp",
				jsonp : "callback",
				async : false,
				success : function(data) {
					var musicjson = new Array();
					musicjson = data.data.info;
					// alert(musicjson[0].hash);
					// $("#p1").html(musicjson[0].songname);
					for (var i = 0; i < musicjson.length; i++) {
						var tr = "<tr id='tr1'><td>"
								+ musicjson[i].songname
								+ "<div class=\"Btmusic\"><img src=\"img/play_1.png\" onclick=\"getmusic('"
								+ musicjson[i].hash + "')\"/></div></td><td>"
								+ musicjson[i].singername + "</td></tr>";
						$("#iframe").contents().find("table>tbody").append(tr);
					}
					// $("#iframe").contents().find("table>tbody").on("click",
					// "tr", function() {
					// getmusic($(this).attr("value"));
					// });
					// / / getmusic(musicjson[0].hash);
				},
				error : function(e) {
					alert("请输入关键字");
				}
			});
}
// / /根据歌曲hash获取歌曲详情
function getmusic(musichash) {
	$.ajax({
		type : "get",
		url : "http://www.kugou.com/yy/index.php?r=play/getdata&hash="
				+ musichash,
		dataType : "jsonp",
		jsonp : "callback",
		async : true,
		success : function(data) {
			// alert(data.data.play_url);
			// / / alert(data.data.img);
			// / / alert(data.data.audio_name);
			parent.hashsong = musichash;
			window.parent.audioFn.newSong({
				'cover' : data.data.img,
				'src' : data.data.play_url,
				'title' : data.data.audio_name
			}, true);
			var singerid;
			$.ajax({
				url : "findSingerUrl.action",
				data : {
					"name" : data.data.author_name,
					"photo" : data.data.authors[0].avatar
				},
				async : false,
				success : function(data) {
					singerid = data.userid;
				}
			});
			download(data.data.audio_name, data.data.play_url, data.data.img,
					data.data.filesize, singerid);
		},
		error : function(e) {
			alert("没找到此歌曲");
		}
	});
}
function play_music(id,img,play_url,audio_name){
	window.parent.audioFn.newSong({
		'cover' : img,
		'src' : play_url,
		'title' : audio_name
	}, true);
	$.ajax({url:"update_number.action",data:{"id":id}});
	parent.$("#message_button").attr("href","music_message.action?id="+id);
}
function downloadmp3(url){
	window.location.href ="download.action?filename="+url;
}
function download(name, url_mp3, url_photo, filesize, singerid) {
	$.ajax({
		url : "upload.action",
		data : {
			"name" : name,
			"path" : url_mp3,
			"photo" : url_photo,
			"size" : filesize,
			"userid" : singerid
		},
		async : false
	});
}
// / /把文件转换成可读URL
function getObjectURL(file) {
	var url = null;
	if (window.createObjectURL != undefined) { // / / basic
		url = window.createObjectURL(file);
	} else if (window.URL != undefined) { // / / mozilla(firefox)
		url = window.URL.createObjectURL(file);
	} else if (window.webkitURL != undefined) { // / / webkit or chrome
		url = window.webkitURL.createObjectURL(file);
	}
	return url;
}
// 点击按钮弹出编辑歌单模态框
function updatemenu(id) {
	$.ajax({
		url : "findSongMenu.action?menuid=" + id,
		success : function(data) {
			$("#imgsrc").attr("src", data.photo);
			$("#songmenuid").val(data.songmenuid);
			$("#menuname").val(data.menuname);
			$("#theme").val(data.theme);
			$("#style").val(data.style);
			$("#language").val(data.language);
		},
		error : function(e) {
			alert("找不到歌单，错误代码：" + e.status);
		}
	});
	$("#update-songmenu").modal("show");
}
function insertCollect() {
	$.ajax({
		url : "insertsongmenulist.action",
		data : {
			"musicid" : $("#musicid").val(),
			"songmenuid" : $("#sel1").val()
		},
		success : function(result) {
			if(result){
				$("#add_songmenu").modal("hide");
				alert("添加成功");
			}else{
				alert("添加失败");
			}
		}
	});
	
}
// 打开歌单模态框
function add_songmenu(userid, musicid) {
	if (!userid) {
		alert("请先登录！");
		return;
	}
	$("#musicid").attr("value", musicid);
	$.ajax({
		url : "findUserSongMenu.action",
		data : {
			userid : userid
		},
		success : function(result) {
			if (result == null || result == "") {
				if (confirm("请创建歌单！")) {
					window.location.href = "person_listmenu.action?userid="
							+ userid;
				}
				;
			} else {
				for (var i = 0; i < result.length; i++) {
					var option = "<option value=" + result[i].songmenuid + ">"
							+ result[i].menuname + "</option>";
					$("#sel1").append(option);
				}
				$("#add_songmenu").modal("show");
			}
		},
		error : function() {
			alert("错误！");
		}
	});
}
function stop_play(id){
	window.parent.audioFn.stopAudio();
	window.location.href = "mv_play.action?id="
		+ id;
}