/*회원가입*/
/*아이디 중복확인*/
var idck = 0;
$(document).ready(function(){ 
	$("#mb_id_check").on("click", function(e){ 
		e.preventDefault();
		fn_mbIDCheck();
	});
});

function fn_mbIDCheck(){
	var mb_id = $("#MB_ID").val();
	var mb_data = {"MB_ID":mb_id}
	
	
	if(mb_id.length<1)
	{
		alert("아이디를 입력해주시기 바랍니다.");
	}
	else
	{
		$.ajax({
			type: "POST",
			url: "/common/member/checkMbID",
			data: mb_data,
			dataType : "json",
			error : function(error){
				alert("서버가 응답하지 않습니다.\n다시 시도해주시기 바랍니다.");
			},
			success: function(result){
				if(result == 0)
				{
					$("#MB_ID").attr("disabled",false);
					alert("사용이 가능한 아이디입니다.");
					idck=1;
				} else if(result != 0)
				{
					alert("이미 존재하는 아이디입니다.\n다른 아이디를 사용해주세요.");
				}else
				{
					alert("에러가 발생하였습니다.");
				}
			}
	    });
	}
}

/*유효성체크*/
$(document).ready(function(){ 
	
	$("#MB_PHONE").on('keydown', function(e){
	  	// 숫자만 입력받기
	    var trans_num = $(this).val().replace(/-/gi,'');
			var k = e.keyCode;
					
			if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
			{
				e.preventDefault();
			}
	  }).on('blur', function(){
	  if($(this).val() == '') return;
					
	        var trans_num = $(this).val().replace(/-/gi,'');
	        if(trans_num != null && trans_num != '')
	        {
	            if(trans_num.length==11 || trans_num.length==10) 
	            {   
	                var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
	                if(regExp_ctn.test(trans_num))
	                {
	                    trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
	                    $(this).val(trans_num);
	                }
	                else
	                {
	                    alert("유효하지 않은 전화번호 입니다.");
	                    $(this).val("");
	                    $(this).focus();
	                }
	            }
	            else 
	            {
	                alert("유효하지 않은 전화번호 입니다.");
	                $(this).val("");
	                $(this).focus();
	            }
	        }
	        
	  });  
	$("#signUp").on("click", function(e){ 
		e.preventDefault();
		
		if(!$('#MB_ID').val())
		{
			alert("아이디를 입력해주세요");
			$('#MB_ID').focus();
			return false;
		}
		else if(!$('#MB_PW').val())
		{
			alert("비밀번호를 입력해주세요");
			$('#MB_PW').focus();
			return false;
		}
		else if(!$('#MB_PHONE').val())
		{
			alert("휴대전화번호를 입력해주세요");
			$('#MB_PHONE').focus();
	        return false;
		}
		
		fn_signUp1();
	});
});
		
function fn_signUp1()
{
	
	
	if(window.confirm("회원가입을 하시겠습니까?"))
	{
		if(idck==0)
		{
			alert("아이디 중복체크를 해주세요.")
			return false;
		}
		else
		{
			var comSubmit = new ComSubmit("frm"); 
			comSubmit.setUrl("/common/member/mbSignUp"); 
			comSubmit.submit();
		}
			
	}
}
	

$(document).ready(function(){ 
	$("#signUpPay1").on("click", function(e){ 
		e.preventDefault();
		fn_signUp2();
		
	});
});

