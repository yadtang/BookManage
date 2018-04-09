<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="${ctx}/css/amazeui.min.css">
    <link rel="stylesheet" href="${ctx}/css/petshow.css?6">
    <link rel="stylesheet" href="${ctx}/css/animate.min.css">
    <script src="${ctx}/js/jquery.min.js"></script>
    <script src="${ctx}/js/amazeui.min.js"></script>
    <%-- <script src="${ctx}/js/countUp.min.js"></script> --%>
    <script src="${ctx}/js/amazeui.lazyload.min.js"></script>
	<script src="${ctx}/js/petshow.js"></script>
	<script type="text/javascript">
		function dealClickEvent(id){
			$("#id").val(id);
			document.myform.attributes["action"].value = "${ctx}/user/bookInfo.action"; 
			$("form").submit();
			/* if(id != null && id != ""){
        		$.post("${ctx}/user/bookInfo.action", { id:id },function(data){
        			alert(data);
        		},"json");
			} */
		}
	</script>
</head>
<body>
<header class="am-topbar am-topbar-inverse">
    <div class="amz-container">
        <h1 class="am-topbar-brand">
            <a href="#" class="am-topbar-logo">
                <img src="${ctx}/img/logo.png?1" alt="">
            </a>
        </h1>
        <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"
                data-am-collapse="{target: '#doc-topbar-collapse-5'}">
            <span class="am-sr-only">
                导航切换
            </span>
            <span class="am-icon-bars">
            </span>
        </button>
        <div class="am-collapse am-topbar-collapse" id="doc-topbar-collapse-5">
            <ul class="am-nav am-nav-pills am-topbar-nav">
                <li class="am-active">
                    <a href="#">
                        首页
                    </a>
                </li>
                <li class="am-dropdown" data-am-dropdown="">
                    <a class="am-dropdown-toggle" data-am-dropdown-toggle="" href="javascript:;">
                        发现萌宠
                        <span class="am-icon-caret-down">
                        </span>
                    </a>
                    <ul class="am-dropdown-content">
                        <li>
                            <a href="#">编辑推荐</a>
                        </li>
                        <li>
                            <a href="#">人气排行</a>
                        </li>
                        <li>
                            <a href="#">最新发布</a>
                        </li>
                        <li>
                            <a href="#">语音涂鸦</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">萌宠趣闻</a>
                </li>
                <li>
                    <a href="#">萌宠专题</a>
                </li>
                <li class="am-dropdown" data-am-dropdown="">
                    <a class="am-dropdown-toggle" data-am-dropdown-toggle="" href="javascript:;">
                        萌宠服务
                        <span class="am-icon-caret-down">
                        </span>
                    </a>
                    <ul class="am-dropdown-content">
                        <li>
                            <a href="#">宠物医院</a>
                        </li>
                        <li>
                            <a href="#"> 宠物美容</a>
                        </li>
                        <li>
                            <a href="#">宠物店铺</a>
                        </li>
                        <li>
                            <a href="#"> 更多服务</a>
                        </li>
                    </ul>
                </li>
				<li class="am-dropdown" data-am-dropdown="">
                    <a href="javascript:;"> 登录</a>
                </li>
				<li class="am-dropdown" data-am-dropdown="">
                    <a href="javascript:;">注册</a>
                </li>
            </ul>
        </div>
    </div>
</header>

<div class="banner_navbg">
    <div class="am-g">
        <div class="banner_nav">
			<span class="am-icon-caret-right">  筛选：</span>
				<a href="###">人气最高</a>
				<a href="###" class="banner_hover">编辑推荐</a>
				<a href="###">最新萌宠</a>
				<a href="###">语言涂鸦</a>
		</div>
    </div>
</div>

<form action="${ctx}/user/bookInfo.action" method="post" name="myform" id="myform">
	<input type="hidden" id="id" name="id"> 
</form>

