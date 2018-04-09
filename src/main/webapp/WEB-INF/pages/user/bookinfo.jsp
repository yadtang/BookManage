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
    <script src="${ctx}/js/amazeui.lazyload.min.js"></script>
	<style type="text/css">
		#bg{
			width: 60px;
			height: 16px;
			background: url("${ctx}/img/star_gray.png");
		}
		#over{
			height:16px;
			background:url("${ctx}/img/star_org.png") no-repeat;
		}
	</style>
	<script type="text/javascript">
		 $(function(){
		  if ($(window).width() < 600 ) {
		 $('.am_list_item_text').each(
		  function(){
		     if($(this).text().length >= 26){
		        $(this).html($(this).text().substr(0,26)+'...');
		     }});}[]
		
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
            <span class="am-sr-only">导航切
            </span>
            <span class="am-icon-bars">
            </span>
        </button>
        <div class="am-collapse am-topbar-collapse" id="doc-topbar-collapse-5">
            <ul class="am-nav am-nav-pills am-topbar-nav">
                <li class="am-active">
                    <a href="#">首页</a>
                </li>
                <li class="am-dropdown" data-am-dropdown="">
                    <a class="am-dropdown-toggle" data-am-dropdown-toggle="" href="javascript:;">发现萌宠
                        <span class="am-icon-caret-down"></span>
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
                    <a class="am-dropdown-toggle" data-am-dropdown-toggle="" href="javascript:;">萌宠服务
                        <span class="am-icon-caret-down">
                        </span>
                    </a>
                    <ul class="am-dropdown-content">
                        <li>
                            <a href="#">宠物医院</a>
                        </li>
                        <li>
                            <a href="#">宠物美容</a>
                        </li>
                        <li>
                            <a href="#">宠物店铺</a>
                        </li>
                        <li>
                            <a href="#">更多服务</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</header>
<div class="am_tuya">
<div class="am_tuya_user">
<div class="am_tuya_user_ico"><img src="${ctx}/img/logo.png" alt=""></div>
<div class="am_tuya_user_info">
  <div class="am_tuya_user_info_name">${book.bookname}</div>
  <!-- <div id="over" style="width:46.8px"></div> -->
  <div id="bg" style="position: absolute;top: 9px;left: 400px;">
	<div id="over" style="width:48px"></div>
</div>
  <span class="am_tuya_user_info_time">${book.author}</span>${book.publisher.name}
  <%-- <div class="am_tuya_user_info_coordinate">
  	<span class="am_tuya_user_info_time">${book.author}</span>${book.publisher.name}
  </div> --%>
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
				<img src="${ctx}/img/kj.png" alt="">${o.user.userName } <span>  • ${o.time }</span>
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
  
  </div>
  <!-- <div class="am_news_load"><span><i  class="am-icon-spinner am-icon-spin"></i> 查看更多讨论</span></div> -->
</div>
<div class="am_tuya_content_r">
<ul class="am_tuya_r_info">
  <li><i class="am-icon-heart"></i><span>${book.number } 人喜欢</span></li>
  <li><i class="am-icon-comments"></i><span>${count } 条讨论</span></li>
  <li><i class="am-icon-eye"></i><span>${book.times } 次查看</span></li>
  <li><i class="am-icon-share-square-o"></i><span>分享图书</span></li>
  <li><i class="am-icon-clock-o"></i><span>发布 ${book.time }</span></li>
</ul>
<ul class="am_tuya_tag">
    <li><span class="am_tuya_tag_title">得分分布</span></li>
    <li>
    	<div id="bg">
			<div id="over" style="width:60px"><span style="margin-right: -185px; margin-top: -4px;">30%</span></div>
		</div>
    </li>
    <li>
    	<div id="bg">
			<div id="over" style="width:48px"><span style="margin-right: -197px; margin-top: -4px;">30%</span></div>
		</div>
    </li>
    <li>
    	<div id="bg">
			<div id="over" style="width:36px"><span style="margin-right: -209px; margin-top: -4px;">30%</span></div>
		</div>
    </li>
    <li>
    	<div id="bg">
			<div id="over" style="width:24px"><span style="margin-right: -221px; margin-top: -4px;">30%</span></div>
		</div>
    </li>
    <li>
    	<div id="bg">
			<div id="over" style="width:12px"><span style="margin-right: -233px; margin-top: -4px;">30%</span></div>
		</div>
    </li>
    
    
<!--     <li><div id="over" style="width:60px"><span style="margin-right: -185px; margin-top: -4px;">30%</span></div></li>
    <li><div id="over" style="width:48px"><span style="margin-right: -185px; margin-top: -4px;">10%</span></div></li>
    <li><div id="over" style="width:36px"><span style="margin-right: -185px; margin-top: -4px;">20%</span></div></li>
    <li><div id="over" style="width:24px"><span style="margin-right: -185px; margin-top: -4px;">20%</span></div></li>
    <li><div id="over" style="width:12px"><span style="margin-right: -185px; margin-top: -4px;">20%</span></div></li> -->
</ul>
<div class="page_hot">
            <div class="page_hot_title">人气排行</div>
            <div class="page_hot_list"><div class="page_hot_block">
    <dl>
        <dt><a href="#"><img src="http://img.petshow.cc/pet_show/2015_08/9271536e6bba236ff7ac4621304a935b.jpg" alt=""></a></dt>
        <dd>
            <i>路见不平Eason吼 ♫</i>
            <em>广西壮族自治区钦州市</em>
            <div class="hot_block_info">
                <div class="hot_info_l am-icon-heart">16</div>
                <div class="hot_info_r am-icon-comments">1</div>
            </div>
        </dd>
    </dl>
</div>
<div class="page_hot_block">
    <dl>
        <dt><a href="#"><img src="http://img.petshow.cc/pet_show/2015_08/a06efc530d8220cb30a711c5e0ea92a8.jpg" alt=""></a></dt>
        <dd>
            <i>张子玉^_-@</i>
            <em>北京市北京市</em>
            <div class="hot_block_info">
                <div class="hot_info_l am-icon-heart">14</div>
                <div class="hot_info_r am-icon-comments">1</div>
            </div>
        </dd>
    </dl>
</div>
<div class="page_hot_block">
    <dl>
        <dt><a href="/23083.html"><img src="http://img.petshow.cc/pet_show/2015_08/49c8a8256eb95f549fa843fb8b9a61eb.jpg" alt=""></a></dt>
        <dd>
            <i>梦里花落</i>
            <em>重庆市重庆市</em>
            <div class="hot_block_info">
                <div class="hot_info_l am-icon-heart">13</div>
                <div class="hot_info_r am-icon-comments">5</div>
            </div>
        </dd>
    </dl>
</div>
<div class="page_hot_block">
    <dl>
        <dt><a href="/21687.html"><img src="http://img.petshow.cc/pet_show/2015_08/3e2d201e234fc5be999710726f89b895.jpg" alt=""></a></dt>
        <dd>
            <i>神秘人</i>
            <em>广西壮族自治区南宁市</em>
            <div class="hot_block_info">
                <div class="hot_info_l am-icon-heart">13</div>
                <div class="hot_info_r am-icon-comments">3</div>
            </div>
        </dd>
    </dl>
</div>
<div class="page_hot_block">
    <dl>
        <dt><a href="/20603.html"><img src="http://img.petshow.cc/pet_show/2015_08/b1253be5c48cba3eef939c5fb25b99e7.jpg" alt=""></a></dt>
        <dd>
            <i>夜光</i>
            <em>安徽省滁州市</em>
            <div class="hot_block_info">
                <div class="hot_info_l am-icon-heart">13</div>
                <div class="hot_info_r am-icon-comments">3</div>
            </div>
        </dd>
    </dl>
</div>
<div class="page_hot_block">
    <dl>
        <dt><a href="/21644.html"><img src="http://img.petshow.cc/pet_show/2015_08/3a87a79c8aef235f36876c1ed3295e4c.jpg" alt=""></a></dt>
        <dd>
            <i>吉娃娃_朵朵</i>
            <em>山东省济宁市</em>
            <div class="hot_block_info">
                <div class="hot_info_l am-icon-heart">12</div>
                <div class="hot_info_r am-icon-comments">2</div>
            </div>
        </dd>
    </dl>
</div>
</div>
          </div>
</div>
</div>
</div>
<div class="am_tuya_cai">
<div class="am_tuya_cai_ti">猜你喜欢</div>
<div class="am-g am-imglist">
    <ul data-am-widget="gallery" class="am-gallery am-avg-sm-2
  am-avg-md-3 am-avg-lg-4 am-gallery-default" >
  <li>
    <div class="am-gallery-item am_list_block">
      <a href="###" class="am_img_bg">
        <img class="am_img animated" src="${ctx}/img/loading.gif" alt="远方 有一个地方 那里种有我们的梦想"/>
              </a>

    </div>
    <a class="am_imglist_user"><span class="am_imglist_user_ico"><img src="${ctx}/img/tx.jpg" alt=""></span><span class="am_imglist_user_font">路见不平Eason吼</span></a>
  </li>
    <li>
    <div class="am-gallery-item am_list_block">
      <a href="###" class="am_img_bg">
        <img class="am_img animated" src="${ctx}/img/loading.gif" alt="远方 有一个地方 那里种有我们的梦想"/>
              </a>

    </div>
    <a class="am_imglist_user"><span class="am_imglist_user_ico"><img src="${ctx}/img/tx.jpg" alt=""></span><span class="am_imglist_user_font">路见不平Eason吼</span></a>
  </li>
    <li>
    <div class="am-gallery-item am_list_block">
      <a href="###" class="am_img_bg">
        <img class="am_img animated" src="${ctx}/img/loading.gif" alt="远方 有一个地方 那里种有我们的梦想"/>
              </a>

    </div>
    <a class="am_imglist_user"><span class="am_imglist_user_ico"><img src="${ctx}/img/tx.jpg" alt=""></span><span class="am_imglist_user_font">路见不平Eason吼</span></a>
  </li>
    <li>
    <div class="am-gallery-item am_list_block">
      <a href="###" class="am_img_bg">
        <img class="am_img animated" src="${ctx}/img/loading.gif" alt="远方 有一个地方 那里种有我们的梦想"/>
              </a>

    </div>
    <a class="am_imglist_user"><span class="am_imglist_user_ico"><img src="${ctx}/img/tx.jpg" alt=""></span><span class="am_imglist_user_font">路见不平Eason吼</span></a>
  </li>
</ul>
<div class="am_tuya_ckgd"><i class="am-icon-spinner am-icon-spin"></i><a href=""> 查看更多</a></div>
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
  <dt><img src="img/footdon.png?1" alt=""></dt>
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
</body>
</html>