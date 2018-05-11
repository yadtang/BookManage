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
<div class="title"><h2>更新首页</h2></div>
<form action="${ctx}/admin/addBook.action" method="post" name="myform" id="myform" enctype="multipart/form-data">
	<div class="main">
		<input type="hidden" id="id" name="id" value="${homePage.id}"/>
		<p class="short-input ue-clear">
	    	<label>展示名称：</label>
	        <input type="text" placeholder="图书名称" name="name" id="name" onblur="checkUserId()" value="${homePage.name}"/>
	        <span style="color: red" id="tipInfo">${message }</span>
	    </p>
	    <div class="long-input select ue-clear">
	    	<label>图书分类：</label>
	    	<c:forEach items="${bookType}" var="cs">
	    		<input name="typeid" type="radio" value="${cs.typeId}" <c:if test="${cs.typeId eq typeId}">checked</c:if> onclick="doCheck()"/>${cs.typeName}
			</c:forEach>
	    </div>
	    
	    <div class="long-input select ue-clear">
	    	<div id="myDiv">
	    		<label>图书</label>
		    	<c:forEach items="${homePage.pageBook.book}" var="cs">
					<input name="bookid" type="checkbox" value="${cs.bookid}" checked="checked"/>${cs.bookname}
				</c:forEach>
	    	</div>
	    </div>
	    <p class="short-input ue-clear">
	    	<label>备注：</label>
	        <textarea placeholder="请输入内容" id="remark" name="remark">${homePage.remark}</textarea>
	    </p>
	</div>
</form>
<div class="btn ue-clear">
	<a href="javascript:;" class="confirm" onclick="addUser()">确定</a>
    <a href="${ctx}/admin/toHomePagePage.action" class="clear" >返回</a>
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

function doCheck(){
	var typeid = $('input[name="typeid"]:checked').val();
	$.ajax({
        type: "post",
        url: "${ctx}/admin/getBookByType.action",
        data: {id:typeid},
        dataType: "json",
        success: function(data){
        	var html = "<div id='myDiv'><label>图书</label>";
			for(dataList in data){
				html += "<input type='checkbox' name='bookid' value='"+data[dataList].bookid+"'/>"+data[dataList].bookname+"";
			}
			html += "</div>"; 
	        $("#myDiv").html("");
	        $("#myDiv").append(html); 
        }
    });
}

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
	var form = new FormData(document.getElementById("myform"));
	$.ajax({
        type: "POST",
        url: "${ctx}/admin/updatePage.action",
        data: form,
        processData:false,
        contentType : false,
        success: function (result) {
        	alert(result.errorInfo);
			document.myform.attributes["action"].value = "${ctx}/admin/toHomePagePage.action"; 
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