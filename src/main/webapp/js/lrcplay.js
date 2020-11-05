function lrc_hashsong() {
	$.ajax({
		type : "get",
		url : "http://www.kugou.com/yy/index.php?r=play/getdata&hash="
				+ parent.hashsong,
		dataType : "jsonp",
		jsonp : "callback",
		async : false,
		success : function(data) {
			$("#musicImg").attr("src", data.data.img);
			var Json = data.data.lyrics;
			lrc_plar(Json);
		},
		error : function(e) {
			lrc_songname();
		}
	});
}
function lrc_plar(Json) {
	var i = 10;
	var lrcJSON = {};
	while (Json.match(/\[.*\]/g)[i]) {
		lrcJSON[Json.match(/\[.*\]/g)[i] + ""] = Json.match(/\].*/g)[i]
				.substr(1);
		i++;
	}
	var lrcTime = []; // 歌词对应的时间数组
	var ul = $("#lrclist")[0]; // 获取ul
	var i = 0;
	$.each(lrcJSON, function(key, value) { // 遍历lrc
		lrcTime[i++] = parseFloat(key.substr(1, 3)) * 60
				+ parseFloat(key.substring(4, 10)); // 00:00.000转化为00.000格式
		ul.innerHTML += "<li><p>" + lrcJSON[key] + "</p></li>"; // ul里填充歌词
	});
	lrcTime[lrcTime.length] = lrcTime[lrcTime.length - 1] + 3; // 如不另加一个结束时间，到最后歌词滚动不到最后一句
	var $li = $("#lrclist>li"); // 获取所有li
	var currentLine = 0; // 当前播放到哪一句了
	var currentTime; // 当前播放的时间
	var audio = window.parent.audioFn.audio;
	$("#musicimg").src = window.parent.audioFn.cover;
	var ppxx; // 保存ul的translateY值
	// 让ul标签随着audio的时间改变
	audio.ontimeupdate = function() { // audio时间改变事件
		currentTime = audio.currentTime;
		for (j = currentLine, len = lrcTime.length; j < len; j++) {
			if (currentTime < lrcTime[j + 1] && currentTime > lrcTime[j]) {
				currentLine = j;
				ppxx = 250 - (currentLine * 32);
				ul.style.transform = "translateY(" + ppxx + "px)";
				$li.get(currentLine - 1).className = "";
				$li.get(currentLine).className = "on";
				break;
			}
		}
	};
	audio.onseeked = function() { // audio进度更改后事件
		currentTime = audio.currentTime;
		// console.log(" off" + currentLine);
		for (i = 0; i < $li.length; i++)
			$li.get(i).className = "";
		for (k = 0, len = lrcTime.length; k < len; k++) {
			if (currentTime < lrcTime[k + 1] && currentTime < lrcTime[k]) {
				currentLine = k;
				// 移动歌词
				ppxx = 250 - (currentLine * 32);
				ul.style.transform = "translateY(" + ppxx + "px)";

				$li.get(currentLine).className = "on";
				break;
			}
		}
	};
}
//根据歌名查找歌曲
function lrc_songname() {
	$.ajax({
		type : "get",
		data : {
			format : "jsonp",// 必须要加,不然返回load错误
			keyword : parent.$(".audio-title").text(),
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
			for (var i = 0; i < musicjson.length; i++) {
				var li="<li class='list-group-item lrc_list_li' value="+musicjson[i].hash+">"+parent.$(".audio-title").text()+"<li>";
				$("#lrc_list").append(li);
			}
			$("#lrc_list").on("click","li",function(){
				parent.hashsong=$(this).attr("value");
				lrc_hashsong();
				$("#lrc_playmenu").modal("hide");
			});
			parent.hashsong=musicjson[0].hash;
			if(parent.hashsong!="")lrc_hashsong();
		},
		error : function(e) {
			alert("当前歌名为空");
		}
	});
}
function open_lrc_songname(){
	$("#lrc_playmenu").modal("show");
}