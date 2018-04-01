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
<div class="title"><h2>用户详情</h2></div>
<div class="main">
	<p class="short-input ue-clear newstyle">
    	<label>用户编号：</label>${user.userId }
    </p>
    <p class="short-input ue-clear newstyle">
    	<label>用户昵称：</label>${user.userName }
    </p>
    <p class="long-input ue-clear newstyle">
    	<label>账号类型：</label>
    	<c:if test="${user.userType==1}"><font color="blue">普通用户</font></c:if>
		<c:if test="${user.userType==2}"><font color="red">管理员</font></c:if>
    </p>
    <p class="long-input ue-clear newstyle">
    	<label>账号状态：</label>
    	<c:if test="${user.userState==1}"><font color="red">待激活</font></c:if>
		<c:if test="${user.userState==2}"><font color="blue">正常</font></c:if>
		<c:if test="${user.userState==3}"><font color="red">冻结</font></c:if>
    </p>
    <p class="long-input ue-clear newstyle">
    	<label>注册邮箱：</label>${user.email }
    </p>
    <p class="short-input ue-clear newstyle">
    	<label>联系电话：</label>${user.telephone }
    </p>   
    <p class="short-input ue-clear newstyle">
    	<label>联系地址：</label>${user.address }
    </p>
    <p class="short-input ue-clear newstyle">
    	<label>备注：</label>${user.remark }
    </p>
    <p class="short-input ue-clear newstyle">
    	<label>爱好：</label>${user.hobby }
    </p>
</div>
<div class="btn ue-clear">
	<a href="${ctx}/admin/getAllUser.action" class="confirm">返回</a>
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