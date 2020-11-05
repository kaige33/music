<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">

    <title>音乐播放器</title>
    <%--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/audio.css">--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/music.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/music.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    <%--1--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/ccs1/bootstrap.min.css">--%>
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
    <%--<script src="${pageContext.request.contextPath}/js1/jquery-3.3.1.min.js"></script>--%>
    <script src="${pageContext.request.contextPath}/js1/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js1/audio.js"></script>
    <script src="${pageContext.request.contextPath}/js1/add2list.js"></script>
    <script type="text/javascript">


        $(function () {
            $("#iframe").height($(window).height() - $("#navbar").height() - 50);
            $(window).resize(
                function () {
                    $("#iframe").height(
                        $(window).height() - $("#navbar").height() - 50);
                });
            $("#leadmp3").change(function () {
                var objUrl = getObjectURL(this.files[0]);
                /* 向歌单中添加新曲目，第二个参数true为新增后立即播放该曲目，false则不播放 */
                audioFn.newSong({
                    'cover': 'img/cover.jpg',
                    'src': objUrl,
                    'title': this.files[0].name
                }, false);
            });
        });

        function change(url) {
            $("#iframe").attr("src", url);
        }
    </script>
    <style type="text/css">
        *[hidden] {
            display: none;
        }
    </style>


    <nav class="navbar navbar-inverse" style="margin: 0px;"
         role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="javascript:;"
                   onclick="change('index.jsp')">凯哥音乐</a>
            </div>
            <div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="javascript:;"
                                          onclick="change('${pageContext.request.contextPath}/index.jsp')">首页</a></li>
                    <li><a href="javascript:;"
                           onclick="change('${pageContext.request.contextPath}/newTrackOnShelfFrame.jsp')">排行榜</a></li>
                    <li><a href="javascript:;"
                           onclick="change('${pageContext.request.contextPath}/personalizedRecFrame.jsp')">歌手</a></li>
                    <li><a href="javascript:;" onclick="change('player.html')">播放器</a></li>
                    <li><a href="javascript:;"
                           onclick="change('findSongMenuByPage.action?currPage=1')">歌单</a></li>
                </ul>
                <form id="Searchfrom" class="navbar-form navbar-left" role="search"
                      action="search.jsp" target="iframe">
                    <div class="form-group">
                        <input type="text" id="keyword" class="form-control"
                               placeholder="请输入关键字" onkeydown="return event.keyCode != 13;">
                    </div>
                    <button type="button" class="btn btn-default" onclick="ajax()">搜索</button>
                </form>
                <div class="navbar-right" style="padding-right: 20px;">
                    <ul class="nav navbar-nav">
                        <c:if test="${sessionScope.userCustom==null }">
                            <li><a data-toggle="modal" data-target="#register">注册</a></li>
                            <li><a data-toggle="modal" data-target="#login">登录</a></li>
                        </c:if>
                        <c:if test="${sessionScope.userCustom!=null }">
                            <li><img src="${sessionScope.userCustom.headSculptureUrl }"
                                     class="img-circle" style="height: 50px; width: 50px;"></li>
                            <li class="dropdown"><a href="#" class="dropdown-toggle"
                                                    data-toggle="dropdown">${sessionScope.userCustom.userName } <b
                                    class="caret"></b>
                            </a>
                                <ul class="dropdown-menu">
                                    <li><a data-toggle="modal" data-target="#person">个人信息</a></li>
                                    <li class="divider"></li>
                                    <li><a href="javascript:;"
                                           onclick="change('person_listmenu.action?userid=${sessionScope.userCustom.userid }')">我的收藏</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li><a data-toggle="modal" data-target="#updatepassword">修改密码</a></li>
                                    <li class="divider"></li>
                                    <li><a href="quite.action">退出</a></li>
                                </ul>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <iframe scrolling="yes" rameborder="0" src="${pageContext.request.contextPath}/index.jsp"
            style="width: 100%;" id="iframe" name="iframe"></iframe>


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


    <!-- 模态框（Modal） -->
    <!-- 导入窗口-->
    <div id="leading" class="modal fade" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <button class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-title">
                    <h1 class="text-center">请选择文件</h1>
                </div>
                <div class="modal-body">
                    <input id="leadmp3" type="file" multiple="multiple"/>
                    <div class="text-right">
                        <button class="btn btn-danger" data-dismiss="modal">确定</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 注册窗口 -->
    <div id="register" class="modal fade" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <button class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-title">
                    <h1 class="text-center">注册</h1>
                </div>
                <div class="modal-body">
                    <form class="form-group" action="/user/register">
                        <div class="form-group">
                            <%--@declare id=""--%><label for="">用户名</label> <input class="form-control" type="text"
                                                                                   name="loginId"
                                                                                   placeholder="6-15位字母或数字">
                        </div>
                        <div class="form-group">
                            <label for="">密码</label> <input class="form-control"
                                                            name="password" type="password" placeholder="至少6位字母或数字">
                        </div>
                        <div class="form-group">
                            <label for="">姓名</label> <input class="form-control" type="text"
                                                            name="userName">
                        </div>
                        <%--     <div class="form-group">
                                 <label for="">邮箱</label> <input class="form-control" type="email"
                                                                 name="email" placeholder="例如:123@123.com">
                             </div>--%>
                        <%--   <div class="form-group">
                               <label for="">电话</label> <input class="form-control" type="text"
                                                               name="tel">
                           </div>--%>
                        <div class="text-right">
                            <button class="btn btn-primary" type="submit">提交</button>
                            <button class="btn btn-danger" data-dismiss="modal">取消</button>
                        </div>
                        <a href="" data-toggle="modal" data-dismiss="modal"
                           data-target="#login">已有账号？点我登录</a>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!--修改密码-->
    <div id="updatepassword" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <button class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-title">
                    <h1 class="text-center">修改密码</h1>
                </div>
                <div class="modal-body">
                    <form class="form-group" action="/user/updatepwd" method="post">
                        <input type="hidden" name="userid" value="${sessionScope.userCustom.userid}">
                        <div class="form-group">
                            <label for="">旧密码</label> <input class="form-control" name="password1" id="password" type="password" placeholder="请输入旧密码">
                        </div>
                        <div class="form-group">
                            <label for="">新密码</label> <input class="form-control" name="password2" id="password1" type="password" placeholder="请输入新密码"><span id="tip1"></span>
                        </div>
                        <div class="form-group">
                            <label for="">再次输入</label> <input class="form-control" name="password" id="password2" type="password" placeholder="再次输入密码"><span id="tip2"></span>
                        </div>
                        <div class="text-right">
                            <button class="btn btn-primary" type="submit">修改</button>
                            <button class="btn btn-danger" data-dismiss="modal">取消</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- 登录窗口 -->
    <div id="login" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <button class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-title">
                    <h1 class="text-center">登录</h1>
                </div>
                <div class="modal-body">
                    <form class="form-group" action="/user/login" method="post">
                        <div class="form-group">
                            <label for="">用户名</label> <input class="form-control" type="text"
                                                             name="loginid" placeholder="请输入用户名">
                        </div>
                        <div class="form-group">
                            <label for="">密码</label> <input class="form-control"
                                                            name="password" type="password" placeholder="请输入密码">
                        </div>
                        <div class="text-right">
                            <button class="btn btn-primary" type="submit">登录</button>
                            <button class="btn btn-danger" data-dismiss="modal">取消</button>
                        </div>
                        <a href="" data-toggle="modal" data-dismiss="modal"
                           data-target="#register">还没有账号？点我注册</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--个人信息页面-->
    <div id="person" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <button class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-title">
                    <h1 class="text-center">个人信息</h1>
                </div>
                <div class="modal-body">
                    <form class="form-group" action="updateImg.action"
                          enctype="multipart/form-data" method="post">
                        <div class="col-sm-4" style="text-align: center;">
                            <input type="hidden" name="id"
                                   value="${sessionScope.userCustom.userid }"> <img
                                src="${sessionScope.userCustom.headSculptureUrl}" id="img1"
                                height="100px" width="100px" class="img-circle"><br/> <br/>
                        </div>
                        <div class="col-sm-8">
                            <div class="form-group">
                                <label for="">昵称</label> ${sessionScope.userCustom.userName }
                            </div>
                            <div class="form-group">
                                <label for="">账号</label> ${sessionScope.userCustom.loginId }
                            </div>
                            <div class="form-group">
                                <label for="">性别</label>
                                <c:if test="${sessionScope.userCustom.userSex==0 }">男</c:if>
                                <c:if test="${sessionScope.userCustom.userSex==1 }">女</c:if>
                            </div>
                            <div class="form-group">
                                <label for="">身份</label> ${sessionScope.userCustom.userType }
                            </div>
                            <div class="form-group">
                                <label for="">个人简介</label> ${sessionScope.userCustom.sign }
                            </div>
                        <div class="form-group">
                                <label for="">生日</label>
                                <fmt:formatDate value="${sessionScope.userCustom.birthday }"
                                                pattern="yyyy-MM-dd"/>
                            </div>
                            <%--<div class="form-group">--%>
                                <%--<label for="">地址</label> ${sessionScope.userCustom.adress }--%>
                            <%--</div>--%>
                            <%--<div class="form-group">--%>
                                <%--<label for="">个人简介</label> ${sessionScope.userCustom.note }--%>
                            <%--</div>--%>
                        </div>
                        <div class="text-right">
                            <button class="btn btn-primary" type="button" data-toggle="modal"
                                    data-dismiss="modal" data-target="#person-update">编辑
                            </button>
                            <button class="btn btn-danger" data-dismiss="modal">关闭</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--个人信息修改页面-->
    <div id="person-update" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <button class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-title">
                    <h1 class="text-center">个人信息</h1>
                </div>
                <div class="modal-body">

                    <form class="form-group" action="${pageContext.request.contextPath}/user/updateuser" method="post">
                        <div class="col-sm-4" style="text-align: center;">
                        <input type="hidden" name="userid"
                               value="${sessionScope.userCustom.userid }">

                        <%--<img name="headS"--%>
                                <%--src="${sessionScope.userCustom.headSculptureUrl}" id="imgsrc"--%>
                                <%--height="100px" width="100px" class="img-circle"><br/> <br/>--%>
                        <%--<input id="imgfile" name="file" type="file" id="file"--%>
                               <%--style="display: none;"/>--%>
                        <%--<button type="button" class="btn  btn-default"--%>
                                <%--onclick="changeimg()">选择头像--%>
                        <%--</button>--%>
                        <%--<button type="submit" class="btn  btn-default">上传头像</button>--%>
                        </div>
                        <div class="form-group">
                            <label for="">路径</label> <input type="text" class="form-control"
                                                            name="headSculptureUrl" value="${sessionScope.userCustom.headSculptureUrl}"/>
                        </div>
                        <div class="form-group">
                            <label for="">昵称</label> <input type="text" class="form-control"
                                                            name="userName" value="${sessionScope.userCustom.userName }"/>
                        </div>
                        <div class="form-group">
                            <label for="">性别</label> <input type="radio" name="userSex" value="1"
                                                            <c:if test="${sessionScope.userCustom.userSex==1 }">checked</c:if>>男
                            <input type="radio" name="userSex" value="2"
                                   <c:if test="${sessionScope.userCustom.userSex==2 }">checked</c:if>>女
                        </div>
                        <%--<div class="form-group">--%>
                            <%--<label for="">年龄</label> <input type="text" class="form-control"--%>
                                                            <%--name="age" value="${sessionScope.userCustom.age }"/>--%>
                        <%--</div>--%>
                        <div class="form-group">
                            <label for="">生日</label>
                         <%--  // <script src="/MusicPlayer_SSM/js/laydate/laydate.js"></script>--%>
                            <input type="date" class="form-control" name="birth"
                                   id="birthday"
                                   value="${sessionScope.userCustom.birthday }"
								/>
                                   <%--data-validate="required:日期不能为空"--%>
                                   <%--style="padding: 10px !important; height: auto !important; border: 1px solid #ddd !important;"/>--%>
                            <%--<script type="text/javascript">--%>
                                <%--laydate.render({--%>
                                    <%--elem: "#datetime",--%>
                                    <%--istime: true,--%>
                                    <%--trigger: 'click'--%>
                                <%--});--%>
                            <%--</script>--%>
                        </div>
                      <%--  <div class="form-group">
                            <label for="">地址</label> <input type="text" class="form-control"
                                                            name="adress" value="${sessionScope.userCustom.adress }"/>
                        </div>--%>
                        <div class="form-group">
                            <label for="">个人简介</label>
                            <textarea class="form-control" rows="3"
                                      name="sign">${sessionScope.userCustom.sign }</textarea>
                        </div>
                        <div class="text-right">
                            <button class="btn btn-primary" type="submit">确定</button>
                            <button class="btn btn-danger" data-dismiss="modal">关闭</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </div>



    <script type="text/javascript" src="${baseurl}js/audio.js"></script>
    <script type="text/javascript">
        var hashsong = "";
        var song = [{
            'cover': 'http://imge.kugou.com/stdmusic/20171208/20171208162911674095.jpg',
            'src': '/upload/mp3/王力宏、谭维维 - 缘分一道桥.mp3',
            'title': '王力宏、谭维维 - 缘分一道桥'
        }];

        var audioFn = audioPlay({
            song: song,
            autoPlay: false
            //是否立即播放第一首，autoPlay为true且song为空，会alert文本提示并退出
        });


    </script>
</head>

</html>