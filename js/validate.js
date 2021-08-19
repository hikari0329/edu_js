$(document).ready(function () {
	$('form').validate({
		rules: {
			ID: {
				required: true
			},			
			TB_ID: {
				required: true
			},
			TB_PW: {
				required: true
			},
			ctl00$ContentPlaceHolder2$TB_ID: {
				required: true,
				//number: true,
				//maxlength: 4
			},
			ctl00$ContentPlaceHolder2$TB_NM: {
				required: true,
			},
			ctl00$ContentPlaceHolder2$TB_InPrice: {
				required: true,
				number: true,
			},
			ctl00$ContentPlaceHolder2$TB_ExPrice: {
				required: true,
				number: true,
			},
			ctl00$ContentPlaceHolder2$TB_Density: {
				required: true,
				number: true,
			}
		},
		messages: {
			ID: {
				required: '*不可為空',
				//number: '*請輸入4位數字序號',
				//maxlength: '*請輸入4位數字序號'                    
			},			
			TB_ID: {
				required: '*帳號不可為空',
				//number: '*請輸入4位數字序號',
				//maxlength: '*請輸入4位數字序號'                    
			},
			TB_PW: {
				required: '*密碼不可為空',
				//number: '*請輸入4位數字序號',
				//maxlength: '*請輸入4位數字序號'                    
			},
			ctl00$ContentPlaceHolder2$TB_ID: {
				required: '*不可為空',
				//number: '*請輸入4位數字序號',
				//maxlength: '*請輸入4位數字序號'                    
			},
			ctl00$ContentPlaceHolder2$TB_NM: {
				required: '*不可為空',
			},
			ctl00$ContentPlaceHolder2$TB_InPrice: {
				required: '*不可為空',
				number: '*應為數字',
			},
			ctl00$ContentPlaceHolder2$TB_ExPrice: {
				required: '*不可為空',
				number: '*應為數字',
			},
			ctl00$ContentPlaceHolder2$TB_Density: {
				required: '*不可為空',
				number: '*應為數字',
			},
		},
		ignore: ".query",
		submitHandler: function (form) {
			form.submit();
		},
		onfocusout: function (element) {
			this.element(element);
		}
		//errorPlacement: function (error, element) {
		//	element.attr("placeholder", error[0].outerText);
		//	element.attr("style", "border-color:red;color: red;");
		//}
	});
});