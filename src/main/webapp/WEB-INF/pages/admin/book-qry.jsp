<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="${ctx}/css/base.css" />
<link rel="stylesheet" href="${ctx}/css/info-reg.css" />
<title>移动办公自动化系统</title>
</head>

<body>
<div class="title"><h2>图书详情</h2></div>
<div class="main">
	<p class="short-input ue-clear newstyle">
    	<label>图书编号：</label>${book.bookid }
    </p>
    <p class="short-input ue-clear newstyle">
    	<label>图书名称：</label>${book.bookname }
    </p>
    <p class="long-input ue-clear newstyle">
    	<label>作者：</label>${book.author }
    </p>
    <p class="long-input ue-clear newstyle">
    	<label>出版社：</label>${book.publisher.name }
    </p>
    <p class="long-input ue-clear newstyle">
    	<label>所属分类：</label>${book.bookType.typeName }
    </p>
    <p class="short-input ue-clear newstyle">
    	<label>价格：</label>${book.price }
    </p>   
    <p class="short-input ue-clear newstyle">
    	<label>评分：</label>4.8
    </p>
    <p class="short-input ue-clear newstyle">
    	<label>图书评价：</label>${book.bookname }
    </p>
    <p class="short-input ue-clear newstyle">
    	<label>简介：</label>${book.content }
    </p>
    <p class="short-input ue-clear newstyle">
    	<label>关键词：</label>${book.keyword }
    </p>
    <p class="short-input ue-clear newstyle">
    	<label>图书封面：</label><img src="${ctx}/${book.imageUrl}"  width="150" height="150" />
    </p>
</div>
<div class="btn ue-clear">
	<a href="${ctx}/toBookPage.action" class="confirm">返回</a>
</div>
</body>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/WdatePicker.js"></script>
<script type="text/javascript">
$(".select-title").on("click",function(){
	$(".select-list").toggle();
	return false;
});
$(".select-list").on("click","li",function(){
	var txt = $(this).text();
	$(".select-title").find("span").text(txt);
});

function checkPhone(){
	
}

//注册
function addUser(){
	$("form").submit();
}

//情况所有
function clearAll(){
	alert("清空所有内容");
}

showRemind('input[type=text], textarea','placeholder');
</script>
</html>