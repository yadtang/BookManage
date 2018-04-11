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
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
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
<style type="text/css">
#bg {
	width: 60px;
	height: 16px;
	background: url("${ctx}/img/star_gray.png");
}

#over {
	height: 16px;
	background: url("${ctx}/img/star_org.png") no-repeat;
}
</style>
<script type="text/javascript">
	$(function() {
		if ($(window).width() < 600) {
			('.am_list_item_text').each(function() {
				if ($(this).text().length >= 26) {
					$(this).html($(this).text().substr(0, 26) + '...');
				}
			});
		}
	});

	var check = 0;//该变量是记录当前选择的评分
	var time = 0;//该变量是统计用户评价的次数，这个是我的业务要求统计的（改变评分不超过三次），可以忽略

	/*over()是鼠标移过事件的处理方法*/
	function over(param){
		if(param == 1){
			$("#star1").attr("src","${ctx}/img/star_red.png");//第一颗星星亮起来，下面以此类推
			$("#message").html(" 很差");//设置提示语，下面以此类推
		}else if(param == 2){
			$("#star1").attr("src","${ctx}/img/star_red.png");
			$("#star2").attr("src","${ctx}/img/star_red.png");
			$("#message").html(" 比较差");
		}else if(param == 3){
			$("#star1").attr("src","${ctx}/img/star_red.png");
			$("#star2").attr("src","${ctx}/img/star_red.png");
			$("#star3").attr("src","${ctx}/img/star_red.png");
			$("#message").html(" 一般");
		}else if(param == 4){
			$("#star1").attr("src","${ctx}/img/star_red.png");
			$("#star2").attr("src","${ctx}/img/star_red.png");
			$("#star3").attr("src","${ctx}/img/star_red.png");
			$("#star4").attr("src","${ctx}/img/star_red.png");
			$("#message").html(" 良好");
		}else if(param == 5){
			$("#star1").attr("src","${ctx}/img/star_red.png");
			$("#star2").attr("src","${ctx}/img/star_red.png");
			$("#star3").attr("src","${ctx}/img/star_red.png");
			$("#star4").attr("src","${ctx}/img/star_red.png");
			$("#star5").attr("src","${ctx}/img/star_red.png");
			$("#message").html(" 优秀");
		}
	}
	/*out 方法是鼠标移除事件的处理方法，当鼠标移出时，恢复到我的打分情况*/
	function out(){
		if(check == 1){//打分是1，设置第一颗星星亮，其他星星暗，其他情况以此类推
			$("#star1").attr("src","${ctx}/img/star_red.png");
			$("#star2").attr("src","${ctx}/img/star.png");
			$("#star3").attr("src","${ctx}/img/star.png");
			$("#star4").attr("src","${ctx}/img/star.png");
			$("#star5").attr("src","${ctx}/img/star.png");
			$("#message").html("");
		}else if(check == 2){
			$("#star1").attr("src","${ctx}/img/star_red.png");
			$("#star2").attr("src","${ctx}/img/star_red.png");
			$("#star3").attr("src","${ctx}/img/star.png");
			$("#star4").attr("src","${ctx}/img/star.png");
			$("#star5").attr("src","img/star.png");
			$("#message").html("");
		}else if(check == 3){
			$("#star1").attr("src","${ctx}/img/star_red.png");
			$("#star2").attr("src","${ctx}/img/star_red.png");
			$("#star3").attr("src","${ctx}/img/star_red.png");
			$("#star4").attr("src","${ctx}/img/star.png");
			$("#star5").attr("src","${ctx}/img/star.png");
			$("#message").html("");
		}else if(check == 4){
			$("#star1").attr("src","${ctx}/img/star_red.png");
			$("#star2").attr("src","${ctx}/img/star_red.png");
			$("#star3").attr("src","${ctx}/img/star_red.png");
			$("#star4").attr("src","${ctx}/img/star_red.png");
			$("#star5").attr("src","${ctx}/img/star.png");
			$("#message").html("");
		}else if(check == 5){
			$("#star1").attr("src","${ctx}/img/star_red.png");
			$("#star2").attr("src","${ctx}/img/star_red.png");
			$("#star3").attr("src","${ctx}/img/star_red.png");
			$("#star4").attr("src","${ctx}/img/star_red.png");
			$("#star5").attr("src","${ctx}/img/star_red.png");
			$("#message").html("");
		}else if(check == 0){
			$("#star1").attr("src","${ctx}/img/star.png");
			$("#star2").attr("src","${ctx}/img/star.png");
			$("#star3").attr("src","${ctx}/img/star.png");
			$("#star4").attr("src","${ctx}/img/star.png");
			$("#star5").attr("src","${ctx}/img/star.png");
			$("#message").html("");
		}
	}
	/*click()点击事件处理，记录打分*/
	function click(param){
		time++;//记录打分次数
		check = param;//记录当前打分
		out();//设置星星数
	}
	
	//发表评论
	function makeComments(){
		var bookid = "${book.bookid}";
		var score = check;
		var content = $("#content").val();
		var userId = "${user.userId}";
		alert(bookid+","+score+","+userId+","+content);
		//return;
		$.post("${ctx}/user/dealEvaluate.action", {
			bookid:bookid,
			score:score,
			userId:userId,
			content:content
		}, function(data) {
			$("#id").val(bookid);
			document.myform.attributes["action"].value = "${ctx}/user/bookInfo.action"; 
			$("form").submit();
		}, "json");
	}
	
	var urlValue = "";
	$(document).ready(function() {
		urlValue = "${ctx}/user/bookInfo.action?id=${book.bookid}";
	});

	//打开分享图标
	function openShare(id) {
		$.post("${ctx}/user/createImg.action", {
			id : id
		}, function(data) {
			$("#weiXinImg").attr("src", "${ctx}/book/dushu.jpg");
			$("#shareIcon").css("display", "block");
		}, "json");

	}
	//关闭分享图标
	function closeShare() {
		$("#shareIcon").css("display", "none");
	}
	var _title, _source, _sourceUrl, _pic, _showcount, _desc, _summary, _site, _width = 600, _height = 600, _top = (screen.height - _height) / 2, _left = (screen.width - _width) / 2, _url = '${reqUrl}', _pic = '';
	function shareToSinaWB(event) {
		event.preventDefault();
		var _shareUrl = 'http://v.t.sina.com.cn/share/share.php?&appkey=895033136'; //真实的appkey，必选参数
		_shareUrl += '&url=' + encodeURIComponent(_url || document.location); //参数url设置分享的内容链接|默认当前页location，可选参数
		_shareUrl += '&title=' + encodeURIComponent(_title || document.title); //参数title设置分享的标题|默认当前页标题，可选参数
		_shareUrl += '&source=' + encodeURIComponent(_source || '');
		_shareUrl += '&sourceUrl=' + encodeURIComponent(_sourceUrl || '');
		_shareUrl += '&content=' + 'utf-8'; //参数content设置页面编码gb2312|utf-8，可选参数
		_shareUrl += '&pic=' + encodeURIComponent(_pic || ''); //参数pic设置图片链接|默认为空，可选参数
		window
				.open(
						_shareUrl,
						'_blank',
						'width='
								+ _width
								+ ',height='
								+ _height
								+ ',top='
								+ _top
								+ ',left='
								+ _left
								+ ',toolbar=no,menubar=no,scrollbars=no, resizable=1,location=no,status=0');
	}
	//分享到QQ空间
	function shareToQzone(event) {
		event.preventDefault();
		var _shareUrl = 'http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?';
		_shareUrl += 'url=' + encodeURIComponent(_url || document.location); //参数url设置分享的内容链接|默认当前页location
		_shareUrl += '&showcount=' + _showcount || 0; //参数showcount是否显示分享总数,显示：'1'，不显示：'0'，默认不显示
		_shareUrl += '&desc=' + encodeURIComponent(_desc || '分享的描述'); //参数desc设置分享的描述，可选参数
		_shareUrl += '&summary=' + encodeURIComponent(_summary || '分享摘要'); //参数summary设置分享摘要，可选参数
		_shareUrl += '&title=' + encodeURIComponent(_title || document.title); //参数title设置分享标题，可选参数
		_shareUrl += '&site=' + encodeURIComponent(_site || ''); //参数site设置分享来源，可选参数
		_shareUrl += '&pics=' + encodeURIComponent(_pic || ''); //参数pics设置分享图片的路径，多张图片以＂|＂隔开，可选参数
		window
				.open(
						_shareUrl,
						'_blank',
						'width='
								+ _width
								+ ',height='
								+ _height
								+ ',top='
								+ _top
								+ ',left='
								+ _left
								+ ',toolbar=no,menubar=no,scrollbars=no,resizable=1,location=no,status=0');
	}
