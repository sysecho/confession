<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="../static/images/favicon.ico" type="image/x-icon" />
<title>留言管理</title>
<script src="../static/js/jquery-3.2.0.min.js"></script>
<!-- Bootstrap-->
<link rel="stylesheet" href="../static/bootstrap/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="../static/bootstrap/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="../static/bootstrap/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<!-- bootstrap-table -->
<link href="../static/bootstrap-table-master/bootstrap-table.min.css" rel="stylesheet" />
<script src="../static/bootstrap-table-master/bootstrap-table.min.js"></script>
<script src="../static/bootstrap-table-master/bootstrap-table-zh-CN.min.js"></script>

<!-- layer -->	
<script src="../static/layer/layer.js"></script>
<link rel="stylesheet" href="../static/layer/theme/default/layer.css">
</head>
<body style="margin: 8%;">
	<div class="table-responsive" style="margin-top: 5%;">
		<h1 class="text-primary">留言管理</h1>
		<table class="table" id="confessionsTable"></table>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		init();
	});
	
	function init(){
		$('#confessionsTable').bootstrapTable({
			url: 'listConfessions',
			uniqueId: 'id',

            pagination: true,
            showRefresh:true,
			showColumns:true,
			sidePagination: "server", //服务端分页 server

            paginationPreText: '上一页',

            paginationNextText: '下一页',

            queryParams: function (params) {
                return {
                    page: (params.offset/10),
                    size: params.limit
                };
            },
            pageList: [10, 50, 100, 200, 500],
		    columns: [{
		        field: 'name',
		        title: '发送对象'
		    }, {
		        field: 'content',
		        title: '内容',
		        formatter:function(value, row, index){
		        	if(value.length > 70){
						content = '<div title="'+value+'">'+value.substring(0,70)+'<a href="javascript:void(0)">&nbsp;全部...</a></div>';
					}else{
						content = value;
					}
		        	return content;
		        }
		    },{
		    	field: 'fromeUser',
		        title: '发送人'
		    }, {
		    	field: 'createDate',
			    title: '时间'
		    }, {
		    	field: 'operate',
                title: '操作',
                align: 'left',
                formatter: operateFormatter
		    }]
		});
	}
	
	function operateFormatter(value, row, index) {
	    return '<button type="button" role="button" class="btn btn-danger btn-xs" aria-label="Left Align" onclick="delConfession(\''+row.id+'\');">删除</button>';
	}
	
	function delConfession(id){
		if('null' != id){
			layer.confirm('确认删除?', {icon: 3, title:'删除提示'}, function(index){
				$.post('del',{id:id},function(data){
					if(data.success){
						layer.msg('成功删除',{icon:1});
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