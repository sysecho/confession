// 加载flag
var loading = false;
// 最多可加载的条目
var maxItems = 0;

// 每次加载添加多少条目
var size = 5;
var page = 0;

function addItems(page, size) {
	$.post('listConfessions',{page:page,size:size},function(data){
		if(data.success == true){
			maxItems = data.total;
			var rows = data.rows;
			var html = '';
			$.each(rows,function(i,row,i){
				html += '<li class="card"><div class="card-header"><span class="icon icon-message">'+(row.name!=null&&row.name!=""?row.name:"这货写给全世界的吧")+'</span>'+
				'</div><div class="card-content"><div class="card-content-inner"><p>'+row.content+'</p></div></div>'+
				'<div class="card-footer">留言时间：'+row.createDate+'<span class="icon icon-me">'+(row.fromeUser!=null&&row.fromeUser!=""?row.fromeUser:"匿名留言")+
				' </div></li>';
			});
			// 添加新条目
			$('.infinite-scroll-bottom .list-container').append(html);
		}
		disabledRefesh((page+1)*size);
	});
}
//预先加载20条
$(function(){
	addItems(page, size);
});


// 注册'infinite'事件处理函数
$(document).on('infinite', '.infinite-scroll-bottom', function() {

	// 如果正在加载，则退出
	if (loading)
		return;

	// 设置flag
	loading = true;

	// 重置加载flag
	loading = false;
	// 添加新条目
	addItems(page, size);
	page++;
	//容器发生改变,如果是js滚动，需要刷新滚动
	$.refreshScroller();
});

function disabledRefesh(total){
	if (total >= maxItems) {
		$.toast("数据加载完毕！");
		// 加载完毕，则注销无限加载事件，以防不必要的加载
		$.detachInfiniteScroll($('.infinite-scroll'));
		// 删除加载提示符
		$('.infinite-scroll-preloader').remove();
		return;
	}
}
function aboutMe(){
	$.alert('这里湖科大微信表白墙匿名告白处，我们会将你的留言推送到公众平台上。');
}