</script>
</head>
<body>
	<header class="am-topbar am-topbar-inverse">
		<div class="amz-container">
			<h1 class="am-topbar-brand">
				<a href="#" class="am-topbar-logo"> <img
					src="${ctx}/img/logo.png?1" alt="">
				</a>
			</h1>
			<button
				class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"
				data-am-collapse="{target: '#doc-topbar-collapse-5'}">
				<span class="am-sr-only"> 导航切换 </span> <span class="am-icon-bars">
				</span>
			</button>
			<div class="am-collapse am-topbar-collapse"
				id="doc-topbar-collapse-5">
				<ul class="am-nav am-nav-pills am-topbar-nav">
					<li><a href="${ctx}/user/toIndex.action">首页</a></li>
					<li><a href="#">榜单</a></li>
					<li class="am-active"><a href="#">图书详情</a></li>
					<li><a
						href="${ctx}/user/qryLoveBook.action?userId=${user.userId}">我的图书</a>
					</li>
					<li class="am-dropdown" data-am-dropdown=""><a
						class="am-dropdown-toggle" data-am-dropdown-toggle=""
						href="javascript:;"> 个人中心<span class="am-icon-caret-down"></span>
					</a>
						<ul class="am-dropdown-content">
							<li><a href="#">信息修改</a></li>
							<li><a href="#">密码重置</a></li>
							<li><a href="#">注销</a></li>
							<li><a href="#"> 更多服务</a></li>
						</ul></li>
					<c:if test="${userName != null}">
						<li class="am-dropdown" data-am-dropdown=""><a
							href="javascript:;"> 欢迎您,${userName }</a></li>
					</c:if>
					<c:if test="${userName == null}">
						<li class="am-dropdown" data-am-dropdown=""><a
							href="${ctx}/user/login.action"> 登录</a></li>
						<li class="am-dropdown" data-am-dropdown=""><a
							href="${ctx}/user/toRegistPage.action">注册</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</header>
	<form action="${ctx}/user/bookInfo.action" method="post" name="myform" id="myform">
		<input type="hidden" id="id" name="id" value="${book.bookid}"> 
	</form>
	<div class="am_tuya">
		<div class="am_tuya_user">
			<div class="am_tuya_user_ico">
				<img src="${ctx}/img/logo.png" alt="">
			</div>
			<div class="am_tuya_user_info">
				<div class="am_tuya_user_info_name">${book.bookname}</div>
				<!-- <div id="over" style="width:46.8px"></div> -->
				<div id="bg" style="position: absolute;top: 9px;left: 400px;">
					<div id="over" style="width:48px"></div>
				</div>
				<span class="am_tuya_user_info_time">${book.author}</span>${book.publisher.name}
			</div>
		</div>

		<div class="am_tuya_content">
			<div class="am_tuya_content_l">
				<div class="am_albums">
					<img src="${ctx}/${book.imageUrl}" alt="" width="550" height="550">
				</div>
				<div class="am_tuya_more">
					<div class="am_tuya_oneword">我要在你们心中奔腾，你们怕不怕？</div>
					<div class="am_tuya_cai_ti" style="padding-left:30px;padding-bottom:20px;">图书简介：</div>
					<div style="padding:0 30px;text-indent: 2em;font-size: 14px;">${book.content}</div>
					<c:forEach items="${evaluate}" var="o">
						<div class="am_tuya_comment">
							<div class="am_tuya_comment_user">
								<div class="am_tuya_comment_user_l">
									<img src="${ctx}/img/kj.png" alt="">${o.user.userName } <span>
										• ${o.time }</span>
								</div>
								<div class="am_tuya_comment_user_r">
									<div id="bg">
										<div id="over" style="width:${o.score}px"></div>
									</div>
								</div>
								<div class="am_tuya_comment_text">${o.content }</div>
							</div>
						</div>
					</c:forEach>
					<%-- <div style="padding:0 30px;text-indent: 2em;font-size: 14px;">${book.content}</div> --%>
					<div class="form-group">
					    <br/><label for="name">文本框</label>
					    <label style="text-indent:350px;">
					    	<a href="javascript:click(1)"><img src="${ctx}/img/star.png" id="star1" onMouseOver="over(1)" onMouseOut="out(1)"/></a>
							<a href="javascript:click(2)"><img src="${ctx}/img/star.png" id="star2" onMouseOver="over(2)" onMouseOut="out(2)" /></a>
							<a href="javascript:click(3)"><img src="${ctx}/img/star.png" id="star3" onMouseOver="over(3)" onMouseOut="out(3)" /></a>
							<a href="javascript:click(4)"><img src="${ctx}/img/star.png" id="star4" onMouseOver="over(4)" onMouseOut="out(4)"/></a>
							<a href="javascript:click(5)"><img src="${ctx}/img/star.png" id="star5" onMouseOver="over(5)" onMouseOut="out(5)"/></a>
					    </label>
						<span id="message"></span><br/>
					    <textarea class="form-control" rows="3" id="content" name="content"></textarea><br/>
					    <button type="button" class="btn btn-primary"  data-toggle="button" onclick="makeComments()"> 立即评论</button>
					</div>
					
					
				</div>
				<!-- <div class="am_news_load"><span><i  class="am-icon-spinner am-icon-spin"></i> 查看更多讨论</span></div> -->
			</div>
			<div class="am_tuya_content_r">
				<ul class="am_tuya_r_info">
					<li><i class="am-icon-heart"></i><span>${book.number }
							人喜欢</span></li>
					<li><i class="am-icon-comments"></i><span>${count } 条评论</span></li>
					<li><i class="am-icon-eye"></i><span>${book.times } 次查看</span></li>
					<li><i class="am-icon-share-square-o"></i><span>分享图书</span></li>
					<li>
						<div>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt=""
								src="${ctx}/img/qqzone.png" width="30px" height="30px"
								onclick="shareToQzone(event)"> &nbsp;&nbsp;&nbsp;<img
								alt="" src="${ctx}/img/weibo.png" width="30px" height="30px"
								onclick="shareToSinaWB(event)"> &nbsp;&nbsp;&nbsp;<img
								alt="" src="${ctx}/img/weixin_friend.png" width="30px"
								height="30px" onclick="openShare(${book.bookid})"
								onmouseover="closeShare()">
						</div>
					</li>
					<li><i class="am-icon-clock-o"></i><span>发布 ${book.time }</span></li>
					<li id="shareIcon" style="display:none">
						<div>
							<img alt="" src="" id="weiXinImg">
						</div>
					</li>
				</ul>
				<ul class="am_tuya_tag">
					<li><span class="am_tuya_tag_title">得分分布</span></li>
					<li>
						<div id="bg">
							<!-- 5星评分 -->
							<div id="over" style="width:60px">
								<span style="margin-right: -185px; margin-top: -4px;">${ scoreMap['num5'] }</span>
							</div>
						</div>
					</li>
					<li>
						<div id="bg">
							<!-- 4星评分 -->
							<div id="over" style="width:48px">
								<span style="margin-right: -197px; margin-top: -4px;">${ scoreMap['num4'] }</span>
							</div>
						</div>
					</li>
					<li>
						<div id="bg">
							<!-- 3星评分 -->
							<div id="over" style="width:36px">
								<span style="margin-right: -209px; margin-top: -4px;">${ scoreMap['num3'] }</span>
							</div>
						</div>
					</li>
					<li>
						<div id="bg">
							<!-- 2星评分 -->
							<div id="over" style="width:24px">
								<span style="margin-right: -221px; margin-top: -4px;">${ scoreMap['num2'] }</span>
							</div>
						</div>
					</li>
					<li>
						<div id="bg">
							<!-- 1星评分 -->
							<div id="over" style="width:12px">
								<span style="margin-right: -233px; margin-top: -4px;">${ scoreMap['num1'] }</span>
							</div>
						</div>
					</li>
				</ul>
				<div class="page_hot">
					<div class="page_hot_title">人气排行</div>
					<div class="page_hot_list">
						<c:forEach items="${bookRank}" var="br">
							<div class="page_hot_block">
								<dl>
									<dt>
										<a href="#"> <img src="${ctx}/${br.imageUrl}" alt=""></a>
									</dt>
									<dd>
										<i>${br.author}</i>
										<div class="hot_block_info">
											<div class="hot_info_l am-icon-heart">${br.times}</div>
										</div>
									</dd>
								</dl>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="am_tuya_cai">
		<div class="am_tuya_cai_ti">猜你喜欢</div>
		<div class="am-g am-imglist">
			<ul data-am-widget="gallery" class="am-gallery am-avg-sm-2 am-avg-md-3 am-avg-lg-4 am-gallery-default">
				<c:forEach items="${loveBks}" var="lbks">
					<li onclick="dealClickEvent('${lbks.bookid}')">
						<div class="am-gallery-item am_list_block">
							<a href="###" class="am_img_bg"> 
								<img class="am_img animated" src="${ctx}/${lbks.imageUrl}"/>
							</a>
	
						</div> 
						<a class="am_imglist_user">
							<span class="am_imglist_user_ico"><img src="${ctx}/img/tx.jpg" alt=""></span><span class="am_imglist_user_font">路见不平Eason吼</span></a>
					</li>
				</c:forEach>
			</ul>
			<div class="am_tuya_ckgd">
				<i class="am-icon-spinner am-icon-spin"></i><a href=""> 查看更多</a>
			</div>
		</div>
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
					<dt>
						<img src="${ctx}/img/logo.png?1" alt="">
					</dt>
					<dd>
						一起Show我们的爱宠吧！宠物秀是图片配文字、涂鸦、COSPLAY的移动手机社区，这里有猫狗鱼龟兔子仓鼠龙猫等各种萌图。 <a
							href="###" class="footdon_pg "><div
								class="foot_d_pg am-icon-apple ">App store</div></a><a href="###"
							class="footdon_az animated"><div
								class="foot_d_az am-icon-android ">Android</div></a>
					</dd>
				</dl>
			</div>

			<div class="am_footer_erweima">
				<div class="am_footer_weixin">
					<img src="${ctx}/img/wx.jpg" alt="">
					<div class="am_footer_d_gzwx am-icon-weixin">关注微信</div>
				</div>
				<div class="am_footer_ddon">
					<img src="${ctx}/img/wx.jpg" alt="">
					<div class="am_footer_d_dxz am-icon-cloud-download">扫码下载</div>
				</div>

			</div>

		</div>
		<div class="am_info_line">
			Copyright(c)2015 <span>PetShow</span> All Rights Reserved.模板收集自 <a
				href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a>
			- More Templates <a href="http://www.cssmoban.com/" title="网页模板"
				target="_blank">网页模板</a>
		</div>
	</footer>
</body>
</html>