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
<div class="title"><h2>图书录入</h2></div>
<form action="${ctx}/admin/addBook.action" method="post" name="myform" id="myform" enctype="multipart/form-data">
	<div class="main">
		<p class="short-input ue-clear">
	    	<label><span style="color:red">*</span>图书名称：</label>
	        <input type="text" placeholder="图书名称" name="bookname" id="bookname" onblur="checkUserId()" value=""/>
	        <span style="color: red" id="tipInfo">${message }</span>
	    </p>
	    <p class="short-input ue-clear">
	    	<label><span style="color:red">*</span>作者：</label>
	        <input type="text" placeholder="作者" name="author" id="author" maxlength="100"/>
	    </p>
	    
		<%-- <select class="long-input ue-clear" id="updateProviderName" style="margin-left: 10px;width: 185px">
		    <c:forEach items="${publisher}" var="prd">
		        <option value="${prd.id}"
		            如果所选是之前的值 可以自动填写！
		            <c:if test="${prd.id==id}">selected = "selected"
		            </c:if> >
		            ${prd.name}
		        </option>
		    </c:forEach>
		</select> --%>
		<div class="short-input select ue-clear">
	    	<label>出版社：</label>
	        <div class="select-wrap">
	        	<div class="select-title ue-clear"><span >-- 请选择 --</span><i class="icon"></i></div>
	            <ul class="select-list" id="publish">
		            <c:forEach items="${publisher}" var="cs">
						<li value="${cs.id}"/>${cs.name}
					</c:forEach>
	            </ul>
	        </div>
	    </div>
	    <input type="hidden" name="press" id="press">
	    <div class="long-input select ue-clear">
	    	<label><span style="color:red">*</span>所属分类：</label>
	    	<c:forEach items="${bookType}" var="cs">
				<input name="typeid" type="radio" value="${cs.typeId}" checked="checked"/>${cs.typeName}
			</c:forEach>
	    </div>
	    <p class="short-input ue-clear">
	    	<label>价格：</label>
	        <input type="text" id="price" name="price"/>
	    </p>
	    <p class="short-input ue-clear">
	    	<label>关键词：</label>
	        <input type="text" id="keyword" name="keyword"/>
	    </p>
	    <p class="short-input ue-clear">
	    	<label>简介：</label>
	        <textarea placeholder="请输入内容" id="content" name="content"></textarea>
	    </p>
	    <p class="short-input ue-clear">
	    	<label>封面：</label>
	        <input type="file" name="file" />
	    </p>
	</div>
</form>
<div class="btn ue-clear">
	<a href="javascript:;" class="confirm" onclick="addUser()">确定</a>
    <a href="${ctx}/toBookPage.action" class="clear" >返回</a>
</div>
</body>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.searchableSelect.js"></script>
<script language="javascript" src="${ctx}/js/jquery-form.js"></script>
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

function checkUserId(){
	var userId = $("#userId").val();
	var tipInfo = $("#tipInfo").val();
	if(userId == ""){
		$("#tipInfo").html("请输入账号");
		$("#userId").focus();
		return;
	}
 	$.ajax({
        type: "post",
        url: "${ctx}/admin/userRegist.action",
        data: {userId:userId},
        dataType: "json",
        success: function(data){
        	$("#tipInfo").html(data.errorInfo);
        }
    });
}

function checkEmail(){
	var email = $("#email").val();
	if(email == ""){
		$("#emailInfo").html("请输入邮箱");
		return;
	}
	var req = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
	if(!req.test(email)){
		$("#emailInfo").html("邮箱格式不正确");
		$("#email").focus();
		return;
	}
}

$("#publish li").click(function(){
	//pressValue = $(this).text();
	pressValue = $(this).val();
});

var pressValue = "";
//注册
function addUser(){
	$("#press").val(pressValue);
	var form = new FormData(document.getElementById("myform"));
	$.ajax({
        type: "POST",
        url: "${ctx}/admin/addBook.action",
        data: form,
        processData:false,
        contentType : false,
        success: function (result) {
        	alert(result.errorInfo);
			document.myform.attributes["action"].value = "${ctx}/toBookPage.action"; 
			$("form").submit();
        }
      });
}

//情况所有
function clearAll(){
	alert("清空所有内容");
}

showRemind('input[type=text], textarea','placeholder');
</script>
</html>