<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/index_work.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	$(function(){
		$.post("findClazzList.do",function(obj){
			var select = $("[name='cid']");
			select.append('<option value="0">===请选择===</option>');
			for ( var i in obj) {
				select.append('<option value="'+obj[i].cid+'">'+obj[i].cname+'</option>');
			}
		},'json')	
	})
</script>
</head>
<body>
	<form action="addMovie.do" method="post">
		电影名称：<input type="text" name="mname"/><br>
		电影简介：<textarea rows="10" cols="10" name="content"></textarea><br>
		导演：<input type="text" name="rname"/><br>
		发行日期：<input type="date" name="mdate"/><br>
		电影类别：<select name="cid"></select><br>
		<button>确认添加</button>
	</form>
</body>
</html>