let index={
	init: function(){
		$("#btn-save").on("click",()=>{
			this.save();
		});
		$("#btn-delete").on("click",()=>{
			this.deleteById();
		});
		$("#btn-update").on("click",()=>{
			this.update();
		});
		
	},
	
	save: function(){
		let data={
			img: "image/"+$("#image").val().split("\\")[2],
			kind: $("input[name='kind']:checked").val(),
			price: $("#productPrice").val(),
			name: $("#productName").val(),
			account: $("#content").val()
		};
		$.ajax({
			type:"POST",
			url:"/api/item",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(resp){
			alert($("#productName").val() + "제품이 등록되었습니다.");
			location.href="/regiProduct";
		}).fail(function(error){
			alert("빈칸없이 입력해주세요");
		});
	},
	
	deleteById: function(){
		var id=$("#id").val();
		
		$.ajax({
			type:"DELETE",
			url:"/api/item/"+id,
			dataType:"json"
		}).done(function(resp){
			alert("삭제가 완료되었습니다.");
			location.href="/regiProduct";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	update: function(){
		var price = $("#productPrice").val();
		if(price!= null && price != ""){
		var id=$("#id").val();
		var img = $("#image1").val();
		let data = "";
		if(img == null || img == ""){
		data={
			kind: $("input[name='kind']:checked").val(),
			price: $("#productPrice").val(),
			name: $("#productName").val(),
			account: $("#content").val(),
			img: $("#image2").val()
		};
		}else{
		data={
			kind: $("input[name='kind']:checked").val(),
			price: $("#productPrice").val(),
			name: $("#productName").val(),
			account: $("#content").val(),
			img: "image/"+$("#image1").val().split("\\")[2]
		};
		}
		$.ajax({
			type:"PUT",
			url:"/api/item/"+id,
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(resp){
			alert("수정이 완료되었습니다.");
			location.href="/regiProduct";
		}).fail(function(error){
			alert("빈칸없이 입력해주세요");
		});
		}else{
			alert("가격을 입력해주세요.");
		}
	}
}
index.init();

$('.summernote').summernote({
	tabsize: 2,
	height: 200
});