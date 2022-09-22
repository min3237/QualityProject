let index={
	init4: function(){
		$("#btn-save").on("click",()=>{
			this.save();
		});
		$("#btn-update").on("click",()=>{
			this.update();
		});
		$("#btn-delete").on("click",()=>{
			this.delete();
		});
		$("#btn-idSearch").on("click",()=>{
			this.idSearch();
		});
		$("#btn-pwdSearch").on("click",()=>{
			this.pwdSearch();
		});
	},
	
	idSearch: function(){
		let data={
			name: $("#name").val(),
			email: $("#email").val(),
			phone: $("#phone").val()
		};
		$.ajax({
			type:"POST",
			url:"/auth/idSearch",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(resp){
			if(resp.data == "0"){
				alert("아이디를 찾을수 없습니다.");
			}else{
				alert("아이디는 "+resp.data+" 입니다.");
				location.href="/auth/loginForm/"+resp.stauts;//찾은아이디 달아주기
			}
		}).fail(function(error){
				alert(error.data);
		});
		
	},
	
	pwdSearch: function(){
		var pwd = $("#pwd").val();
		var pwdc = $("#pwd_check").val();
		var username = $("#username").val();
		var name = $("#name").val();
		var email = $("#email").val();
		var phone = $("#phone").val();
		if(username != null && username != ""){
		if(name != null && name != ""){
		if(email != null && email != ""){
		if(phone != null && phone != ""){
		if(pwd != ""){
		if(pwd == pwdc){
		let data={
			username: $("#username").val(),
			name: $("#name").val(),
			email: $("#email").val(),
			phone: $("#phone").val(),
			password: pwd
		};
		$.ajax({
			type:"POST",
			url:"/auth/pwdSearch",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(resp){
				if(resp.data == "없는 아이디 입니다."){
					alert(resp.data);
					}else{
				alert(resp.data);
				if(resp.stauts != 0){
				location.href="/auth/loginForm/"+resp.stauts;
				}
				}
		}).fail(function(error){
				alert(error.data);
		});
		}else{
			alert("비밀번호가 다릅니다.");
		}
		}else {
			alert("변경할 비밀번호를 입력해주세요");
		}
		}else{
			alert("전화번호를 입력해주세요");
		}
		}else{
			alert("이메일를 입력해주세요");
		}
		}else{
			alert("이름를 입력해주세요");
		}
		}else{
			alert("아이디를 입력해주세요");
		}
	},
	
	save: function(){
		var name =$("#username").val();
		var email =$("#email").val();
		var address1 =$("#sample6_address").val();
		var address2 =$("#sample6_extraAddress").val();
		var address3 =$("#sample6_detailAddress").val();
		var username =$("#userid").val();
		var phone =$("#phone").val();
		var pwd = $("#pwd").val();
		var pwdc = $("#pwd_check").val();
		if(username != ""){
		if(pwd != "" && pwdc != ""){	
		if(name != ""){
		if(email != ""){
		if(address1 != ""){
		if(address2 != ""){
		if(address3 != ""){
		if(phone != ""){
		if(pwd == pwdc){
		let data={
			name: name,
			password: pwd,
			email: email,
			address: address1+address2+address3,
			username: username,
			phone: phone
		};
		$.ajax({
			type:"POST",
			url:"/auth/joinProc",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(resp){
				alert("회원가입이 완료되었습니다.");
				location.href="/auth/loginForm";
		}).fail(function(error){
			alert("아이디 또는 전화번호가 중복되었습니다.");
		});
		}else {
			alert("비밀번호가 일치하지 않습니다.");
		}
		}else{
			alert("전화번호를 입력해주세요");
		}
		}else{
			alert("주소를 입력해주세요");
		}
		}else{
			alert("주소를 입력해주세요");
		}
		}else{
			alert("주소를 입력해주세요");
		}
		}else{
			alert("이메일을 입력해주세요");
		}
		}else{
			alert("이름을 입력해주세요");
		}
		}else{
			alert("비밀번호를 입력해주세요");
		}
		}else{
			alert("아이디를 입력해주세요");
		}
	},
	
	update: function(){
		var name =$("#username").val();
		var email =$("#email").val();
		var address1 =$("#sample6_address").val();
		var address2 =$("#sample6_extraAddress").val();
		var address3 =$("#sample6_detailAddress").val();
		var username =$("#userid").val();
		var phone =$("#phone").val();
		var pwd = $("#pwd").val();
		var pwdc = $("#pwd_check").val();
		if(username != ""){
		if(pwd != "" && pwdc != ""){	
		if(name != ""){
		if(email != ""){
		if(address1 != ""){
		if(address2 != ""){
		if(address3 != ""){
		if(phone != ""){
		if(pwd == pwdc){
		let data={
			id: $("#id").val(),
			name: name,
			password: pwd,
			email: email,
			address: address1+address2+address3,
			username: username,
			phone: phone
		};
		$.ajax({
			type:"PUT",
			url:"/user",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(resp){
			alert("회원수정이 완료되었습니다.");
			alert("다시 로그인 해주세요.");
			location.href="/logout";
		}).fail(function(error){
			alert("회원수정에 실패했습니다.");
		});
		}else {
			alert("비밀번호가 일치하지 않습니다.");
		}
		}else{
			alert("전화번호를 입력해주세요");
		}
		}else{
			alert("주소를 입력해주세요");
		}
		}else{
			alert("주소를 입력해주세요");
		}
		}else{
			alert("주소를 입력해주세요");
		}
		}else{
			alert("이메일을 입력해주세요");
		}
		}else{
			alert("이름을 입력해주세요");
		}
		}else{
			alert("비밀번호를 입력해주세요");
		}
		}else{
			alert("아이디를 입력해주세요");
		}
	},
	
	delete: function(){
		if(confirm("정말 회원을 탈퇴 하시겠습니까?")){
		var id=$("#id").val();
		$.ajax({
			type:"DELETE",
			url:"user/"+id,
			dataType:"json"
		}).done(function(resp){ 
			alert("회원탈퇴가 완료되었습니다.");
			location.href="/logout";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	}}
}
index.init4();


function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = '';
                var extraAddr = '';

                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = ' ';
                }
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open()
    }