function fn_signUp2()
{
	if(!$('#MB_ID').val())
	{
		alert("아이디를 입력해주세요");
		$('#MB_ID').focus();
		return false;
	}
	else if(!$('#MB_PW').val())
	{
		alert("비밀번호를 입력해주세요");
		$('#MB_PW').focus();
		return false;
	}
	else
	{
		if(window.confirm("회원가입을 하시겠습니까?"))
		{
			if(idck==0)
			{
				alert("아이디 중복체크를 해주세요.")
				return false;
			}
			else
			{
				
				var comSubmit = new ComSubmit("frm"); 
				comSubmit.setUrl("/common/member/mbOpenSignUpAdd");
				
				comSubmit.submit();
			}
			
		}
	}
	
}
$(document).ready(function(){ 
	$("#signUpPay2").on("click", function(e){ 
		e.preventDefault();
		fn_signUp3();
	});
});
function fn_signUp3()
{
	if(!$('#MB_NAME').val())
	{
		alert("이름을 입력해주세요");
		$('#MB_NAME').focus();
		return false;
	}
	else if(!$('#MB_AGE').val())
	{
		alert("나이를 입력해주세요");
		$('#MB_AGE').focus();
		return false;
	}
	else if(!$('#MB_HEIGHT').val())
	{
		alert("키를 입력해주세요");
		$('#MB_HEIGHT').focus();
		return false;
	}
	else if(!$('#MB_INITIAL').val())
	{
		alert("시작몸무게를 입력해주세요");
		$('#MB_INITIAL').focus();
		return false;
	}
	else if(!$('#MB_TARGET').val())
	{
		alert("목표몸무게를 입력해주세요");
		$('#MB_TARGET').focus();
		return false;
	}
	else if(!$('#PD_NAME').val())
	{
		alert("구입할 상품을 선택해주세요");
		$('#PD_NAME').focus();
		return false;
	}
	else if(!$('#MB_GENDER').val())
	{
		alert("성별을 선택해주세요");
		$('#MB_GENDER').focus();
		return false;
	}
	else if(!$('#MB_CH').val())
	{
		alert("가입경로를 선택해주세요");
		$('#MB_CH').focus();
		return false;
	}
	else
	{
		if(window.confirm("회원가입과 결제를 진행 하시겠습니까?"))
		{
			
			var comSubmit = new ComSubmit("frm"); 
			
			comSubmit.setUrl("/common/member/openpayment");
			comSubmit.submit();
			alert("정상적으로 회원가입이 되었습니다. 결제창으로 이동합니다.");
		}
	}
	
}

$(document).ready(function(){ 
	$("#signUpPay3").on("click", function(e){ 
		e.preventDefault();
		fn_signUp4();
	});
});
function fn_signUp4()
{
	if(!$('#MB_NAME').val())
	{
		alert("이름을 입력해주세요");
		$('#MB_NAME').focus();
		return false;
	}
	else if(!$('#MB_AGE').val())
	{
		alert("나이를 입력해주세요");
		$('#MB_AGE').focus();
		return false;
	}
	else if(!$('#MB_HEIGHT').val())
	{
		alert("키를 입력해주세요");
		$('#MB_HEIGHT').focus();
		return false;
	}
	else if(!$('#MB_INITIAL').val())
	{
		alert("시작몸무게를 입력해주세요");
		$('#MB_INITIAL').focus();
		return false;
	}
	else if(!$('#MB_TARGET').val())
	{
		alert("목표몸무게를 입력해주세요");
		$('#MB_TARGET').focus();
		return false;
	}
	else if(!$('#PD_NAME').val())
	{
		alert("구입할 상품을 선택해주세요");
		$('#PD_NAME').focus();
		return false;
	}
	else if(!$('#MB_GENDER').val())
	{
		alert("성별을 선택해주세요");
		$('#MB_GENDER').focus();
		return false;
	}
	else if(!$('#MB_CH').val())
	{
		alert("가입경로를 선택해주세요");
		$('#MB_CH').focus();
		return false;
	}
	else
	{
		if(window.confirm("회원가입과 결제를 진행 하시겠습니까?"))
		{
			
			var comSubmit = new ComSubmit("frm"); 
			
			comSubmit.setUrl("/common/member/openpayment2");
			comSubmit.submit();
			alert("정상적으로 회원가입이 되었습니다. 결제창으로 이동합니다.");
		}
	}
	
}

/*취소시*/
$(document).ready(function(){ 
	$("#cancle").on("click", function(e){ 
		e.preventDefault();
		fn_moveHome();
	});
});

function fn_moveHome()
{
	if(window.confirm("메인 화면으로 돌아가시겠습니까?"))
	{
		window.location.href="/common/home/openHome";
	}
}

