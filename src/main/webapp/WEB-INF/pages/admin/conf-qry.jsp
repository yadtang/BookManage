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
<title>图书管理系统</title>
</head>

<body>
<div class="title"><h2>参数配置详情</h2></div>
<div class="main">
	<p class="short-input ue-clear newstyle">
    	<label>参数编号：</label>${sysconfig.id }
    </p>
    <p class="short-input ue-clear newstyle">
    	<label>参数名称：</label>${sysconfig.paramName }
    </p>
    <p class="long-input ue-clear newstyle">
    	<label>参数值：</label>${sysconfig.paramValue }
    </p>
    <p class="long-input ue-clear newstyle">
    	<label>参数状态：</label>
    	<c:if test="${sysconfig.status==1}"><font color="blue">正常</font></c:if>
		<c:if test="${sysconfig.status==2}"><font color="red">作废</font></c:if>
    </p>
    <p class="short-input ue-clear newstyle">
    	<label>备注：</label>${sysconfig.remark }
    </p>
</div>
<div class="btn ue-clear">
	<a href="${ctx}/admin/toSysconfPage.action" class="confirm">返回</a>
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
showRemind('input[type=text], textarea','placeholder');
</script>
</html>