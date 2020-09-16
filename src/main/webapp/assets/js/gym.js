/*리스트에서*/
$(document).ready(function(){ 
	$("#search").on("click", function(e){ 
		e.preventDefault(); 
		fn_searchList();
	});
});
function fn_openBoardDetail(num, curPage, searchType, searchWord)
{ 
	
	window.location.href="/common/gym/gymOpenDetail?GY_NUM="+num+"&curPage="+curPage+"&searchType="+searchType+"&searchWord="+searchWord;
	
}
function fn_list(page)
{
	var searchType=$("#searchType option:selected").val();
	var searchWord=$("#searchWord").val();
	window.location.href="/common/gym/gymList?curPage="+page+"&searchType="+searchType+"&searchWord="+searchWord;
}
function fn_searchList()
{
	var searchType = $("#searchType option:selected").val();
	var searchWord = $("#searchWord").val();
	
	//검색버튼을 클릭할 때 마다 1번째 페이지를 보여주기 위해 curPage의 값을 1로 고정한다.
	window.location.href="/common/gym/gymList?curPage=1&searchType="+searchType+"&searchWord="+searchWord;
}
$(document).ready(function(){ 
	$("#writegym").on("click", function(e){ //글쓰기 버튼 
		e.preventDefault();
		if($('#ADM_ID').val() == 'admin')
		{
			
			fn_openBoardWrite(); 	
		}
		else
		{
			alert("관리자만 가맹점 등록이 가능합니다.");
		}
	}); 
	
}); 
function fn_openBoardWrite()
{ 
	var comSubmit = new ComSubmit(); 
	comSubmit.setUrl("/common/gym/gymOpenWrite"); 
	comSubmit.submit(); 
} 

/*글쓰기페이지에서*/
/*다음주소 api*/
function sample6_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(
						data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== ''
								&& /[동|로|가]$/g
										.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== ''
								&& data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName
									: data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraAddr !== '') {
							extraAddr = ' ('
									+ extraAddr
									+ ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						document
								.getElementById("GY_ADDR4").value = extraAddr;

					} else {
						document
								.getElementById("GY_ADDR4").value = '';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document
							.getElementById('GY_POST').value = data.zonecode;
					document
							.getElementById("GY_ADDR1").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document
							.getElementById(
									"GY_ADDR2")
							.focus();
				}
			}).open();
}




$(document).ready(function() {
	
	$("#list").on("click", function(e){ //목록으로 버튼 
		e.preventDefault(); 
		fn_openBoardList(); 
	}); 
	$("#write").on("click", function(e){ //작성하기 버튼 
		e.preventDefault(); 
		
		if(!$('#GY_NAME').val())
		{
			alert("	상호명을 입력해주세요");
			$('#GY_NAME').focus();
			return false;
		}
		else if(!$('#GY_PHONE').val())
		{
			alert("대표번호를 입력해주세요");
			$('#GY_PHONE').focus();
			return false;
		}
		else if(!$('#GY_NUM').val())
		{
			alert("사업자번호를 입력해주세요");
			$('#GY_NUM').focus();
	        return false;
		}
		else if(!$('#GY_POST').val())
		{
			alert("우편번호를 입력해주세요");
			$('#GY_POST').focus();
	        return false;
		}
		else if(!$('#GY_ADDR1').val())
		{
			alert("주소를 입력해주세요");
			$('#GY_ADDR1').focus();
	        return false;
		}
		else if(!$('#GY_ADDR2').val())
		{
			alert("상세주소를 입력해주세요");
			$('#GY_ADDR2').focus();
	        return false;
		}
		else if(!$('#GY_CNAME').val())
		{
			alert("코치 이름를 입력해주세요");
			$('#GY_CNAME').focus();
	        return false;
		}
		else if(!$('#GY_CNAME').val())
		{
			alert("코치 이름를 입력해주세요");
			$('#GY_CNAME').focus();
	        return false;
		}
		else if(!$('#GY_CINTRO').val())
		{
			alert("코치인사말을 입력해주세요");
			$('#GY_CINTRO').focus();
	        return false;
		}
		else if(!$('#file_1').val())
		{
			alert("사진을 모두 등록해주세요");
			$('#file_1').focus();
	        return false;
		}else if(!$('#file_2').val())
		{
			alert("사진을 모두 등록해주세요");
			$('#file_2').focus();
	        return false;
		}else if(!$('#file_3').val())
		{
			alert("사진을 모두 등록해주세요");
			$('#file_3').focus();
	        return false;
		}
		
		var bizID = $("#GY_NUM").val();
		checkBizID(bizID);
		
		
	}); 
	
	
})

function fn_openBoardList()
{ 
	var comSubmit = new ComSubmit(); 
	comSubmit.setUrl("/common/gym/gymList"); 
	comSubmit.submit(); 
}

function checkBizID(bizID) {
    // bizID는 숫자만 10자리로 해서 문자열로 넘긴다.
    var checkID = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5, 1);
    var tmpBizID, i, chkSum=0, c2, remander;
    var result;
     
    bizID = bizID.replace(/-/gi,'');
 
    for (i=0; i<=7; i++) {
        chkSum += checkID[i] * bizID.charAt(i);
    }
 
    c2 = "0" + (checkID[8] * bizID.charAt(8));
    c2 = c2.substring(c2.length - 2, c2.length);
    chkSum += Math.floor(c2.charAt(0)) + Math.floor(c2.charAt(1));
    remander = (10 - (chkSum % 10)) % 10 ;
 
    if (Math.floor(bizID.charAt(9)) == remander) {
        result = true ; // OK!
        fn_insertBoard();
         
    } else {
        alert("잘못된 사업자 번호입니다.")
    	result = false;
         
    }
   
    return result;
}




function fn_insertBoard() 
{
	var comSubmit = new ComSubmit("form");
	comSubmit.setUrl("/common/gym/gymWrite");
	comSubmit.submit();
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
	window.location.href="/common/gym/gymList?curPage="+page+"&searchType="+searchType+"&searchWord="+searchWord;
	
}
function fn_openBoardUpdate()
{ 
	
	var comSubmit = new ComSubmit(); 
	comSubmit.setUrl("/common/gym/gymOpenUpdate"); 
	comSubmit.addParam("GY_NUM", $("#GY_NUM").val()); 
	comSubmit.submit(); 
}
function fn_deleteBoard()
{ 
	var comSubmit = new ComSubmit(); 
	comSubmit.setUrl("/common/gym/gymDelete"); 
	comSubmit.addParam("GY_NUM", $("#GY_NUM").val()); 
	comSubmit.submit(); 
}

/*수정하기에서*/
$(document).ready(function(){ 
	
	$("#update2").on("click", function(e){ 
		e.preventDefault(); 
		fn_openBoardUpdate2(); 
	}); 
	
}); 
function fn_openBoardUpdate2()
{
	var comSubmit = new ComSubmit("form");
	comSubmit.setUrl("/common/gym/gymUpdate");
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