<div class="am-g am-imglist">
	<c:forEach items="${dataList}" var="o">
		<!-- 分类展示 -->
		<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${o.name}</span>
		<ul data-am-widget="gallery" class="am-gallery am-avg-sm-2 am-avg-md-3 am-avg-lg-6 am-gallery-default">
			<c:forEach items="${o.pageBook.book}" var="pbook">
				<li onclick="dealClickEvent('${pbook.bookid}')">
		            <div class="am-gallery-item am_list_block">
		                <a href="###" class="am_img_bg">
		                    <img class="am_img animated" src="${ctx}/${pbook.imageUrl}" 
		                         alt="远方 有一个地方 那里种有我们的梦想"/>
		                </a>
		
		                <div class="am_listimg_info">
		                	<span class="am-icon-heart"> 132</span>
		                	<span class="am-icon-comments"> 67</span>
		                </div>
		
		            </div>
		            <a class="am_imglist_user"><span class="am_imglist_user_ico"><img src="${ctx}/img/logo.png" alt=""></span><span
		                    class="am_imglist_user_font">${pbook.bookname}</span></a>
		        </li>
		        </a>
			</c:forEach>
	    </ul>
	</c:forEach>
	
	<!-- 图书推荐，猜你喜欢模块 -->
	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;猜你喜欢</span>
    <ul data-am-widget="gallery" class="am-gallery am-avg-sm-2 am-avg-md-3 am-avg-lg-6 am-gallery-default">
        <li>
            <div class="am-gallery-item am_list_block">
                <a href="###" class="am_img_bg">
                    <img class="am_img animated" src="${ctx}/img/loading.gif"
                         alt="远方 有一个地方 那里种有我们的梦想"/>
                </a>

                <div class="am_listimg_info"><span class="am-icon-heart"> 132</span><span
                        class="am-icon-comments"> 67</span><span class="am_imglist_time">15分钟前</span></div>

            </div>
            <a class="am_imglist_user"><span class="am_imglist_user_ico"><img src="${ctx}/img/logo.png" alt=""></span><span
                    class="am_imglist_user_font">路见不平Eason吼</span></a>
        </li>
        <li>
            <div class="am-gallery-item am_list_block">
                <a href="###" class="am_img_bg">
                    <img class="am_img animated" src="${ctx}/img/loading.gif"
                         alt="远方 有一个地方 那里种有我们的梦想"/>
                </a>

                <div class="am_listimg_info"><span class="am-icon-heart"> 132</span><span
                        class="am-icon-comments"> 67</span><span class="am_imglist_time">15分钟前</span></div>

            </div>
            <a class="am_imglist_user"><span class="am_imglist_user_ico"><img src="${ctx}/img/logo.png" alt=""></span><span
                    class="am_imglist_user_font">路见不平Eason吼</span></a>
        </li>
        <li>
            <div class="am-gallery-item am_list_block">
                <a href="###" class="am_img_bg">
                    <img class="am_img animated" src="${ctx}/img/loading.gif"
                         alt="远方 有一个地方 那里种有我们的梦想"/>
                </a>

                <div class="am_listimg_info"><span class="am-icon-heart"> 132</span><span
                        class="am-icon-comments"> 67</span><span class="am_imglist_time">15分钟前</span></div>

            </div>
            <a class="am_imglist_user"><span class="am_imglist_user_ico"><img src="${ctx}/img/logo.png" alt=""></span><span
                    class="am_imglist_user_font">路见不平Eason吼</span></a>
        </li>
        <li>
            <div class="am-gallery-item am_list_block">
                <a href="###" class="am_img_bg">
                    <img class="am_img animated" src="${ctx}/img/loading.gif"
                         alt="远方 有一个地方 那里种有我们的梦想"/>
                </a>

                <div class="am_listimg_info"><span class="am-icon-heart"> 132</span><span
                        class="am-icon-comments"> 67</span><span class="am_imglist_time">15分钟前</span></div>

            </div>
            <a class="am_imglist_user"><span class="am_imglist_user_ico"><img src="${ctx}/img/logo.png" alt=""></span><span
                    class="am_imglist_user_font">路见不平Eason吼</span></a>
        </li>
        <li>
            <div class="am-gallery-item am_list_block">
                <a href="###" class="am_img_bg">
                    <img class="am_img animated" src="${ctx}/img/loading.gif"
                         alt="远方 有一个地方 那里种有我们的梦想"/>
                </a>

                <div class="am_listimg_info"><span class="am-icon-heart"> 132</span><span
                        class="am-icon-comments"> 67</span><span class="am_imglist_time">15分钟前</span></div>

            </div>
            <a class="am_imglist_user"><span class="am_imglist_user_ico"><img src="${ctx}/img/logo.png" alt=""></span><span
                    class="am_imglist_user_font">路见不平Eason吼</span></a>
        </li>
    </ul>
</div>
<footer class="am_footer">
    <div class="am_footer_con">
        <div class="am_footer_link">
            <span>关于宠物秀</span>
            <ul>
                <li><a href="###">关于我们</a></li>
                <li><a href="###">发展历程</a></li>
                <li><a href="###">友情链接</a></li>
            </ul>
        </div>


        <div class="am_footer_don">
            <span>宠物秀</span>
            <dl>
                <dt><img src="${ctx}/img/footdon.png?1" alt=""></dt>
                <dd>一起Show我们的爱宠吧！宠物秀是图片配文字、涂鸦、COSPLAY的移动手机社区，这里有猫狗鱼龟兔子仓鼠龙猫等各种萌图。
                    <a href="###" class="footdon_pg ">
                        <div class="foot_d_pg am-icon-apple "> App store</div>
                    </a><a href="###" class="footdon_az animated">
                        <div class="foot_d_az am-icon-android "> Android</div>
                    </a></dd>

            </dl>
        </div>

        <div class="am_footer_erweima">
            <div class="am_footer_weixin"><img src="${ctx}/img/wx.jpg" alt="">

                <div class="am_footer_d_gzwx am-icon-weixin"> 关注微信</div>
            </div>
            <div class="am_footer_ddon"><img src="${ctx}/img/wx.jpg" alt="">

                <div class="am_footer_d_dxz am-icon-cloud-download"> 扫码下载</div>
            </div>

        </div>

    </div>
    <div class="am_info_line">Copyright(c)2015 <span>PetShow</span> All Rights Reserved.模板收集自 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> -  More Templates  <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></div>
</footer>
</body>
</html>