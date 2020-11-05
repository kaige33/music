<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">
    <title>Track Stacking</title>
      <!-- Bootstrap CSS -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/carousel.css" >

      <!-- Animate CSS https://daneden.github.io/animate.css/-->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css" >
      <!-- simple-line-icons CSS http://www.bootcdn.cn/simple-line-icons/-->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/simple-line-icons.css" >
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/player.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/iconfont/iconfont.css">

      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/audio.css">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/demo.css">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cool.css">

      <style>
          body{
              padding-bottom: 6rem;
          }
          .hide{
              display: none;
          }
          .ahover{
              color:#818182;
          }
          .img-logo{
              height:50px;
              width:50px;
              margin-top:1px;
          }
          .fl{
              float:left;
          }
          .float-right{
              float:right;
          }
          .media-left, .media-right, .media-body{
              display: table-cell;
              vertical-align: top;
          }
          .media-heading {
              margin-top: 0;
              margin-bottom: 5px;
          }
          .ds-time{
              color: #999;
          }
          .border-line{
              border-bottom: 1px solid #cfcfcf;
          }
          .border-line-color{
              border-bottom: 2px solid #2AD980;
          }
          .custom-select-override {
              display: inline-block;
              height: calc(2.25rem + 2px);
              padding: .375rem 1.75rem .375rem .75rem;
              line-height: 1.5;
              color: #495057;
              vertical-align: middle;
              background: #fff url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 4 5'%3E%3Cpath fill='%23343a40' d='M2 0L0 2h4zm0 5L0 3h4z'/%3E%3C/svg%3E") no-repeat right .75rem center;
              background-size: auto auto;
              background-size: 8px 10px;
              border: 1px solid #ced4da;
              border-radius: .25rem;
              -moz-appearance: none;
          }
          .margin-left-m{
              margin-left:15px;
          }
          .custom-file-input-{
              position: relative;
              z-index: 2;
              width: 100%;
              height: calc(2.25rem + 2px);
              margin: 0;
          }
      </style>
  </head>
  <body>

  <!-- 播放器栏 -->
  <nav class=" fixed-bottom hide" id="playerId">
      <div class="audio-box">
          <div class="audio-container">
              <div class="audio-cover" style="background-image: url(&quot;images/cover.jpg&quot;);"></div>
              <div class="audio-view">
                  <h1 class="audio-title">track stacking</h1>
                  <!-- 进度条 -->
                  <div class="audio-body">
                      <div class="audio-backs">
                          <div class="audio-this-time">00:35</div>
                          <div class="audio-count-time">01:03</div>
                          <div class="audio-setbacks">
                              <i class="audio-this-setbacks" style="width: 0.0%;">
                                  <span class="audio-backs-btn"></span>
                              </i>
                              <span class="audio-cache-setbacks" style="width: 100%;">
								</span>
                          </div>
                      </div>
                  </div>
                  <!-- 控制选项 -->
                  <div class="audio-btn">
                      <div class="audio-select">
                          <div class="audio-prev"></div>
                          <!-- <div class="audio-play audio-stop"></div> -->
                          <div class="audio-play"></div>
                          <div class="audio-next"></div>
                          <div class="icon-shuffle icon-loop" id="play-pattern" title="单曲循环"></div>
                          <div class="audio-menu"></div>
                          <div class="audio-volume"></div>
                      </div>
                      <div class="audio-set-volume">
                          <div class="volume-box">
                              <i style="height: 80%;"><span></span></i>
                          </div>
                      </div>
                      <!-- 播放列表 -->
                      <div class="audio-list">
                          <div class="audio-list-head">
                              <p>播放列表</p>
                              <span class="menu-close">关闭</span>
                          </div>
                          <ul class="audio-inline"><li></li></ul>
                      </div>
                  </div><!-- 控制选项 End-->

              </div>
          </div>
      </div>
  </nav><!-- 播放器栏 End-->
  
     <div class="container">
      	<h1></h1>
      	<h3>新碟上架 发现你的新世界</h3>
      	<div class="row content hot-content">
      	    <!-- 前DIV -->
      	    <div class="col-sm-1">
      	        <!-- 小跳动特效框 -->
      	    	<div class=" ">
                        <span class="musicbar animate bg-empty inline m-r-lg m-t" style="width:50px;height:60px">
                          <span class="bar1 a3 lter"></span>
                          <span class="bar2 a5 lt"></span>
                          <span class="bar3 a1 bg"></span>
                          <span class="bar4 a4 dk"></span>
                          <span class="bar5 a2 dker"></span>
                        </span>
                </div><!-- 小跳动特效框 End-->
      	    </div><!-- 该前DIV为了中DIV居中 -->
      	    
      		<!--中DIV 歌曲部分-->
            <div class="col-sm-10 h-item border"><!-- 中DIV -->
               
      		  <!-- One of three columns -->
      		  <ul class="list-group list-group-flush" >
				
				<c:forEach items="${song}" var="song" varStatus="status">
				
                      <li class="list-group-item list-group-item-light " idd="${song.songId}" title="${song.songName}">
                      	<!-- 歌曲信息区 -->
                      	<div class="clear text-ellipsis">
                          <%-- <span>${status.index+1}.${song.songName}</span> --%>
                          <span><a href="#" class="ahover" onclick="reviewLoad(${song.songId})">${status.index+1}.${song.songName}</a></span>
                          <span class="text-muted"> 龙航牛逼</span>
                          <span class="text-danger icon-fire"></span>
                        </div>
                        <!-- 播放控制区 downloadFun(${song.songUrl})-->
                        <div class="pull-right m-l fr">
	                        <a href="javascript:;" class="play m-r-sm" title="播放" onclick="playFunc(${song.songId})" id="play${song.songId}" name="${song.songName}" address="${song.songUrl}">
	                          <i class="icon-control-play text  "></i>
	                          <!-- <i class="icon-control-pause text-active"></i> -->
	                        </a>
	                        <a href="${pageContext.request.contextPath}/download.do?songAddress=${song.songUrl}&songId=${song.songId}" class="m-r-sm" title="下载"><i class="icon-cloud-download"></i></a>
	                         
	                         <a href="javascript:;"
	                         <%--<c:choose>--%>
	                         	<%--<c:when test="${song.collectionCount}">class="collect m-r-sm text-danger"</c:when>--%>
	                         	<%--<c:otherwise>class="collect m-r-sm"</c:otherwise>--%>
	                         <%--</c:choose>--%>
	                          <%--<c:if test="${song.whetherCollected}">class="collect m-r-sm text-danger" </c:if>--%>
	                         onclick="collectFunc(${song.songId})" id="${song.songId}" title="喜欢"><i class="icon-heart"></i>
	                         </a>
                        </div>
                        
                      </li>
                      
                   </c:forEach>
                      
                 </ul>
      		
   			 </div><!--中DIV 歌曲部分 End-->
   			 <!-- 后DIV -->
   			 <div class="col-sm-1"></div><!-- 该后DIV为了中DIV居中 -->
   			 
      	</div>
		
	  </div><!-- /.container -->

  </body>
</html>
