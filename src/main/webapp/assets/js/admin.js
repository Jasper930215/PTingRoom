/*공지사항*/
/*공지사항리스트에서*/
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
	window.location.href="/common/admNT/ntList?curPage=1&searchType="+searchType+"&searchWord="+searchWord;
}
$(document).ready(function(){ 
	$("#searchbyMB").on("click", function(e){ 
		e.preventDefault(); 
		fn_searchListbyMB();
	});
});
function fn_searchListbyMB()
{
	var searchType = $("#searchType option:selected").val();
	var searchWord = $("#searchWord").val();
	
	//검색버튼을 클릭할 때 마다 1번째 페이지를 보여주기 위해 curPage의 값을 1로 고정한다.
	window.location.href="/common/home/ntList?curPage=1&searchType="+searchType+"&searchWord="+searchWord;
}
$(document).ready(function(){ 
	$("#write1").on("click", function(e){ //글쓰기 버튼 
		e.preventDefault();
		if($('#ADM_ID').val() == 'admin')
		{
			
			fn_openBoardWrite(); 
		}
		else
		{
			alert("관리자만 공지사항 작성이 가능합니다.");
		}
	}); 
	
}); 
function fn_openBoardWrite()
{ 
	var comSubmit = new ComSubmit(); 
	comSubmit.setUrl("/common/admNT/ntOpenWrite"); 
	comSubmit.submit(); 
} 

function fn_openBoardDetail(num, curPage, searchType, searchWord)
{ 
	
	window.location.href="/common/admNT/ntOpenDetail?NT_NUM="+num+"&curPage="+curPage+"&searchType="+searchType+"&searchWord="+searchWord;
	
}
function fn_openBoardDetailbyMB(num, curPage, searchType, searchWord)
{ 
	
	window.location.href="/common/home/ntOpenDetail?NT_NUM="+num+"&curPage="+curPage+"&searchType="+searchType+"&searchWord="+searchWord;
	
}
function fn_list(page)
{
	var searchType=$("#searchType option:selected").val();
	var searchWord=$("#searchWord").val();
	window.location.href="/common/admNT/ntList?curPage="+page+"&searchType="+searchType+"&searchWord="+searchWord;
}
function fn_listbyMB(page)
{
	var searchType=$("#searchType option:selected").val();
	var searchWord=$("#searchWord").val();
	window.location.href="/common/home/ntList?curPage="+page+"&searchType="+searchType+"&searchWord="+searchWord;
}



/*공지사항 상세보기에서*/
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
	window.location.href="/common/admNT/ntList?curPage="+page+"&searchType="+searchType+"&searchWord="+searchWord;
	
}
function fn_openBoardUpdate()
{ 
	
	var comSubmit = new ComSubmit(); 
	comSubmit.setUrl("/common/admNT/ntOpenUpdate"); 
	comSubmit.addParam("NT_NUM", $("#NT_NUM").val()); 
	comSubmit.submit(); 
}
function fn_deleteBoard()
{ 
	var comSubmit = new ComSubmit(); 
	comSubmit.setUrl("/common/admNT/ntDelete"); 
	comSubmit.addParam("NT_NUM", $("#NT_NUM").val()); 
	comSubmit.submit(); 
}

$(document).ready(function(){ 
	$("#list2byMB").on("click", function(e){ 
		e.preventDefault(); 
		fn_openBoardList2byMB(); 
	}); 
});
function fn_openBoardList2byMB()
{ 
	var curPage = document.getElementById("curPage");
	var page = curPage.getAttribute("value");
	var searchType = $("#searchType").val();
	var searchWord = $("#searchWord").val();
	window.location.href="/common/home/ntList?curPage="+page+"&searchType="+searchType+"&searchWord="+searchWord;
	
}

/*공지사항 쓰기에서*/
$(document).ready(function(){ 
	$("#list1").on("click", function(e){ 
		e.preventDefault(); 
		fn_openBoardList1(); 
	}); 
	
	$("#write2").on("click", function(e){ //작성하기 버튼 
		e.preventDefault();
		if(!$('#NT_TITLE').val()){
			alert("글제목을 입력해주세요");
			
	        return false;
		}
		
		if(!$('#NT_BODY').val()){
			alert("글내용을 입력해주세요");
			
	        return false;
		}
		
		fn_insertBoard(); 
	});
	

}); 
function fn_openBoardList1()
{ 
	
	var comSubmit = new ComSubmit(); 
	comSubmit.setUrl("/common/admNT/ntList")
	comSubmit.submit();
}

function fn_insertBoard()
{ 
	var comSubmit = new ComSubmit("frm"); 
	comSubmit.setUrl("/common/admNT/ntInsert"); 
	comSubmit.submit(); 
}

/*공지사항 수정하기에서*/
$(document).ready(function(){ 
	$("#update2").on("click", function(e){ //저장하기 버튼 
		e.preventDefault();
		if(!$('#NT_TITLE').val()){
			alert("글제목을 입력해주세요");
			
	        return false;
		}
		
		if(!$('#NT_BODY').val()){
			alert("글내용을 입력해주세요");
			
	        return false;
		}
		
		
		fn_updateBoard(); 
	}); 
	
}); 

