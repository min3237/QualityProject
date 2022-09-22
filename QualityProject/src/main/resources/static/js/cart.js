let index={
	init: function(){
		$("#btn-save").on("click",()=>{
			this.save();
		});
		$("#cartmove").on("click",()=>{
			this.cartmove();
		});
	},
	
	save: function(){
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){
		var id=$("#id").val();
		var name = $("#name").val();
		let data={
			1:1
		};
		$.ajax({
			type:"Post",
			url:"/api/cart/"+id,
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(resp){
			if(confirm(name+" 상품을 장바구니에 담았습니다.장바구니로 이동하시겠습니까?")){
			location.href="/cartPage";
			}else{
			location.href="/productDetail/"+id;	
			}
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	}},
	
	cartmove: function(){
		if(confirm("이미 담긴 상품입니다. 장바구니로 이동하시겠습니까?")){
			location.href="/cartPage";
		}
	},
}
index.init();