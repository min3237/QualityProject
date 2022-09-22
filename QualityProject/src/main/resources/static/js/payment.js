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
		var name = $("#paymentname").val();
		if(name != null && name!= ""){
		var cardN1 = $("#card-number1").val();
		var cardN2 = $("#card-number2").val();
		var cardN3 = $("#card-number3").val();
		var cardN4 = $("#card-number4").val();
		if(cardN1.length!=4 || cardN2.length!=4 ||cardN3.length!=4 ||cardN4.length!=4){
			alert("카드번호를 잘못입력하였습니다. 다시입력해주세요");
		}else{
		var card = cardN1+"-"+cardN2+"-"+cardN3+"-"+cardN4;
		//1234-1234-1234-1234
		let data={
			name: $("#paymentname").val(), 
			bank: $("#bank").val(), 
			cardNum: card 
		};
		$.ajax({
			type:"POST",
			url:"/api/payment",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(resp){
			alert("결제수단등록이 완료되었습니다.");
			location.href="/paymentPage";
		}).fail(function(error){
			alert("카드번호가 중복되었습니다.");
		});
		}
	}else{
		alert("별칭을 입력해주세요");
	}},
	
	deleteById: function(){
		var id=$("#id").val();
		
		$.ajax({
			type:"DELETE",
			url:"/api/payment/"+id,
			dataType:"json"
		}).done(function(resp){
			alert("삭제가 완료되었습니다.");
			location.href="/paymentPage";
		}).fail(function(error){
			alert("에러");
		});
	},
	
	update: function(){
		var name = $("#paymentname").val();
		if(name != null && name!= ""){
		var id=$("#id").val();
		var cardN1 = $("#card-number1").val();
		var cardN2 = $("#card-number2").val();
		var cardN3 = $("#card-number3").val();
		var cardN4 = $("#card-number4").val();
		if(cardN1.length!=4 || cardN2.length!=4 ||cardN3.length!=4 ||cardN4.length!=4){
			alert("카드번호를 잘못입력하였습니다. 다시입력해주세요");
		}else{
		var card = cardN1+"-"+cardN2+"-"+cardN3+"-"+cardN4;
		let data={
			name: $("#paymentname").val(), 
			bank: $("#bank").val(), 
			cardNum: card 
		};
		$.ajax({
			type:"PUT",
			url:"/api/payment/"+id,
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(resp){
			alert("수정이 완료되었습니다.");
			location.href="/paymentPage";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	}}else{
		alert("별칭을 입력해주세요");
}}}
index.init();