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
<link rel="stylesheet" href="${ctx}/css/info-mgt.css" />
<link rel="stylesheet" href="${ctx}/css/WdatePicker.css" />
<title>移动办公自动化系统</title>
</head>

<body>
<div class="title"><h2>用户管理</h2></div>
<form action="${ctx}/admin/deleteCourse.action" method="post" name="myform" id="myform">
<div class="table-operate ue-clear">
	<a href="#" class="add" onclick="reSetPwd()">重置</a>
    <a href="javascript:;" class="del" onclick="deleteUser()">注销</a>
</div>
<div class="table-box" id="myDiv">
	<table border="1" cellspacing="1">
    	<thead>
        	<tr>
        		<th class="num"></th>
        		<th class="name">参数编号</th>
                <th class="name">参数名称</th>
                <th class="process">参数值</th>
                <th class="process">参数状态</th>
                <th class="process">备注</th>
                <th class="operate">操作</th>
            </tr>
        </thead>
        <tbody align="center">
        	<c:forEach items="${dataList}" var="o">
				<tr align="center">
					<td><input type="checkbox" name="userId" value="${o.id}"/></td>
					<td>${o.id}</td>
					<td>${o.paramName}</td>
					<%-- <td>
						<c:if test="${o.userType==1}"><font color="blue">普通用户</font></c:if>
						<c:if test="${o.userType==2}"><font color="red">管理员</font></c:if>
					</td>
					<td>
						<c:if test="${o.userState==1}"><font color="red">待激活</font></c:if>
						<c:if test="${o.userState==2}"><font color="blue">正常</font></c:if>
						<c:if test="${o.userState==3}"><font color="red">冻结</font></c:if>
					</td> --%>
					<td>${o.paramValue}</td>
					<td>${o.status}</td>
					<td>${o.remark}</td>
					<td class="operate">
						<a href="${ctx}/admin/toUpdPublisherPage.action?id=${o.id}" class="del">修改</a>
						<a class="del" onclick="delCateById(${o.id})">删除</a>
						<a href="${ctx}/admin/toQrySysconfigPage.action?id=${o.id}" class="edit">查看</a>
					</td>
				</tr>
			</c:forEach>
        </tbody>
    </table>
</div>
<div class="pagination ue-clear"></div>
</form>
</body>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.pagination.js"></script>
<script type="text/javascript">
$(".select-title").on("click",function(){
	$(".select-list").hide();
	$(this).siblings($(".select-list")).show();
	return false;
})
$(".select-list").on("click","li",function(){
	var txt = $(this).text();
	$(this).parent($(".select-list")).siblings($(".select-title")).find("span").text(txt);
})

$('.pagination').pagination(${pageInfo.total},10,{
	callback: function(page){
		$.ajax({
			url:"${ctx}/admin/qryAllUser.action",
			method:"post",
			dataType: "json",
			data:{page:page+1},
			success: function(data){
				var html = "";
 				html += "<div class='table-box' id='myDiv'>";
				html += "<table border='1' cellspacing='1'>";
				html += "<thead>";
				html += "<th class='num'></th>";
				html += "<th class='name'>用户编号</th><th class='name'>用户昵称</th><th class='process'>账号类型</th>";
				html += "<th class='process'>账户状态</th><th class='process'>电子邮箱</th><th class='operate'>操作</th>";
				html += "</thead>";
				html += "<tbody align='center'>";
				
				for(dataList in data){
					html += "<tr align='center'>";
					html += "<td><input type='checkbox' name='userId' value='"+data[dataList].userId+"'/></td>";
					html += "<td>"+data[dataList].userId+"</td>";
					html += "<td>"+data[dataList].userName+"</td>";
					
					if(data[dataList].userType == 1){
						html += "<td><font color='blue'>普通用户</font></td>";
					}else if(data[dataList].userType == 2){
						html += "<td><font color='red'>管理员</font></td>";
					}
					
					if(data[dataList].userState == 1){
						html += "<td><font color='red'>待激活</font></td>";
					}else if(data[dataList].userState == 2){
						html += "<td><font color='blue'>正常</font></td>";
					}else if(data[dataList].userState == 3){
						html += "<td><font color='red'>冻结</font></td>";
					}
					html += "<td>"+data[dataList].email+"</td>";
					
					html += "<td class='operate'>";
					if(data[dataList].userState == 2){
						html += "<a href='${ctx}/admin/toUpdateUser.action?userId="+data[dataList].userId+"' class='del'>编辑</a>&nbsp;";
						html += "<a class='del' onclick='delUserById("+data[dataList].userId+")'>注销</a>&nbsp;";
					}
					if(data[dataList].userState == 3){
						html += "<a class='del' onclick='thawUserById('+data[dataList].userId+')'>解冻</a>&nbsp;";
					}
					html += "<a href='${ctx}/admin/toQryUser.action?userId="+data[dataList].userId+"' class='del'>查看</a></td>";
					html += "</tr>";
				}
				html += "</tbody>"; 
				html += "</table>";
				html += "</div>"; 
		        $("#myDiv").html("");
		        $("#myDiv").html(html); 
		    }
		});	
	},
	display_msg: true,
	setPageNo: false
});

function delUserById(id){
	if(id == "" || id ==null){
		alert("请选择要删除的记录！");
		return;
	}
	$.post("${ctx}/admin/deleteUser.action", { userId:id},function(data){
		alert(data.errorInfo);
		document.myform.attributes["action"].value = "${ctx}/admin/getAllUser.action"; 
		$("form").submit();
	},"json");
}

function thawUserById(id){
	if(id == "" || id ==null){
		alert("请选择要解冻的用户记录！");
		return;
	}
	$.post("${ctx}/admin/thawUserById.action", { userId:id},function(data){
		alert(data.errorInfo);
		document.myform.attributes["action"].value = "${ctx}/admin/getAllUser.action"; 
		$("form").submit();
	},"json");
}

function deleteUser(){
	var ids = "";
	$("input:checkbox[name='userId']:checked").each(function() {
		ids += $(this).val() + ",";
    });
	//判断最后一个字符是否为逗号，若是截取
	var id = ids.substring(ids.length -1, ids.length);
	if(id == ","){
		ids = ids.substring(0, ids.length-1);
	}
	if(ids == ""){
		alert("请选择要删除的记录！");
		return;
	}
	$.post("${ctx}/admin/deleteUser.action", { userId:ids},function(data){
		alert(data.errorInfo);
		document.myform.attributes["action"].value = "${ctx}/admin/getAllUser.action"; 
		$("form").submit();
	},"json");
}

//密码重置
function reSetPwd(){
	var ids = "";
	$("input:checkbox[name='userId']:checked").each(function() {
		ids += $(this).val() + ",";
    });
	
	//判断最后一个字符是否为逗号，若是截取
	var id = ids.substring(ids.length -1, ids.length);
	if(id == ","){
		ids = ids.substring(0, ids.length-1);
	}
	if(ids == ""){
		alert("请选择要重置的记录！");
		return;
	}
	$.post("${ctx}/admin/reSetPwd.action", { userId:ids},function(data){
		alert(data.errorInfo);
		document.myform.attributes["action"].value = "${ctx}/admin/getAllUser.action"; 
		$("form").submit();
	},"json");
}

$("tbody").find("tr:odd").css("backgroundColor","#eff6fa");

showRemind('input[type=text], textarea','placeholder');
</script>
</html>