/*로그인*/
$(document).ready(function(){ 
	$("#login").on("click", function(e){ 
		e.preventDefault();
		fn_login();
	});
	$("#gojoin").on("click", function(e){ 
		e.preventDefault();
		fn_gojoin();
	});
});

function fn_login()
{
	if(!$('#MB_ID').val())
	{
		alert("아이디를 입력해주세요");
		$('#MB_ID').focus();
		return false;
	}
	else if(!$('#MB_PW').val())
	{
		alert("비밀번호를 입력해주세요");
		$('#MB_PW').focus();
		return false;
	}
	else
	{
		var comSubmit = new ComSubmit("frm"); 
		comSubmit.setUrl("/common/member/loginTry"); 
		comSubmit.submit();
	}
}

function fn_gojoin()
{ 
	
	var comSubmit = new ComSubmit(); 
	comSubmit.setUrl("/common/member//mbOpenSignUp"); 
	comSubmit.submit();
	
}

/*회원탈퇴*/
function fn_bye()
{
	if(!$('#MB_PW').val())
	{
		alert("비밀번호를 입력해주세요");
		
		return false;
	}
	else
	{
		return true;
	}
}

/*리뷰게시판*/
/*리뷰 write*/
$(document).ready(function(){ 
	$("#list1").on("click", function(e){ 
		e.preventDefault(); 
		fn_openBoardList1(); 
	}); 
	
	$("#write2").on("click", function(e){ //작성하기 버튼 
		e.preventDefault();
		if(!$('#RV_TITLE').val()){
			alert("글제목을 입력해주세요");
			
	        return false;
		}
		
		if(!$('#RV_BODY').val()){
			alert("글내용을 입력해주세요");
			
	        return false;
		}
		
		fn_insertBoard(); 
	});
	

}); 
function fn_openBoardList1()
{ 
	
	var comSubmit = new ComSubmit(); 
	comSubmit.setUrl("/common/review/rvList")
	comSubmit.submit();
}

function fn_insertBoard()
{ 
	var comSubmit = new ComSubmit("frm"); 
	comSubmit.setUrl("/common/review/rvInsert"); 
	comSubmit.submit(); 
}

/*리뷰리스트에서*/
$(document).ready(function(){ 
	$("#write1").on("click", function(e){ //글쓰기 버튼 
		e.preventDefault();
		
		if($('#MB_LEVEL').val() == '3')
		{
			
			fn_openBoardWrite(); 
		}
		else if($('#MB_LEVEL').val() == '1'||$('#MB_LEVEL').val() == '2')
		{
			alert("구매한 프로그램을 수료한 회원만 리뷰작성이 가능합니다.");
			return false;
		}
		else
		{
			fn_openBoardWrite(); 
		}
	}); 
	
}); 
function fn_openBoardWrite()
{ 
	var comSubmit = new ComSubmit(); 
	
	comSubmit.setUrl("/common/review/rvOpenWrite"); 
	comSubmit.submit(); 
} 
function fn_openBoardDetail(num, curPage, searchType, searchWord)
{ 
	
	window.location.href="/common/review/rvOpenDetail?RV_NUM="+num+"&curPage="+curPage+"&searchType="+searchType+"&searchWord="+searchWord;
	
}
function fn_list(page)
{
	var searchType=$("#searchType option:selected").val();
	var searchWord=$("#searchWord").val();
	window.location.href="/common/review/rvList?curPage="+page+"&searchType="+searchType+"&searchWord="+searchWord;
}

$(document).ready(function(){ 
	$("#search").on("click", function(e){ 
		e.preventDefault(); 
		fn_searchList();
	});
});
function fn_searchList()
{
	var searchType = $("#searchType option:selected").val();
	var searchWord = $("#searchWord").val();
	
	//검색버튼을 클릭할 때 마다 1번째 페이지를 보여주기 위해 curPage의 값을 1로 고정한다.
	window.location.href="/common/review/rvList?curPage=1&searchType="+searchType+"&searchWord="+searchWord;
}