function fn_updateBoard()
{ 
	var comSubmit = new ComSubmit("frm"); 
	comSubmit.setUrl("/common/admNT/ntUpdate"); 
	comSubmit.submit(); 
} 

/*관리자로그인시*/
/*function fn_logincheck()
{
	if(!$('#ADM_ID').val())
	{
		alert("아이디를 입력해주세요");
		
		return false;
	}
	else if(!$('#ADM_PW').val())
	{
		alert("비밀번호를 입력해주세요");
		
		return false;
	}
	else
	{
		return true;
	}
}*/

/*관리자비밀번호변경시*/
function fn_changepw()
{
	if(!$('#ADM_PW2').val())
	{
		alert("비밀번호를 입력해주세요");
		
		return false;
	}
	else
	{
		return true;
	}
}


/*FAQ*/
/*FAQ리스트에서*/
/*드롭다운기능*/
function fn_viewDetail(FAQ_NUM) {
    if ($("#dFAQ_" + FAQ_NUM).css("display") == "none") 
    {
        $('[id^="mFAQ_"]').attr("class", "off");
        $('[id^="dFAQ_"]').css("display", "none");

        $("#mFAQ_" + FAQ_NUM).attr("class", "on");
        $("#dFAQ_" + FAQ_NUM).css("display", "");

    }
    else {
        $("#mFAQ_" + FAQ_NUM).attr("class", "off");
        $("#dFAQ_" + FAQ_NUM).css("display", "none");
    }
}

$(document).ready(function(){ 
	$("#f_search").on("click", function(e){ 
		e.preventDefault(); 
		fn_searchList_f();
	});
});
function fn_searchList_f()
{
	var searchType = $("#searchType option:selected").val();
	var searchWord = $("#searchWord").val();
	
	//검색버튼을 클릭할 때 마다 1번째 페이지를 보여주기 위해 curPage의 값을 1로 고정한다.
	window.location.href="/common/admFAQ/faqList?curPage=1&searchType="+searchType+"&searchWord="+searchWord;
}
function fn_list_f(page)
{
	var searchType=$("#searchType option:selected").val();
	var searchWord=$("#searchWord").val();
	window.location.href="/common/admFAQ/faqList?curPage="+page+"&searchType="+searchType+"&searchWord="+searchWord;
}
function fn_list_f_byMB(page)
{
	var searchType=$("#searchType option:selected").val();
	var searchWord=$("#searchWord").val();
	window.location.href="/common/home/faqList?curPage="+page+"&searchType="+searchType+"&searchWord="+searchWord;
}
$(document).ready(function(){ 
	$("#f_write1").on("click", function(e){ //글쓰기 버튼 
		e.preventDefault();
		if($('#ADM_ID').val() == 'admin')
		{
			
			fn_openBoardWrite_f(); 
		}
		else
		{
			alert("관리자만 공지사항 작성이 가능합니다.");
		}
	}); 
	
}); 
function fn_openBoardWrite_f()
{ 
	var comSubmit = new ComSubmit(); 
	comSubmit.setUrl("/common/admFAQ/faqOpenWrite"); 
	comSubmit.submit(); 
} 


function fn_openBoardUpdate_f(FAQ_NUM)
{ 
	
	var comSubmit = new ComSubmit(); 
	comSubmit.setUrl("/common/admFAQ/faqOpenUpdate"); 
	comSubmit.addParam("FAQ_NUM",FAQ_NUM); 
	comSubmit.submit(); 
}
function fn_deleteBoard_f(FAQ_NUM)
{ 
	var comSubmit = new ComSubmit(); 
	comSubmit.setUrl("/common/admFAQ/faqDelete"); 
	comSubmit.addParam("FAQ_NUM", FAQ_NUM); 
	comSubmit.submit(); 
}

$(document).ready(function(){ 
	$("#f_searchbyMB").on("click", function(e){ 
		e.preventDefault(); 
		fn_searchList_f_byMB();
	});
});
function fn_searchList_f_byMB()
{
	var searchType = $("#searchType option:selected").val();
	var searchWord = $("#searchWord").val();
	
	//검색버튼을 클릭할 때 마다 1번째 페이지를 보여주기 위해 curPage의 값을 1로 고정한다.
	window.location.href="/common/home/faqList?curPage=1&searchType="+searchType+"&searchWord="+searchWord;
}

/*FAQ쓰기에서*/
$(document).ready(function(){ 
	$("#f_list1").on("click", function(e){ 
		e.preventDefault(); 
		fn_openBoardList1_f(); 
	}); 
	
	$("#f_write2").on("click", function(e){ //작성하기 버튼 
		e.preventDefault();
		if(!$('#FAQ_TITLE').val()){
			alert("글제목을 입력해주세요");
			
	        return false;
		}
		
		if(!$('#FAQ_BODY').val()){
			alert("글내용을 입력해주세요");
			
	        return false;
		}
		
		fn_insertBoard_f(); 
	});
	

}); 
function fn_openBoardList1_f()
{ 
	
	var comSubmit = new ComSubmit(); 
	comSubmit.setUrl("/common/admFAQ/faqList")
	comSubmit.submit();
}

