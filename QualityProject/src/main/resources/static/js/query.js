let index={
	init: function(){
		$("#btn-save").on("click",()=>{
			this.save();
		});
		$("#btn-update").on("click",()=>{
			this.update();
		});
		$("#btn-answer").on("click",()=>{
			this.answer();
		});
		
	},
	
	save: function(){
		var title = $("#title").val();
		var content = $("#content").val();
		if(title != null && title != ""){
		if(content != null && content != "<p><br></p>" && content != ""){
		let data={
			title: $("#title").val(),
			content: $("#content").val()
		};
		$.ajax({
			type:"POST",
			url:"/api/query",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(resp){
			alert("문의가 완료되었습니다.");
			location.href="/queryPage";
		}).fail(function(error){
			alert("빈칸없이 입력해주세요");
		});
		}else{
			alert("내용을 입력해주세요");
		}}else{
			alert("제목을 입력해주세요");
		}
	},
	
	answer: function(){
		var answer = $("#answer").val()
		if(answer != null && answer != ""){
		var id=$("#id").val();
		let data={
			answer: $("#answer").val()
		};
		$.ajax({
			type:"PUT",
			url:"/api/query2/"+id,
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(resp){
			alert("답변이 등록되었습니다.");
			location.href="/queryReply";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
		}else{
			alert("답변을 입력해 주세요");
		}
	},
	
	update: function(){
		var title = $("#title").val();
		var content = $("#content").val();
		if(title != null && title != ""){
		if(content != null && content != "<p><br></p>" && content != ""){
		var id=$("#id").val();
		let data={
			title: $("#title").val(),
			content: $("#content").val()
		};
		$.ajax({
			type:"PUT",
			url:"/api/query1/"+id,
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(resp){
			alert("수정이 완료되었습니다.");
			location.href="/queryPage";
		}).fail(function(error){
			alert("빈칸없이 입력해주세요");
		});
		}else{
			alert("내용을 입력해주세요");
		}}else{
			alert("제목을 입력해주세요");
		}
	}
}
index.init();


$('.summernote').summernote({
	tabsize:2,
	height:300
});