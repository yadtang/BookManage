<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>读书网</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="${ctx}/css/amazeui.min.css">
    <link rel="stylesheet" href="${ctx}/css/petshow.css?6">
    <link rel="stylesheet" href="${ctx}/css/animate.min.css">
    <script src="${ctx}/js/jquery.min.js"></script>
    <script src="${ctx}/js/amazeui.min.js"></script>
    <script src="${ctx}/js/amazeui.lazyload.min.js"></script>
    <script type="text/javascript">
    
	    function doQry(){
			$("#qryForm").action="${ctx}/user/toQryBookPage.action"; 
			$("#qryForm").submit();
	    }
	    
	    function dealClickEvent(id){
			$("#id").val(id);
			document.myform.attributes["action"].value = "${ctx}/user/bookInfo.action"; 
			$("form").submit();
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
                    <a href="${ctx}/user/indexPage.action">首页</a>
                </li>
                <li>
                    <a href="${ctx}/user/qryLoveBook.action?userId=${user.userId}">我的图书</a>
                </li>
                <c:if test="${userName != null}">
                	<li class="am-dropdown" data-am-dropdown="">
	                    <a href="javascript:;"> 欢迎您,${userName }</a>
	                </li>
				</c:if>
				<c:if test="${userName == null}">
				    <li class="am-dropdown" data-am-dropdown="">
	                    <a href="${ctx}/user/login.action"> 登录</a>
	                </li>
					<li class="am-dropdown" data-am-dropdown="">
	                    <a href="${ctx}/user/toRegistPage.action">注册</a>
	                </li>
				</c:if>
                <li>
                    <a href="${ctx}/user/userInfoPage.action">个人中心</a>
                </li>
                <li>
                    <a onclick="pwdMsg()">密码重置</a>
                </li>
                <li>
                    <a href="${ctx}/user/exitSystem.action">注销</a>
                </li>
                <li>
                	<form action="${ctx}/user/toQryBookPage.action" name="qryForm" id="qryForm" method="post">
                		<div class="bdfw_nr_title">
							<input type="text" name="qryName" id="qryName" style="margin-top:7px;margin-left:15px;width:200px;height:36px;color:#AAAAAA;font-size:medium" placeholder="图书名称、作者" value="${qryName }">
							<a onclick="doQry()"><img alt="" src="${ctx}/img/search.png" style="margin-top:10px"></a>
						</div>
                	</form>
                </li>
            </ul>
        </div>
    </div>
</header>
<form action="${ctx}/user/bookInfo.action" method="post" name="myform" id="myform">
	<input type="hidden" id="id" name="id"> 
</form>

<div class="am_tjgd">
  <div class="am-list-news-bd am_news_list_all">
    <ul class="am-list">
      <!--缩略图在标题左边-->
      <c:forEach items="${books}" var="bk">
      	  <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left am_list_li">
	        <div class="am-u-sm-3 am-list-thumb am_list_thumb">
	          <a onclick="dealClickEvent('${bk.bookid}')">
	            <img src="${ctx}/${bk.imageUrl}" class="am_news_list_img" alt="${bk.bookname}"
	             style="width:125px;height:140px;margin-left:18px;"/>
	          </a>
	        </div>
	        <div class=" am-u-sm-9 am-list-main am_list_main">
	          <h3 class="am-list-item-hd am_list_title">
	            <a onclick="dealClickEvent('${bk.bookid}')">${bk.bookname}</a>
	          </h3>
	          <div class="am_list_author">
	          	<a href="javascript:void(0)">
		          	<span class="am_list_author_ico" style="background-image: url(${ctx}/img/tx.jpg);"></span>
		          	<span class="name">${bk.author}</span>
	          	</a>
	          	<span class="am_news_time">&nbsp;•&nbsp;
	          	<time class="timeago" title="2015-08-13 08:02:40 +0800" datetime="2015-08-13 08:02:40 +0800"> ${bk.time}</time></span></div>
	          <div class="am-list-item-text am_list_item_text ">${bk.content}</div>
	        </div>
	      </li>
      </c:forEach>
      
    </ul><div class="am_news_load"><span><i  class="am-icon-spinner am-icon-spin"></i> 更多相关文章</span></div>
  </div>
</div>


<footer class="am_footer">
<div class="am_footer_con">
<div class="am_footer_link">
<span>关于读书网</span>
<ul>
  <li><a href="###">关于我们</a></li>
  <li><a href="###">发展历程</a></li>
  <li><a href="###">友情链接</a></li>
</ul>
</div>


<div class="am_footer_don">
<span>读书网</span>
<dl>
  <dt><img src="${ctx}/img/footdon.png?1" alt=""></dt>
  <dd>一起Show我们的爱宠吧！宠物秀是图片配文字、涂鸦、COSPLAY的移动手机社区，这里有猫狗鱼龟兔子仓鼠龙猫等各种萌图。
  <a href="###" class="footdon_pg "><div class="foot_d_pg am-icon-apple ">  App store</div></a><a href="###" class="footdon_az animated"><div class="foot_d_az am-icon-android ">  Android</div></a></dd>

</dl>
</div>

<div class="am_footer_erweima">
<div class="am_footer_weixin"><img src="${ctx}/img/wx.jpg" alt=""><div class="am_footer_d_gzwx am-icon-weixin"> 关注微信</div></div>
<div class="am_footer_ddon"><img src="${ctx}/img/wx.jpg" alt=""><div class="am_footer_d_dxz am-icon-cloud-download"> 扫码下载</div></div>

</div>

</div>
</footer>
<script>
 $(function(){
  $('.am_news_tab').css('min-height',$(window).height() - 52 - 220);
  if ($(window).width() < 600 ) {
 $('.am_list_item_text').each(
  function(){
     if($(this).text().length >= 26){
        $(this).html($(this).text().substr(0,26)+'...');
     }});}

});

</script>
</body>
</html>