function fn_insertBoard_f()
{ 
	var comSubmit = new ComSubmit("frm"); 
	comSubmit.setUrl("/common/admFAQ/faqInsert"); 
	comSubmit.submit(); 
}

/*FAQ 수정하기에서*/
$(document).ready(function(){ 
	$("#f_update2").on("click", function(e){ //저장하기 버튼 
		e.preventDefault();
		if(!$('#FAQ_TITLE').val()){
			alert("글제목을 입력해주세요");
			
	        return false;
		}
		
		if(!$('#FAQ_BODY').val()){
			alert("글내용을 입력해주세요");
			
	        return false;
		}
		
		
		fn_updateBoard_f(); 
	}); 
	
}); 

function fn_updateBoard_f()
{ 
	var comSubmit = new ComSubmit("frm"); 
	comSubmit.setUrl("/common/admFAQ/faqUpdate"); 
	comSubmit.submit(); 
} 



/*상품페이지에서*/
function fn_list_pd(page)
{
	var searchType=$("#searchType option:selected").val();
	var searchWord=$("#searchWord").val();
	window.location.href="/common/adm/pdList?curPage="+page+"&searchType="+searchType+"&searchWord="+searchWord;
}
$(document).ready(function(){ 
	$("#pd_search").on("click", function(e){ 
		e.preventDefault(); 
		fn_searchList_pd();
	});
});
function fn_searchList_pd()
{
	var searchType = $("#searchType option:selected").val();
	var searchWord = $("#searchWord").val();
	
	//검색버튼을 클릭할 때 마다 1번째 페이지를 보여주기 위해 curPage의 값을 1로 고정한다.
	window.location.href="/common/adm/pdList?curPage=1&searchType="+searchType+"&searchWord="+searchWord;
}
$(document).ready(function(){
	$(document).on("click", "#pddelete", function(e){ //작성하기 버튼 
		e.preventDefault();
		var PD_NAME = $(this).attr("value");
		fn_deletepd(PD_NAME);
		
	});	
});
function fn_deletepd(PD_NAME){ 
	
	
	var comSubmit = new ComSubmit(); 
	comSubmit.addParam("PD_NAME", PD_NAME); 
	comSubmit.setUrl("/common/adm/pdDelete"); 
	
	comSubmit.submit(); 
}

$(document).ready(function(){ 
	$("#pdadd").on("click", function(e){ //글쓰기 버튼 
		e.preventDefault();
		
			fn_openPdWrite(); 
		
	}); 
	
}); 
function fn_openPdWrite()
{ 
	var comSubmit = new ComSubmit(); 
	comSubmit.setUrl("/common/adm/pdOpenWrite"); 
	comSubmit.submit(); 
} 

function fn_openPdUpdate(name, curPage, searchType, searchWord)
{ 
	
	window.location.href="/common/adm/pdOpenUpdate?PD_NAME="+name+"&curPage="+curPage+"&searchType="+searchType+"&searchWord="+searchWord;
	
}

$(document).ready(function(){ 
	$("#listpd").on("click", function(e){ 
		e.preventDefault(); 
		fn_openPdList1(); 
	}); 
	
	$("#writepd").on("click", function(e){ //작성하기 버튼 
		e.preventDefault();
		if(!$('#PD_NAME').val()){
			alert("상품명을 입력해주세요");
			
	        return false;
		}
		
		if(!$('#PD_PRICE').val()){
			alert("상품가격을 입력해주세요");
			
	        return false;
		}
		
		if(!$('#PD_BODY').val()){
			alert("상품설명을 입력해주세요");
			
	        return false;
		}
		
		fn_insertPd(); 
	});
	

}); 
function fn_openPdList1()
{ 
	
	var comSubmit = new ComSubmit(); 
	comSubmit.setUrl("/common/adm/pdList")
	comSubmit.submit();
}

function fn_insertPd()
{ 
	var comSubmit = new ComSubmit("frm"); 
	comSubmit.setUrl("/common/adm/pdInsert"); 
	comSubmit.submit(); 
}

$(document).ready(function(){ 
	$("#listpd2").on("click", function(e){ 
		e.preventDefault(); 
		fn_openPdList2(); 
	}); 
	
	$("#updatepd").on("click", function(e){ 
		e.preventDefault(); 
		
		if(!$('#PD_PRICE').val()){
			alert("상품가격을 입력해주세요");
			
	        return false;
		}
		
		if(!$('#PD_BODY').val()){
			alert("상품설명을 입력해주세요");
			
	        return false;
		}
		fn_updatePd(); 
	}); 
	
}); 
function fn_openPdList2()
{ 
	var curPage = document.getElementById("curPage");
	var page = curPage.getAttribute("value");
	var searchType = $("#searchType").val();
	var searchWord = $("#searchWord").val();
	window.location.href="/common/adm/pdList?curPage="+page+"&searchType="+searchType+"&searchWord="+searchWord;
	
}


function fn_updatePd()
{ 
	var comSubmit = new ComSubmit("frm"); 
	comSubmit.setUrl("/common/adm/pdUpdate"); 
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