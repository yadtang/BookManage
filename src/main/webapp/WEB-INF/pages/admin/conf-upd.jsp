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
<title>图书管理系统</title>
</head>

<body>
<div class="title"><h2>更新配置信息</h2></div>
<form action="${ctx}/admin/updateUser.action" method="post" name="myform" id="myform">
<div class="main">
	<p class="short-input ue-clear">
    	<label>用户编号：</label>${sysconfig.id }
        <input type="hidden" name="id" id="id" maxlength="10" value="${sysconfig.id }" readonly="readonly"/>
    </p>
    <p class="short-input ue-clear">
    	<label>参数名称：</label>${sysconfig.paramName }
    </p>
    <p class="short-input ue-clear">
    	<label>参数值：</label>
    	<input type="text" name="paramValue" id="paramValue" maxlength="100" value="${sysconfig.paramValue }"/>
        
    </p>
	<p class="short-input ue-clear">
    	<label>账号状态：</label>
    	<c:if test="${sysconfig.status==1}"><font color="blue">正常</font></c:if>
		<c:if test="${sysconfig.status==2}"><font color="red">作废</font></c:if>
    </p>
    <p class="short-input ue-clear">
    	<label>备注：</label>
        <input type="text" name="remark" id="remark" maxlength="100" value="${sysconfig.remark }"/>
    </p>
</div>
</form>
<div class="btn ue-clear">
	<a href="javascript:;" class="confirm" onclick="addType()">确定</a>
    <a href="${ctx}/admin/toSysconfPage.action" class="clear">返回</a>
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

$("#publish li").click(function(){
	//pressValue = $(this).text();
	pressValue = $(this).val();
});

var pressValue = "";

//注册
function addType(){
	var form = new FormData(document.getElementById("myform"));
	$.ajax({
        type: "POST",
        url: "${ctx}/admin/updateConf.action",
        data: form,
        processData:false,
        contentType : false,
        success: function (result) {
        	alert(result.errorInfo);
			document.myform.attributes["action"].value = "${ctx}/admin/toSysconfPage.action"; 
			$("form").submit();
        }
      });
}
showRemind('input[type=text], textarea','placeholder');
</script>
</html>