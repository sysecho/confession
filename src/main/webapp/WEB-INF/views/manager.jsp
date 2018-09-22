<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>留言管理</title>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<script src="../static/layer/layer.js"></script>
<link rel="stylesheet" href="../static/layer/theme/default/layer.css">
</head>
<body style="margin: 8%;">
	<div class="table-responsive" style="margin-top: 5%;">
		<h1 class="text-primary">留言管理</h1>
		<table class="table table-hover" id="confessionsTable">
		 	<thead>
		 		<th>发送对象</th>
		 		<th>内容</th>
		 		<th>发送人</th>
		 		<th>时间</th>
		 		<th>操作</th>
		 	</thead>
		 	<tbody>
		 	</tbody>
		</table>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		init();
	});
	
	function init(){
		$.get('listConfessions',{},function(data){
			if(data.success == true){
				var rows = data.rows;
				$('#confessionsTable tbody').empty();
				var trHTML ='';
				$.each(rows,function(idx,confession){
					var content = '';
					var name = '';
					var fromeUser = '';
					if(confession.content.length > 25){
						content = '<div title="'+confession.content+'">'+confession.content.substring(0,25)+'<a href="javascript:void(0)">查看...</a></div>';
					}else{
						content = confession.content;
					}
					
					if(confession.name){
						name = confession.name;
					}else{
						name = '未填写';
					}
					
					if(confession.fromeUser){
						fromeUser = confession.fromeUser;
					}else{
						fromeUser = '匿名留言';
					}
					trHTML += '<tr><td>'+name+'</td><td>'+content+'</td><td>'+fromeUser+'</td><td>'+confession.createDate+
					'</td><td><button type="button" role="button" class="btn btn-danger btn-sm" aria-label="Left Align" onclick="delConfession(\''+confession.id+'\');">'
					 +'<span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button></td></tr>';
				});
				$("#confessionsTable tbody:last").append(trHTML);
			}
		});
	}
	
	function delConfession(id){
		if('null' != id){
			layer.confirm('确认删除?', {icon: 3, title:'删除提示'}, function(index){
				$.post('del',{id:id},function(data){
					if(data.success){
						layer.alert('成功删除',{icon:2});
						init();
					}
				});
				  layer.close(index);
				});
		}else{
			layer.alert('id不存在，无法删除',{icon:2});
		}
	}
</script>
</html>