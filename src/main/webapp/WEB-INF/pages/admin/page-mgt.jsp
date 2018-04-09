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
<title>图书后台管理系统</title>
</head>

<body>
<div class="title"><h2>图书分类管理</h2></div>
<form action="${ctx}/admin/delCate.action" method="post" name="myform" id="myform">
<div class="table-operate ue-clear">
	<a href="#" class="add" onclick="addCategory()" id="addPage">添加</a>
    <a href="javascript:;" class="del" onclick="delCategory()">删除</a>
</div>
<div class="table-box" id="myDiv">
	<table border="1" cellspacing="1">
    	<thead>
        	<tr>
        		<th class="num"></th>
        		<th class="name">展示编号</th>
                <th class="name">展示名称</th>
                <th class="process">图书名称</th>
                <th class="process">备注</th>
                <th class="operate">操作</th>
            </tr>
        </thead>
        <tbody align="center">
        	<c:forEach items="${dataList}" var="o">
				<tr align="center">
					<td><input type="checkbox" name="id" value="${o.id}"/></td>
					<td>${o.id}</td>
					<td>${o.name}</td>
					<td>
						<c:forEach items="${o.pageBook.book}" var="pbook">
							${pbook.bookname}
						</c:forEach>
						<%-- ${o.pageBook.book} --%>
					</td>
					<td>${o.remark}</td>
					<td class="operate">
						<a href="${ctx}/admin/toUpdHomePagePage.action?id=${o.id}" class="del">修改</a>
						<a class="del" onclick="delCateById(${o.id})">删除</a>
						<a href="${ctx}/admin/toQryHomePagePage.action?id=${o.id}" class="edit">查看</a>
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



$('.pagination').pagination(${pageSize},10,{
	callback: function(page){
	},
	display_msg: true,
	setPageNo: false
});

function delCateById(id){
	if(id == "" || id ==null){
		alert("请选择要删除的记录！");
		return;
	}
	$.post("${ctx}/admin/delPage.action", { pageId:id},function(data){
		alert(data.errorInfo);
		document.myform.attributes["action"].value = "${ctx}/admin/toHomePagePage.action"; 
		$("form").submit();
	},"json");
}

function delCategory(){
	var ids = "";
	$("input:checkbox[name='id']:checked").each(function() {
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

	$.post("${ctx}/admin/delPage.action", { pageId:ids},function(data){
		alert(data.errorInfo);
		document.myform.attributes["action"].value = "${ctx}/admin/toHomePagePage.action"; 
		$("form").submit();
	},"json");
}

//跳转到添加分类页面
function addCategory(){
	document.myform.attributes["action"].value = "${ctx}/admin/toAddHomePagePage.action"; 
	$("form").submit();
}

$("tbody").find("tr:odd").css("backgroundColor","#eff6fa");

$(document).ready(function(){
  	var tomtalPageSize = ${pageSize};
  	if(tomtalPageSize == '10'){
  		$("#addPage").hide();
  	}else{
  		$("#addPage").show();
  	}
});

showRemind('input[type=text], textarea','placeholder');
</script>
</html>