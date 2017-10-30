function submitForm(){
	var content = $("#content").val();
	var name = $("#name").val();
	if(!name){
		$.toast('亲，你要给谁表白呢(￣▽￣)~*？');
		return;
	}
	if(!content){
		$.toast('难道一句话都没有吗？~');
		return;
	}
	$.showPreloader('发送中......请稍等。');
	$.post("submit",{content:content,name:name,fromeUser:$("#fromeUser").val()},function(data){
		if(data.success == true){
			$.hidePreloader();
			 $.alert("亲留言成功啦，我们会帮你推送的哦~~，确定后将关闭窗口", function () {
				 window.close();
		     });
		}
	});
}