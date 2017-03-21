function submitForm(){
	var content = $("#content").val();
	if(content){
		$.post("submit",{content:content,name:$("#name").val(),fromeUser:$("#fromeUser").val()},function(data){
			if(data.success == true){
				$.toast("留言成功啦，等带微信推送吧~~");
				window.location.href="list";
			}
		});
	}else{
		$.alert('哈哈~~~~~~内容不能为空哦~');
	}
}
