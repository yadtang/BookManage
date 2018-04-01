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
<link rel="stylesheet" href="${ctx}/css/jquery.searchableSelect.css" />
<title>移动办公自动化系统</title>
</head>

<body>
<div class="title"><h2>书架查询</h2></div>
<form action="${ctx}/admin/updCourse.action" method="post" name="myform" id="myform">
<div class="main">
	<p class="short-input ue-clear">
    	<label><span style="color:red">*</span>分类编号：</label>
        <input type="text" name="cateId" id="cateId" maxlength="10" value="${category.id }" disabled="disabled"/>
    </p>
    <p class="short-input ue-clear">
    	<label><span style="color:red">*</span>分类名称：</label>
        <input type="text" name="cateName" id="cateName" maxlength="10" value="${category.name }" disabled="disabled"/>
    </p>
	<p class="short-input ue-clear">
    	<label><span style="color:red">*</span>分类状态：</label>
        <input type="text" name="status" id="status" maxlength="10" value="${category.status }" disabled="disabled"/>
    </p>
	<p class="short-input ue-clear">
    	<label><span style="color:red">*</span>备注信息：</label>
        <input type="text" name="remark" id="remark" maxlength="10" value="${category.remark }" disabled="disabled"/>
    </p>
</div>
</form>
<div class="btn ue-clear">
    <a href="${ctx}/toCategoryPage.action" class="confirm">返回</a>
</div>
</body>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.searchableSelect.js"></script>
<script type="text/javascript">
$(function(){
	$("#grade").searchableSelect();
});
$(".select-title").on("click",function(){
	$(".select-list").toggle();
	return false;
});
$(".select-list").on("click","li",function(){
	var txt = $(this).text();
	$(".select-title").find("span").text(txt);
});
//注册
function addType(){
	/* document.myform.attributes["action"].value = "${ctx}/admin/updateCate.action"; 
	$("form").submit(); */
	
	var id = $("#cateId").val();
	var name = $("#cateName").val();
	var status = $("#status").val();
	var remark = $("#remark").val();
	$.post("${ctx}/admin/updateCate.action", { id:id, name:name,status:status, remark:remark},function(data){
		alert(data.errorInfo);
	},"json");
}
showRemind('input[type=text], textarea','placeholder');
</script>
</html>