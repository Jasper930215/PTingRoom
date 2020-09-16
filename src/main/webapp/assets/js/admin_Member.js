//View Member Information
function fn_admMemInfo(memCode)
{ 
	window.location.href="/common/admMB/memInfo?MB_CODE="+memCode;
}
//Member List Paging
function fn_admMemListPaging(page)
{
	var searchType=$("#searchType option:selected").val();
	var searchWord=$("#searchWord").val();
	var pathname = window.location.pathname; // 경로만 리턴
	window.location.href=pathname+"?curPage="+page+"&searchType="+searchType+"&searchWord="+searchWord;
}
//Member List Searching
$(document).ready(function(){ 
	$("#MemSearch").on("click", function(e){ 
		e.preventDefault(); 
		fn_MemSearchList();
	});
});
function fn_MemSearchList()
{
	var searchType = $("#searchType option:selected").val();
	var searchWord = $("#searchWord").val();
	
	//검색버튼을 클릭할 때 마다 1번째 페이지를 보여주기 위해 curPage의 값을 1로 고정한다.
	var pathname = window.location.pathname; // 경로만 리턴
	window.location.href=pathname+"?curPage=1&searchType="+searchType+"&searchWord="+searchWord;
}
//Reset Search Result
function fn_clearSearchLog()
{
	var pathname = window.location.pathname; // 경로만 리턴
	window.location.href=pathname;
}
//Update Member Status
$(document).ready(function(){ 
	$("#updateStatus").on("click", function(e){
		e.preventDefault();
		if(!$('#status').val()){
			alert("상태가 변경되지 않았습니다.");
	        return false;
		}
		fn_updateStatus(); 
	}); 
}); 

function fn_updateStatus()
{ 
	var comSubmit = new ComSubmit("statUpfrm"); 
	comSubmit.setUrl("/common/admMB/updateStatus"); 
	comSubmit.submit(); 
}
//Update Lowest Weight
$(document).ready(function(){ 
	$("#updateLowestWeight").on("click", function(e){ 
		e.preventDefault();
		if(!$('#loWei').val()){
			alert("상태가 변경되지 않았습니다.");
	        return false;
		}
		fn_updateLoWeight(); 
	}); 
}); 

function fn_updateLoWeight()
{ 
	var comSubmit = new ComSubmit("loWeiUpfrm");
	comSubmit.setUrl("/common/admMB/updateLoWei"); 
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