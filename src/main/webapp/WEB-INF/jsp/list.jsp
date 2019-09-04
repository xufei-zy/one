<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/index_work.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	function page(pageNum){
		$("[name='pageNum']").val(pageNum);
		$("#page").submit();
	}
	
	function qx(){
		$("[name='mids']").each(function(){
			$(this).attr("checked",!$(this).attr("checked"));
		})
	}
	
	function deleteAll(){
		var mids=new Array();
		$("[name='mids']:checked").map(function(){
			mids.push($(this).val());
		})
		
		if(mids.length==0){
			alert("请选择至少两条数据！");
		}else if(confirm("确认删除已选择的数据吗？")){
			$.post("deleteAllMovie.do",
					$("#del").serialize(),
			function(obj){
				if(obj>0){
					alert("批量删除成功！");
					$("#page").submit();
				}else{
					alert("批量删除失败！");
					$("#page").submit();
				}
			},'json')
		}
	}
</script>
</head>
<body>
	<form id="page" action="list.do" method="post">
		<input type="hidden" name="pageNum" value="${page.pageNum }"/>
		电影名称：<input type="text" name="mname" value="${map.mname }"/>
		<button>查询</button>
	</form>
	<form id="del" method="post">
		<table>
			<tr>
				<th>
					<input type="checkbox" onclick="qx()"/>全选/反选
				</th>
				<th>编号</th>
				<th>电影名称</th>
				<th>电影简介</th>
				<th>导演</th>
				<th>发行日期</th>
				<th>电影类别</th>
				<th>操作
					<input type="button" value="添加" onclick="location='toAdd.do'"/>
				</th>
			</tr>
			<c:forEach items="${movieList }" var="movie">
				<tr>
					<td><input type="checkbox" name="mids" value="${movie.mid }"/></td>
					<td>${movie.mid }</td>
					<td>${movie.mname }</td>
					<td>${movie.content }</td>
					<td>${movie.rname }</td>
					<td>${movie.mdate }</td>
					<td>${movie.cname }</td>
					<td>
						<input type="button" value="修改" onclick="location='toUpdate.do?mid=${movie.mid}'"/>
						<input type="button" value="删除" onclick="location='deleteMovie.do?mid=${movie.mid}'"/>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td><input type="button" value="批量删除" onclick="deleteAll()"/></td>
				<td colspan="7">
					<input type="button" value="首页" onclick="page('1')"/>
					<input type="button" value="上一页" onclick="page('${page.pageNum-1}')"/>
					<input type="button" value="下一页" onclick="page('${page.pageNum+1}')"/>
					<input type="button" value="尾页" onclick="page('${page.pages}')"/>
					当前：${page.pageNum}/共：${page.pages}页
				</td>
			</tr>
		</table>
	</form>
</body>
</html>