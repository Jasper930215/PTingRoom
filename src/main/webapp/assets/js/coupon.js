/*쿠폰발급(+30일 내 중복 발급 확인)*/
$(document).ready(function(){
	$("#btnGetCoupon").on("click", function(e){ //작성하기 버튼 
		e.preventDefault();
		fn_checkcp();
	});
});
function fn_checkcp() {
	var date = new Date();
	var year = new String(date.getFullYear());
	var month = new String(date.getMonth()+1);
	var day = new String(date.getDate());
	//한 자리 수 일 경우 0을 채워준다.
	if(month.length==1)
	{
		month="0"+month;
	}
	if(day.length==1)
	{
		day="0"+day;
	}

	date=year+"."+month+"."+day;

	var curdate = {"CUR" : date}

	$.ajax({
		type:"POST",
		url:"/common/cp/checkcp",
		data:curdate,
		dataType:"json",
		error : function(error) {
		alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
		},
		success : function(result) {
		if(result != 0) //이미 발급받음
		{
		alert("이미 발급받으셨습니다. \n이전 발급일로부터 30일 후에 다시 발급 받으실 수 있습니다.");
		}
		else if(result==0) //미발급
		{
		fn_getcp();
		alert("발급되었습니다.");
		}
		
		}
	});
}
function fn_getcp(){ 
	var comSubmit = new ComSubmit();
	comSubmit.addParam("MB_CODE", $("#MB_CODE").val());
	comSubmit.setUrl("/common/cp/cpget");
	comSubmit.submit(); 
}



function fn_list_c(page)
{
	
	window.location.href="/common/cp/cplistM?curPage="+page;
}

$(document).ready(function(){
	$(document).on("click", "#cprequest", function(e){ //작성하기 버튼 
		e.preventDefault();
		var CPN_CODE = $(this).attr("value");
		fn_requestcp(CPN_CODE);
		
	});
});

	function fn_requestcp(CPN_CODE)
	{ 
		var comSubmit = new ComSubmit();
		comSubmit.addParam("CPN_CODE", CPN_CODE);
		comSubmit.setUrl("/common/cp/cprequest");
		comSubmit.submit(); 
	}

/*function fn_requestcp(CPN_CODE)
{ 
	var comSubmit = new ComSubmit();
	comSubmit.addParam("CPN_CODE", CPN_CODE);
	comSubmit.setUrl("/common/cp/cprequest");
	comSubmit.submit(); 
}*/


function fn_list_c_a(page)
{
	var searchType=$("#searchType option:selected").val();
	var searchWord=$("#searchWord").val();
	window.location.href="/common/cp/cplistA?curPage="+page+"&searchType="+searchType+"&searchWord="+searchWord;
}
$(document).ready(function(){ 
	$("#c_search").on("click", function(e){ 
		e.preventDefault(); 
		fn_searchList_c();
	});
});
function fn_searchList_c()
{
	var searchType = $("#searchType option:selected").val();
	var searchWord = $("#searchWord").val();
	
	//검색버튼을 클릭할 때 마다 1번째 페이지를 보여주기 위해 curPage의 값을 1로 고정한다.
	window.location.href="/common/cp/cplistA?curPage=1&searchType="+searchType+"&searchWord="+searchWord;
}

$(document).ready(function(){
	$(document).on("click", "#cppermit", function(e){ //작성하기 버튼 
		e.preventDefault();
		var CPN_CODE = $(this).attr("value");
		fn_permitcp(CPN_CODE);
		
	});
});
function fn_permitcp(CPN_CODE){ 
	
	
	var comSubmit = new ComSubmit(); 
	comSubmit.addParam("CPN_CODE", CPN_CODE); 
	comSubmit.setUrl("/common/cp/cppermit"); 
	
	comSubmit.submit(); 
}
$(document).ready(function(){
	$(document).on("click", "#cpreject", function(e){ //작성하기 버튼 
		e.preventDefault();
		var CPN_CODE = $(this).attr("value");
		fn_rejectcp(CPN_CODE);
		
	});
});
function fn_rejectcp(CPN_CODE){ 
	
	
	var comSubmit = new ComSubmit(); 
	comSubmit.addParam("CPN_CODE", CPN_CODE); 
	comSubmit.setUrl("/common/cp/cpreject"); 
	
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