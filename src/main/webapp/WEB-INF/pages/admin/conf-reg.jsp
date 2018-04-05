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
<div class="title"><h2>新增参数</h2></div>
<form action="${ctx}/admin/addCourse.action" method="post" name="myform" id="myform">
<div class="main">
    <p class="short-input ue-clear">
    	<label><span style="color:red">*</span>参数名称：</label>
        <input type="text" name="paramName" id="paramName" maxlength="100" onblur="checkConf()"/>
        <span style="color: red" id="tipInfo">${message }</span>
    </p>
    <p class="short-input ue-clear">
    	<label>&nbsp;&nbsp;&nbsp;<span style="color:red">*</span>参数值：</label>
        <input type="text" name="paramValue" id="paramValue" maxlength="100"/>
    </p>
    <p class="short-input ue-clear">
    	<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;备注信息：</label>
        <input type="text" name="remark" id="remark"/>
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

//注册
function addType(){
	var form = new FormData(document.getElementById("myform"));
	$.ajax({
        type: "POST",
        url: "${ctx}/admin/addConf.action",
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

//检测参数名称是否已经存在
function checkConf(){
	var paramName = $("#paramName").val();
	if(paramName == ""){
		$("#tipInfo").html("参数名称不能为空");
		$("#paramName").focus();
		return;
	}
 	$.ajax({
        type: "post",
        url: "${ctx}/admin/checkConfName.action",
        data: {name:paramName},
        dataType: "json",
        success: function(data){
        	if(data.errorNo != '0'){
        		$("#tipInfo").html(data.errorInfo);
        		$("#paramName").focus();
        	}else{
        		$("#tipInfo").html(data.errorInfo);
        	}
        	
        }
    });
}

showRemind('input[type=text], textarea','placeholder');
</script>
</html>