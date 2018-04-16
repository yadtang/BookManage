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
    <title>读书网</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" href="${ctx}/css/amazeui.min.css">
	<link rel="stylesheet" href="${ctx}/css/petshow.css?6">
	<link rel="stylesheet" href="${ctx}/css/animate.min.css">
	<link rel="stylesheet" href="${ctx}/css/bootstrap.css">
	
	<script src="${ctx}/js/jquery.min.js"></script>
	<script src="${ctx}/js/amazeui.min.js"></script>
	<script src="${ctx}/js/amazeui.lazyload.min.js"></script>
	<script src="${ctx}/js/jweixin-1.2.0.js"></script>
	<script src="${ctx}/js/bootstrap.js"></script>
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
	    
	    function pwdMsg(){
			$("#pwdModal").modal('show');
		}
		$(function () {
	        //更新密码
	        $('#savePwd').click(function () {
	        	var pwd = $("#pwd").val();
	        	var password = $("#password").val();
	        	var password1 = $("#password1").val();
	        	if(password != password1){
	        		alert("重置密码和确认密码不一致！");
	        		return;
	        	}
	        	if(password != pwd){
	        		alert("重置密码和原始密码不能相同！");
	        		return;
	        	}
	            var userId = "${user.userId}";
	            $.post("${ctx}/user/updUserPwd.action", { userId:userId,userPwd:pwd,remark:password1},function(data){
	            	alert(data.errorInfo);
	            	$("#pwdModal").modal('hide');
				},"json");
	        });
	    });
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
                <li>
                    <a href="${ctx}/user/indexPage.action">首页</a>
                </li>
                <li class="am-active">
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
				
            </ul>
        </div>
    </div>
</header>

	<!-- 密码重置 -->
	<div class="modal fade" id="pwdModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width:350px">
			<div class="modal-content" style="width:350px">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						密码重置
					</h4>
				</div>
				<form class="form-inline" id="pwdForm" method="POST">
					<div class="form-group">
						<label for="name" style="text-indent: 2em;font-size: 14px;">原始密码：</label>
						<input type="password" class="form-control" id="pwd" placeholder="请输入原始密码">
					</div>
					<br/>
					<div class="form-group">
						<label for="name" style="text-indent: 2em;font-size: 14px;">重置密码：</label>
						<input type="password" class="form-control" id="password" placeholder="请输入重置密码">
					</div>
					<br/>
					<div class="form-group">
						<label for="name" style="text-indent: 2em;font-size: 14px;">确认密码：</label>
						<input type="password" class="form-control" id="password1" placeholder="请输入确认密码">
					</div>
					<br/>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary" id="savePwd">
							保存
						</button>
					</div>
				</form>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>

<div class="am_user">
<div class="am_user_head">
<div class="am_user_head_content">
    <div class="am_user_head_l">
<div class="am_user_head_l_ico"> <img src="${ctx}/img/tx.jpg" alt=""></div>
<div class="am_user_head_l_ico_info">
    <span class="am_user_head_l_name">${userName }</span>
    <span class="am_user_head_l_map"><i class="am-icon-map-marker"></i> ${user.email }</span>
</div>
    </div>
    <div class="am_user_head_r">
<div class="am_user_head_r_tag">
	<div class="am_user_head_l_ico_info_ti">已关注<span class="cff5656">${count }</span>本图书</div>
		<!-- <span>
		    <i class="am-icon-star"></i> 粉丝：<span class="am_user_head_unm">15</span>
		</span>
		<span>
		    <i class="am-icon-user"></i> 关注：<span class="am_user_head_unm">6</span>
		</span>
		<span>
		    <i class="am-icon-heart"></i>被喜欢：<span class="am_user_head_unm">60</span>
		</span> -->
		<span>
		    <i class="am-icon-heart"></i>${user.address }</span>
		</span>
	</div>
    </div>
    </div>
</div>
<form action="${ctx}/user/bookInfo.action" method="post" name="myform" id="myform">
	<input type="hidden" id="id" name="id"> 
</form>
<div class="am-g am-imglist am_user_list_li">
    <ul data-am-widget="gallery" class="am-gallery am-avg-sm-2am-avg-md-3 am-avg-lg-6 am-gallery-default">
    	<c:forEach items="${LoveBooks}" var="pbook">
    		<li  onclick="dealClickEvent('${pbook.book.bookid}')">
	            <div class="am-gallery-item am_list_block">
	                <a class="am_img_bg">
	                    <img class="am_img animated" src="${ctx}/${pbook.book.imageUrl}" />
	                </a>
	                <div class="am_listimg_info"><span class="am-icon-heart">${pbook.book.number}</span>
	                	<span class="am-icon-comments">${pbook.remark}</span>
	                </div>
	            </div>
	        </li>
    	</c:forEach>
    </ul>
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
  <dt><img src="${ctx}/img/logo.png?1" alt=""></dt>
  <dd>一起Show我们的爱宠吧！宠物秀是图片配文字、涂鸦、COSPLAY的移动手机社区，这里有猫狗鱼龟兔子仓鼠龙猫等各种萌图。
  <a href="###" class="footdon_pg "><div class="foot_d_pg am-icon-apple ">  App store</div></a><a href="###" class="footdon_az animated"><div class="foot_d_az am-icon-android ">  Android</div></a></dd>
</dl>
</div>

<div class="am_footer_erweima">
<div class="am_footer_weixin"><img src="${ctx}/img/wx.jpg" alt=""><div class="am_footer_d_gzwx am-icon-weixin"> 关注微信</div></div>
<div class="am_footer_ddon"><img src="${ctx}/img/wx.jpg" alt=""><div class="am_footer_d_dxz am-icon-cloud-download"> 扫码下载</div></div>

</div>

</div>
<div class="am_info_line">Copyright(c)2015 <span>PetShow</span> All Rights Reserved.模板收集自 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> -  More Templates  <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></div>
</footer>
<script>
console.log($.AMUI);
 $(function(){
  if ($(window).width() < 600 ) {
 $('.am_list_item_text').each(
  function(){
     if($(this).text().length >= 26){
        $(this).html($(this).text().substr(0,26)+'...');
     }});}[]

});

</script>
</body>
</html>