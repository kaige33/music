<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/2
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ccs1/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ccs1/carousel.css" >

    <!-- Animate CSS https://daneden.github.io/animate.css/-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ccs1/animate.css" >
    <!-- simple-line-icons CSS http://www.bootcdn.cn/simple-line-icons/-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ccs1/simple-line-icons.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ccs1/player.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ccs1/iconfont/iconfont.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ccs1/audio.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ccs1/demo.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ccs1/cool.css">
    <script src="${pageContext.request.contextPath}/js1/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js1/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js1/bootstrap.min.js"></script>

    <script src="${pageContext.request.contextPath}/js1/audio.js"></script>
    <script src="${pageContext.request.contextPath}/js1/add2list.js"></script>


    <script>
        $(function(){
            $('#headerId').load("headerFrameLoad.do");
        });
    </script>
    <style type="text/css">

        /*标题样式*/
        body{
            padding-bottom: 6rem;
        }
        .hide{
            display: none;
        }

        .float-right{
            float:right;
        }
        .imgBox{
            border-top: 0px solid cadetblue;
            width: 100%;
            height: 500px;
            margin: 0 auto;

        }

        .imgBox img{
            width: 100%;
            height: 450px;
            margin: 0 auto;
            padding-top: 0px;

        }

        .img1{
            display: block;
        }

        .img2{
            display: none;
        }

        .img3{
            display: none;
        }
    </style>
</head>
<body>

<div class="imgBox">
    <img class="img-slide img1" src="${pageContext.request.contextPath}/img/1.jpg" alt="1">
    <img class="img-slide img2" src="${pageContext.request.contextPath}/img/2.jpg" alt="2">
    <img class="img-slide img3" src="${pageContext.request.contextPath}/img/3.jpg" alt="3">
</div>
</body>
<script type="text/javascript">
    var index=0;
    //改变图片
    function ChangeImg() {
        index++;
        var a=document.getElementsByClassName("img-slide");
        if(index>=a.length) index=0;
        for(var i=0;i<a.length;i++){
            a[i].style.display='none';
        }
        a[index].style.display='block';
    }
    //设置定时器，每隔两秒切换一张图片
    setInterval(ChangeImg,5000);
</script>


<div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
        <div class="col-lg-4">
            <img class="rounded-circle" src="${pageContext.request.contextPath}/img/5.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>热门推荐</h2>
            <p>聆听潮流的声音</p>
            <p id="trendingRecId"><a class="btn btn-secondary" href="#" role="button">查看详情 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
            <img class="rounded-circle" src="${pageContext.request.contextPath}/img/4.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>新碟上架</h2>
            <p>发现你的新世界</p>
            <p id="newTrackOnShelfId"><a class="btn btn-secondary" href="#" role="button">查看详情 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
            <img class="rounded-circle" src="${pageContext.request.contextPath}/img/6.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>个性化推荐</h2>
            <p>每天早上6点更新</p>
            <p id="personalizedRecId"><a class="btn btn-secondary" href="#" role="button">查看详情 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->

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

<!-- FOOTER -->
<footer class="container">
    <p class="float-right"><a href="#">返回顶部</a></p>
    <p>&copy; 2020-2021伟大的凯为袁志富定制 &middot; <a href="http://www.4399.com/">GitHub</a></p>
</footer>
</body>
</html>
