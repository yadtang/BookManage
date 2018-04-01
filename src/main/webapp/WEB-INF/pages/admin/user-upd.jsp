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
    	<label><span style="color:red">*</span>用户编号：</label>
        <input type="text" name="userId" id="userId" maxlength="10" value="${user.userId }" readonly="readonly"/>
    </p>
    <p class="short-input ue-clear">
    	<label><span style="color:red">*</span>用户昵称：</label>
        <input type="text" name="userName" id="userName" maxlength="100" value="${user.userName }"/>
    </p>
    <div class="short-input select ue-clear">
    	<label><span style="color:red">*</span>账号类型：</label>
    	<c:forEach items="${bookType}" var="cs">
    		<input name="typeid" type="radio" value="${cs.typeId}" 
				<c:if test="${book.bookType.typeId eq cs.typeId }">checked</c:if>/>${cs.typeName}
		</c:forEach>
    </div>
    <input type="hidden" name="typeId" id="typeId">
	<p class="short-input ue-clear">
    	<label><span style="color:red">*</span>作者：</label>
        <input type="text" name="author" id="author" maxlength="10" value="${book.author }"/>
    </p>
	<div class="short-input select ue-clear">
    	<label>出版社：</label>
        <div class="select-wrap">
        	<div class="select-title ue-clear"><span >${book.publisher.name }</span><i class="icon"></i></div>
            <ul class="select-list" id="publish">
	            <c:forEach items="${publisher}" var="cs">
					<li value="${cs.id}"/>${cs.name}
				</c:forEach>
            </ul>
        </div>
    </div>
    <input type="hidden" name="press" id="press">
    <div class="short-input select ue-clear">
    	<label><span style="color:red">*</span>所属分类：</label>
    	<c:forEach items="${bookType}" var="cs">
    		<input name="typeid" type="radio" value="${cs.typeId}" 
				<c:if test="${book.bookType.typeId eq cs.typeId }">checked</c:if>/>${cs.typeName}
		</c:forEach>
    </div>
    <input type="hidden" name="typeId" id="typeId">
    <p class="short-input ue-clear">
    	<label>价格：</label>
        <input type="text" name="price" id="price" maxlength="10" value="${book.price }"/>
    </p>
    <p class="short-input ue-clear">
    	<label>简介：</label>
        <input type="text" name="content" id="content" maxlength="100" value="${book.content }"/>
    </p>
    <p class="short-input ue-clear">
    	<label>关键词：</label>
        <input type="text" name="keyword" id="keyword" maxlength="100" value="${book.keyword }"/>
    </p>
    <p class="short-input ue-clear">
    	<label>原图书封面：</label><img src="${ctx}/${book.imageUrl}"  width="150" height="150" />
    </p>
    <p class="short-input ue-clear">
    	<label>新封面：</label>
        <input type="file" name="file" />
    </p>
</div>
</form>
<div class="btn ue-clear">
	<a href="javascript:;" class="confirm" onclick="addType()">确定</a>
    <a href="${ctx}/admin/toBookPage.action" class="clear">返回</a>
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