/*상세보기에서*/
$(document).ready(function(){ 
	$("#list2").on("click", function(e){ 
		e.preventDefault(); 
		fn_openBoardList2(); 
	}); 
	
	$("#update1").on("click", function(e){ 
		e.preventDefault(); 
		fn_openBoardUpdate(); 
	}); 
	$("#delete").on("click", function(e){ //삭제하기 버튼 
		e.preventDefault(); 
		fn_deleteBoard(); 
	}); 
}); 

function fn_openBoardList2()
{ 
	var curPage = document.getElementById("curPage");
	var page = curPage.getAttribute("value");
	var searchType = $("#searchType").val();
	var searchWord = $("#searchWord").val();
	window.location.href="/common/review/rvList?curPage="+page+"&searchType="+searchType+"&searchWord="+searchWord;
	
}

function fn_openBoardUpdate()
{ 
	
	var comSubmit = new ComSubmit(); 
	comSubmit.setUrl("/common/review/rvOpenUpdate"); 
	comSubmit.addParam("RV_NUM", $("#RV_NUM").val()); 
	comSubmit.submit(); 
}
function fn_deleteBoard()
{ 
	var comSubmit = new ComSubmit(); 
	comSubmit.setUrl("/common/review/rvDelete"); 
	comSubmit.addParam("RV_NUM", $("#RV_NUM").val()); 
	comSubmit.submit(); 
}

/*수정하기에서*/
$(document).ready(function(){ 
	$("#update2").on("click", function(e){ //저장하기 버튼 
		e.preventDefault();
		if(!$('#RV_TITLE').val()){
			alert("글제목을 입력해주세요");
			
	        return false;
		}
		
		if(!$('#RV_BODY').val()){
			alert("글내용을 입력해주세요");
			
	        return false;
		}
		
		
		fn_updateBoard(); 
	}); 
	
}); 

function fn_updateBoard()
{ 
	var comSubmit = new ComSubmit("frm"); 
	comSubmit.setUrl("/common/review/rvUpdate"); 
	comSubmit.submit(); 
} 

/*마이페이지*/
/*정보수정*/
$(document).ready(function(){ 
	
	
	$("#updateinfo").on("click", function(e){ 
		e.preventDefault(); 
		if(!$('#MB_PW').val())
		{
			alert("비밀번호를 입력해주세요");
			$('#MB_PW').focus();
			return false;
		}
		else if($('#MB_LEVEL').val()>1 )
		{
			if(!$('#MB_NAME').val())
			{
				alert("이름을 입력해주세요");
				$('#MB_NAME').focus();
				return false;
			}
		}
		else if(!$('#MB_PHONE').val())
		{
			alert("휴대전화번호를 입력해주세요");
			$('#MB_PHONE').focus();
	        return false;
		}
		fn_infoUpdate(); 
	}); 
	
	
});
function fn_infoUpdate()
{ 
	
	var comSubmit = new ComSubmit("frm"); 
	comSubmit.setUrl("/common/member/mbInfoUpdate"); 
	comSubmit.submit();
	
}



/*입력스크립트*/
function gfn_isNull(str) 
{ 
	if (str == null) return true; 
	if (str == "NaN") return true; 
	if (new String(str).valueOf() == "undefined") 
		return true; 
	
	var chkStr = new String(str); 
	if( chkStr.valueOf() == "undefined" ) 
		return true; 
	if (chkStr == null) 
		return true; 
	if (chkStr.toString().length == 0 ) 
		return true; return false; 
} 

function ComSubmit(opt_formId) 
{ 
	this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId; 
	this.url = ""; 
	
	if(this.formId == "commonForm")
	{ 
		$("#commonForm")[0].reset(); 
	} 
	
	this.setUrl = function setUrl(url){ 
		this.url = url; 
	}; 
	
	this.addParam = function addParam(key, value){ 
		$("#"+this.formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"' >")); 
	}; 
	
	this.submit = function submit(){ 
		var frm = $("#"+this.formId)[0]; 
		frm.action = this.url; 
		frm.method = "post"; 
		frm.submit(); 
	}; 
}

