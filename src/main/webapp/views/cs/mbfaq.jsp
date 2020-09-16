<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
<title>2nd Project - Elements</title> 
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!-- VENDOR CSS -->
<link rel="stylesheet"
	href="/common/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/common/assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/common/assets/vendor/linearicons/style.css">
<link rel="stylesheet"
	href="/common/assets/vendor/chartist/css/chartist-custom.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="/common/assets/css/main.css">
<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
<link rel="stylesheet" href="/common/assets/css/demo.css">
<link rel="stylesheet" href="/common/assets/css/faq.css">
<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700"
	rel="stylesheet">
<!-- ICONS -->
<link rel="apple-touch-icon" sizes="76x76"
	href="/common/assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="/common/assets/img/favicon.png">
<!-- LOADING -->
<link rel="stylesheet" type="text/css" href="/common/assets/css/custom.css">
</head>

<body class="layout-fullwidth">
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top sub-navbar">
			<div class="main-brand">
				<ul>
					<li><a href="/common/home/openHome">HOME</a></li>
					<c:choose>
						<c:when test="${loginInfo.size()>0}">
							<li><a href="/common/member/logoutTry">LOGOUT</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="/common/member/openLogin">LOGIN</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${loginInfo.size()>0}">
							<li><a href="/common/member/mbOpenInfo">MYPAGE</a></li>
						</c:when>
					</c:choose>	
					<c:choose>
						<c:when test="${loginInfo.size()>0 }">
						</c:when>
						<c:otherwise>
							<li><a href="/common/member/mbOpenSignUp">JOIN</a></li>
						</c:otherwise>
					</c:choose>
					<li><a href="/common/search/openMapList">GYM INFO</a></li>
					<li><a href="/common/review/rvList">COMMUNITY</a></li>
					<c:choose>
						<c:when test="${loginInfo.size()>0}">
							<li><a href="/common/cp/mbOpenCpDown">COUPON</a></li>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${loginInfo.MB_LEVEL == 1}">
							<li><a href="/common/member/mbOpenSignUpAdd2">PAYMENT</a></li>
						</c:when>
					</c:choose>	
					<li><a href="/common/home/ntList">CS CENTER</a></li>
				</ul>
			</div>
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="/common/home/ntList" class=""><i class="lnr lnr-home"></i>
								<span><strong>공지사항</strong></span></a></li>
						<li><a href="/common/home/faqList" class=""><i class="lnr lnr-home"></i>
								<span><strong>FAQ</strong></span></a></li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-7 community_layout">
									<!-- 코드 넣는곳 -->
									<div class="community_index">
								<span><strong>FAQ</strong></span>
							</div>
									<table summary="FAQ">
										<colgroup>
											<col width="20%" />
											<col width="80%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">번호</th>
												<th scope="col">제목</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${fn:length(map.list) > 0}">
													<c:forEach items="${map.list }" var="row">
														<tr class="off" id="mFAQ_${row.FAQ_NUM }">
															<td>
															${row.FAQ_NUM }
															<input type="hidden" id="FAQ_NUM" name="FAQ_NUM" value="${row.FAQ_NUM }" />
															</td>
															<td class="title subject"><a
																href="javascript:fn_viewDetail(${row.FAQ_NUM })">
																	<span><strong>${row.FAQ_TITLE }</strong></span> </a>
															</td>
														</tr>
														<tr id="dFAQ_${row.FAQ_NUM }" style="display: none">
															<td colspan="2" style="white-space: pre-wrap;" class="answer">${row.FAQ_BODY }</td>
														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr>
														<td colspan="5">조회된 결과가 없습니다.</td>
													</tr>
												</c:otherwise>
											</c:choose>

										</tbody>
									</table>
									<div class="table_control">
									<div class="table_paging">
									<!-- 처음 페이지로 이동 : 현재 페이지가 1보다 크면 [처음]을 출력 -->
									<c:if test="${map.paging.curPage>1 }">
										<a href="javascript:fn_list_f_byMB('1')">[처음]</a>
									</c:if>
									<!-- 이전 페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]을 출력	 -->
									<c:if test="${map.paging.curBlock>1 }">
										<a href="javascript:fn_list_f_byMB('map.paging.prevPage')">[이전]</a>
									</c:if>
									<!-- 하나의 블럭에서 반복문 수행 시작페이부터 끝페이지까지 -->
									<c:forEach var="num" begin="${map.paging.blockBegin }"
										end="${map.paging.blockEnd }">
										<!-- 현재 페이지이면 하이퍼링크 제거 -->
										<c:choose>
											<c:when test="${num==map.paging.curPage }">
												<span style="color: #ff4e00">${num }</span>&nbsp; 
											</c:when>
											<c:otherwise>
												<a href="javascript:fn_list_f_byMB('${num }')">${num }</a>&nbsp;
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<!-- 다음 페이지 블록으로 이동 : 현재 페이지 블록이 전체 페이지 블럭보다 작거나 같으면 [다음]을 출력 -->
									<c:if test="${map.paging.curBlock<=map.paging.totalBlock }">
										<a href="javascript:fn_list_f_byMB('${map.paging.nextPage}')">[다음]</a>
									</c:if>
									<!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작으면 [끝]을 출력 -->
									<c:if test="${map.paging.curPage<map.paging.totalPage }">
										<a href="javascript:fn_list_f_byMB('${map.paging.totalPage }')">[끝]</a>
									</c:if>
									</div>
									<div class="table_search">
									<div class="search_category">
									<select name="searchType" id="searchType">
										<c:choose>
											<c:when test="${map.searchType == 'TITLE' }">
												<option value="TITLE" selected="selected">제목</option>
												<option value="NUM">글 번호</option>
												<option value="BODY">본문</option>
											</c:when>
											<c:when test="${map.searchType == 'BODY' }">
												<option value="TITLE">제목</option>
												<option value="NUM">글 번호</option>
												<option value="BODY" selected="selected">본문</option>
											</c:when>
											<c:when test="${map.searchType == 'NUM' }">
												<option value="TITLE">제목</option>
												<option value="NUM" selected="selected">글 번호</option>
												<option value="BODY">본문</option>
											</c:when>
										</c:choose>
									</select> 
									</div>
									<div class="search_input">
									<input type="text" name="searchWord" id="searchWord" value="${map.searchWord }"> 
									<a href="#this" class="btn search_btn" id="f_searchbyMB">검색</a>
									</div>
									
									</div>
									</div>
									<form id="commonForm" name="commonForm"></form>



						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
		<footer>
			<div class="container-fluid">
				<p class="copyright">
					&copy; 2019 <a href="#" target="_blank">Ezen. 1401</a>. All Rights
					Reserved.
				</p>
			</div>
		</footer>
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="/common/assets/vendor/jquery/jquery.min.js"></script>
	<script src="/common/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/common/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="/common/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="/common/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="/common/assets/scripts/klorofil-common.js"></script>
	<script src="/common/assets/js/admin.js"></script>
</body>

</html>
