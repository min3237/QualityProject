let index5 = {
	init5: function() {
		$("#btn-purchase").on("click", () => {
			this.purchase();
		});
		$("#btn-deleteById").on("click", () => {
			this.deleteById();
		});
		$("#btn-deleteAll").on("click", () => {
			this.deleteAll();
		});
		$("#btn-update1").on("click", () => {
			this.update1();
		});
		$("#btn-update2").on("click", () => {
			this.update2();
		});
		$("#btn-update3").on("click", () => {
			this.update3();
		});

	},

	update1: function() {
		var id = $("#id").val();
		let data = {
			status: $("#btn-update1").val()
		};
		$.ajax({
			type: "PUT",
			url: "/api/order/" + id,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp) {
			alert("주문상태를 " + $("#btn-update1").val() + "로 변경했습니다.");
			location.href = "/orderCheck";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},

	update2: function() {
		var id = $("#id").val();
		let data = {
			status: $("#btn-update2").val()
		};
		$.ajax({
			type: "PUT",
			url: "/api/order/" + id,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp) {
			alert("주문상태를 " + $("#btn-update2").val() + "로 변경했습니다.");
			location.href = "/orderCheck";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},

	update3: function() {
		var id = $("#id").val();
		let data = {
			status: $("#btn-update3").val()
		};
		$.ajax({
			type: "PUT",
			url: "/api/order/" + id,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp) {
			alert("주문상태를 " + $("#btn-update3").val() + "로 변경했습니다.");
			location.href = "/orderCheck";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},

	purchase: function() {

		var payment = $("#payment").val()
		if (payment != null) {
			var itemId = $("input[name='buy']:checked");
			if (itemId[0] != undefined) {
				var itemIds = "";
				var quantitys = "";
				var check = 0;
				itemId.each(function(index) {
					let id = $(this).val();
					quantitys = $("#p_num" + id).val();
					if ($("#p_num" + id).val() == "" || $("#p_num" + id).val() == null || $("#p_num" + id).val() < 1) {
						check = 1;
					}
				});
				if (check != 1) {
					itemId.each(function(index) {
						if (itemIds == "") {
							itemIds = $(this).val();
							let id = $(this).val();
							quantitys = $("#p_num" + id).val();

						} else {
							itemIds += "," + $(this).val();
							let id = $(this).val();
							quantitys += "," + $("#p_num" + id).val();
						}
					});
					let data = {
						itemIds: itemIds,
						quantitys: quantitys,
						totalPrice: $("#sum_p_price").text(),
						payment: payment
					};
					$.ajax({
						type: "POST",
						url: "/api/order",
						data: JSON.stringify(data),
						contentType: "application/json; charset=utf-8",
						dataType: "json"
					}).done(function(resp) {
						alert("구매가 완료되었습니다.");
						location.href = "/orderPage";
					}).fail(function(error) {
						alert(JSON.stringify(error));
					});
				} else {
					alert("상품갯수를 다시 설정해주세요.");
				}
			} else {
				alert("상품을 선택해주세요.");
			}
		} else {
			alert("결제수단이 없습니다. 결제수단을 등록해주세요.");
			location.href = "/paymentPage";
		}
	},

	deleteById: function() {
		var itemId = $("input[name='buy']:checked");
		var itemIds = "";

		itemId.each(function(index) {
			if (itemIds == "") {
				itemIds = $(this).val();
			} else {
				itemIds += "," + $(this).val();
			}
		});
		let data = {
			itemIds: itemIds
		};
		$.ajax({
			type: "DELETE",
			url: "/api/cart/deleteById",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp) {
			alert("삭제가 완료되었습니다.");
			location.href = "/cartPage";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},

	deleteAll: function() {
		var itemId = $("input[name='buy']");
		var itemIds = "";

		itemId.each(function(index) {
			if (itemIds == "") {
				itemIds = $(this).val();
			} else {
				itemIds += "," + $(this).val();
			}
		});
		let data = {
			itemIds: itemIds
		};
		$.ajax({
			type: "DELETE",
			url: "/api/cart/deleteAll",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp) {
			alert("삭제가 완료되었습니다.");
			location.href = "/cartPage";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
}
index5.init5();


let basket = {
	totalCount: 0,
	totalPrice: 0,


	//재계산
	reCalc: function() {
		this.totalCount = 0;
		this.totalPrice = 0;
		document.querySelectorAll(".p_num").forEach(function(item) {
			if (item.parentElement.parentElement.parentElement.previousElementSibling.firstElementChild.firstElementChild.checked == true) {
				var count = parseInt(item.getAttribute('value')); //바뀐갯수
				this.totalCount += count;
				var price = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');
				this.totalPrice += count * price;
			}
		}, this); // forEach 2번째 파라메터로 객체를 넘겨서 this 가 객체리터럴을 가리키도록 함. - thisArg
	},
	//화면 업데이트
	updateUI: function() {
		document.querySelector('#sum_p_num').textContent = '상품갯수: ' + this.totalCount.formatNumber() + '개';
		document.querySelector('#sum_p_price').textContent = '합계금액: ' + this.totalPrice.formatNumber() + '원';
	},
	//개별 수량 변경
	changePNum: function(pos) {
		var item = document.querySelector('input[name=p_num' + pos + ']');
		var p_num = parseInt(item.getAttribute('value'));

		var newval = event.target.classList.contains('up') ? p_num + 1 : event.target.classList.contains('down') ? p_num - 1 : event.target.value;

		if (parseInt(newval) < 0 || parseInt(newval) > 99) {
			return false;
		}

		item.setAttribute('value', newval);
		item.value = newval;

		var price = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');
		item.parentElement.parentElement.nextElementSibling.textContent = (newval * price).formatNumber() + "원";
		//AJAX 업데이트 전송

		//전송 처리 결과가 성공이면    
		this.reCalc();
		this.updateUI();
	},
	checkItem: function() {
		this.reCalc();
		this.updateUI();
	},
	delItem: function() {
		event.target.parentElement.parentElement.parentElement.remove();
		this.reCalc();
		this.updateUI();
	},

	checkAll: function() {
		if ($("#th_checkAll").is(':checked')) {
			$("input[name=buy]").prop("checked", true);
			this.reCalc();
			this.updateUI();
		} else {
			$("input[name=buy]").prop("checked", false);
			this.reCalc();
			this.updateUI();
		}
	}
}

// 숫자 3자리 콤마찍기
Number.prototype.formatNumber = function() {
	if (this == 0) return 0;
	let regex = /(^[+-]?\d+)(\d{3})/;
	let nstr = (this + '');
	while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
	return nstr;
};
