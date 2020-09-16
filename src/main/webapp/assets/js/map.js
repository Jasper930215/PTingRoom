/*리스트에서*/
function fn_openMapDetail(num, curPage, searchWord)
{ 
	
	window.location.href="/common/search/openMapDetail?GY_NUM="+num+"&curPage="+curPage+"&searchWord="+searchWord;
	
}

$(document).ready(function(){ 
	$("#search").on("click", function(e){ 
		e.preventDefault(); 
		fn_searchList();
	});
});

function fn_searchList()
{
	var searchWord = $("#searchWord").val();
	
	//검색버튼을 클릭할 때 마다 1번째 페이지를 보여주기 위해 curPage의 값을 1로 고정한다.
	window.location.href="/common/search/openMapList?curPage=1&searchWord="+searchWord;
}
function fn_list(page)
{
	var searchWord=$("#searchWord").val();
	window.location.href="/common/search/openMapList?curPage="+page+"&searchWord="+searchWord;
}

/*디테일에서*/
$(document).ready(function(){ 
	$("#list2").on("click", function(e){ 
		e.preventDefault(); 
		fn_openGymList2(); 
	}); 
	
});

function fn_openGymList2()
{ 
	var curPage = document.getElementById("curPage");
	var page = curPage.getAttribute("value");
	var searchWord = $("#searchWord").val();
	
	window.location.href="/common/search/openMapList?curPage="+page+"&searchWord="+searchWord;
	
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