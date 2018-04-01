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
<div class="title"><h2>更新用户信息</h2></div>
<form action="${ctx}/admin/updateUser.action" method="post" name="myform" id="myform">
<div class="main">
	<p class="short-input ue-clear">
    	<label>用户编号：</label>${user.userId }
        <input type="hidden" name="userId" id="userId" maxlength="10" value="${user.userId }" readonly="readonly"/>
    </p>
    <p class="short-input ue-clear">
    	<label>注册邮箱：</label>${user.email }
        <input type="hidden" name="email" id="email" maxlength="10" value="${user.email }" readonly="readonly"/>
    </p>
    <p class="short-input ue-clear">
    	<label><span style="color:red">*</span>用户昵称：</label>
        <input type="text" name="userName" id="userName" maxlength="100" value="${user.userName }"/>
    </p>
    <div class="short-input select ue-clear">
    	<label><span style="color:red">*</span>账号类型：</label>
    	<c:if test="${user.userType==1}">
    		<input name="userType" type="radio" value="1" checked/>普通用户
    		<input name="userType" type="radio" value="2" />管理员
    	</c:if>
		<c:if test="${user.userType==2}">
			<input name="userType" type="radio" value="1"/>普通用户
    		<input name="userType" type="radio" value="2" checked/>管理员
		</c:if>
    </div>
	<p class="short-input ue-clear">
    	<label>账号状态：</label>
    	<c:if test="${user.userState==1}"><font color="red">待激活</font></c:if>
		<c:if test="${user.userState==2}"><font color="blue">正常</font></c:if>
		<c:if test="${user.userState==3}"><font color="red">冻结</font></c:if>
    </p>

    <p class="short-input ue-clear">
    	<label>联系电话：</label>
        <input type="text" name="telephone" id="telephone" maxlength="10" value="${user.telephone }"/>
    </p>
    <p class="short-input ue-clear">
    	<label>联系地址：</label>
        <input type="text" name="address" id="address" maxlength="100" value="${user.address }"/>
    </p>
    <p class="short-input ue-clear">
    	<label>备注：</label>
        <input type="text" name="keyword" id="keyword" maxlength="100" value="${user.remark }"/>
    </p>
    <p class="short-input ue-clear">
    	<label>爱好：</label>${user.hobby }
    	
    </p>
</div>
</form>
<div class="btn ue-clear">
	<a href="javascript:;" class="confirm" onclick="addType()">确定</a>
    <a href="${ctx}/admin/getAllUser.action" class="clear">返回</a>
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
	var aa =  $("#publish li").val();
	$("#press").val(aa);
	var typeId = $("input[name='typeid']:checked").val();
	$("#typeId").val(typeId);
	var form = new FormData(document.getElementById("myform"));
	$.ajax({
        type: "POST",
        url: "${ctx}/admin/updateBook.action",
        data: form,
        processData:false,
        contentType : false,
        success: function (result) {
        	alert(result.errorInfo);
			document.myform.attributes["action"].value = "${ctx}/admin/toBookPage.action"; 
			$("form").submit();
        }
      });
}
showRemind('input[type=text], textarea','placeholder');
</script>
</html>