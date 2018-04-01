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
<div class="title"><h2>图书管理</h2></div>
<form action="${ctx}/admin/delCate.action" method="post" name="myform" id="myform">
<div class="table-operate ue-clear">
	<a href="#" class="add" onclick="addCategory()">添加</a>
    <a href="javascript:;" class="del" onclick="delCategory()">删除</a>
</div>
<div class="table-box" id="myDiv">
	<table border="1" cellspacing="1" >
    	<thead>
        	<tr>
        		<th class="num"></th>
        		<th class="name">图书编号</th>
                <th class="name">图书名称</th>
                <th class="process">作者</th>
                <th class="process">出本社</th>
                <th class="process">封面</th>
                <th class="operate">操作</th>
            </tr>
        </thead>
        <tbody align="center">
        	<c:forEach items="${dataList}" var="o">
				<tr align="center" >
					<td><input type="checkbox" name="bookid" value="${o.bookid}"/></td>
					<td>${o.bookid}</td>
					<td>${o.bookname}</td>
					<td>${o.author}</td>
					<td>${o.publisher.name}</td>
					<td><img src="${ctx}/${o.imageUrl}"  width="80" height="80" /></td>
					<td class="operate">
						<a href="${ctx}/toUpdBookPage.action?id=${o.bookid}" class="del">修改</a>
						<a class="del" onclick="delCateById(${o.bookid})">删除</a>
						<a href="${ctx}/toQryBookPage.action?id=${o.bookid}" class="edit">查看</a>
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

$('.pagination').pagination(${pageInfo.total},5,{
	callback: function(page){
		$.ajax({
			url:"${ctx}/qryBookByPage.action",
			method:"post",
			dataType: "json",
			data:{page:page+1},
			success: function(data){
				var html = "";
 				html += "<div class='table-box' id='myDiv'>";
				html += "<table border='1' cellspacing='1'>";
				html += "<thead>";
				html += "<th class='num'></th>";
				html += "<th class='name'>图书编号</th><th class='name'>图书名称</th>";
				html += "<th class='process'>作者</th><th class='process'>出版社</th><th class='process'>封面</th><th class='operate'>操作</th>";
				html += "</thead>";
				html += "<tbody align='center'>";
				for(dataList in data){
					html += "<tr align='center'>";
					html += "<td><input type='checkbox' name='bookid' value='"+data[dataList].bookid+"'/></td>";
					html += "<td>"+data[dataList].bookid+"</td>";
					html += "<td>"+data[dataList].bookname+"</td>";
					html += "<td>"+data[dataList].author+"</td>";
					html += "<td>"+data[dataList].publisher.name+"</td>";
					html += "<td><img src='${ctx}/"+data[dataList].imageUrl+"'  width='80' height='80' /></td>";
					html += "<td class='operate'><a href='${ctx}/toUpdBookPage.action?id="+data[dataList].bookid+"'>修改</a>&nbsp;";
					html += "<a class='del' onclick='delCateById("+data[dataList].bookid+")'>删除</a>&nbsp;";
					html += "<a href='${ctx}/toQryBookPage.action?id="+data[dataList].bookid+"' class='del'>查看</a></td>";
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

function delCateById(id){
	if(id == "" || id ==null){
		alert("请选择要删除的记录！");
		return;
	}
	$.post("${ctx}/admin/delBook.action", { bookid:id},function(data){
		alert(data.errorInfo);
		document.myform.attributes["action"].value = "${ctx}/toBookPage.action"; 
		$("form").submit();
	},"json");
}

function delCategory(){
	var ids = "";
	$("input:checkbox[name='bookid']:checked").each(function() {
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
	$.post("${ctx}/admin/delBook.action", { bookid:ids},function(data){
		alert(data.errorInfo);
		document.myform.attributes["action"].value = "${ctx}/toBookPage.action"; 
		$("form").submit();
	},"json");
}

//跳转到添加分类页面
function addCategory(){
	document.myform.attributes["action"].value = "${ctx}/toAddBookPage.action"; 
	$("form").submit();
}

$("tbody").find("tr:odd").css("backgroundColor","#eff6fa");

showRemind('input[type=text], textarea','placeholder');
</script>
</html>