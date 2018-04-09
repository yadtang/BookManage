<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en" class="no-js">
<head>
<meta charset="utf-8">
<title>读书网</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="${ctx}/css/reset.css">
<link rel="stylesheet" href="${ctx}/css/supersized.css">
<link rel="stylesheet" href="${ctx}/css/userlogin.css">
<script src="${ctx}/js/jquery-1.8.2.min.js"></script>
<script src="${ctx}/js/supersized.3.2.7.min.js"></script>
<script src="${ctx}/js/supersized-init.js"></script>
<script src="${ctx}/js/scripts.js"></script>
<script type="text/javascript">
	function regist(){
		var Pwd = $("#Pwd").val();
		var userPwd =$("#userPwd").val();
		if(Pwd ==""){
			alert("登录密码不能为空");
			return;
		}
		if(userPwd ==""){
			alert("确认密码不能为空");
			return;
		}
		if(Pwd!=userPwd){
			alert("两次密码不一致，请重新输入！");
			return;
		}
		
		var form = new FormData(document.getElementById("myform"));
		$.ajax({
	        type: "POST",
	        url: "${ctx}/user/regist.action",
	        data: form,
	        processData:false,
	        contentType : false,
	        success: function (result) {
	        	alert(result.errorInfo);
				/* document.myform.attributes["action"].value = "${ctx}/admin/toSysconfPage.action"; 
				$("form").submit(); */
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
		var emailMsg = $("#emailMsg").val();
		if(email == ""){
			$("#emailMsg").html("请输入邮箱");
			$("#email").focus();
			return;
		}
	 	$.ajax({
	        type: "post",
	        url: "${ctx}/admin/checkEamil.action",
	        data: {email:email},
	        dataType: "json",
	        success: function(data){
	        	$("#emailMsg").html(data.errorInfo);
	        	if(data.errorNo == '1'){
	        		$("#email").focus();
	        	}
	        }
	    });
	}
	
	function checkPwd(){
		var Pwd = $("#Pwd").val();
		var userPwd =$("#userPwd").val();
		if(Pwd ==""){
			alert("登录密码不能为空");
			return;
		}
		if(userPwd ==""){
			alert("确认密码不能为空");
			return;
		}
		if(Pwd!=userPwd){
			alert("两次密码不一致，请重新输入！");
			return;
		}
		
	}
	
</script>
</head>
<body>
    <div class="page-container">
        <h1>用户注册</h1>
        <form action="${ctx}/user/toIndex.action" method="post" name="myform" id="myform">
            <input type="text" name="userId" id="userId" class="username" placeholder="用户账号" onblur="checkUserId()"><br><span style="color: red" id="tipInfo">${message }</span><br>
            <input type="text" name="userName" id="userName" placeholder="用户昵称">
            <input type="text" name="email" id="email" class="username" placeholder="邮箱"  onblur="checkEmail()"><br><span style="color: red" id="emailMsg">${emailMsg }</span><br>
            <input type="password" name="Pwd" id="Pwd" class="password" placeholder="登录密码">
            <input type="password" name="userPwd" id="userPwd" class="password" placeholder="确认密码" onblur="checkPwd()"><br/>
            <c:forEach items="${grade}" var="grade">
				<input type="radio" checked="checked" name="grade" value="${grade.gradeId }" 
					class="radio" />${grade.gradeName } &nbsp;
			</c:forEach>
            
            <input type="text" name="telphone" id="telphone" placeholder="联系电话">
            <input type="text" name="address" id="address" placeholder="联系地址">
            <button type="button" onclick="regist()">注册</button>
            <div class="error"><span>${message }</span></div>
        </form>
        <div class="connect"></div>
    </div>
    <div align="center">我已经有一个账号， <a href="${ctx}/toLogin.action" target="_self">立即登录</a></div>
</body>

</html>
