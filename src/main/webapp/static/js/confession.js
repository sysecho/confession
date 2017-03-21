function submitForm(){
	var content = $("#content").val();
	if(content){
		$.post("submit",{content:content,name:$("#name").val(),fromeUser:$("#fromeUser").val()},function(data){
			if(data.success == true){
				$.alert("留言成功啦，等带微信推送吧~~");
			}
		});
	}else{
		$.alert('难道一句话都没有吗？~');
	}
}