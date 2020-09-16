<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<link rel="stylesheet"
	href="/common/assets/vendor/linearicons/style.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="/common/assets/css/main.css">
<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
<link rel="stylesheet" href="/common/assets/css/demo.css">
<link rel="stylesheet" href="/common/assets/css/boarddetail.css">
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
<link rel="stylesheet" type="text/css"
	href="/common/assets/css/custom.css">
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

		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-8 community_layout">
							<div class="community_index">
								<span><strong>리뷰게시판</strong></span>
							</div>


							<!-- 코드 넣는곳 -->
							<form id="frm">
								<table >
									<caption>리뷰 상세보기</caption>
									<colgroup>
										<col width="10%">
										<col width="23%">
										<col width="10%">
										<col width="23%">
										<col width="10%">
										<col width="24%">
									</colgroup>
									<thead>
										<tr>
											<th scope="row">글번호</th>
											<td colspan="2">${RVMAP.RV_NUM }<input type="hidden"
												id="RV_NUM" name="RV_NUM" value="${RVMAP.RV_NUM }">
											</td>
											<th scope="row">조회수</th>
											<td colspan="2" class="detail_right">${RVMAP.RV_HIT }</td>
										</tr>
										<tr>
											<th scope="row">작성자</th>
											<td colspan="2">${RVMAP.MB_ID }<%-- <input type="hidden" id="MB_CODE" value="${RVMAP.MB_CODE }"> --%>
											</td>
											<th scope="row">작성일</th>
											<td colspan="2" class="detail_right">${RVMAP.RV_DATE }</td>
										</tr>
										<tr>
											<th scope="row">제목</th>
											<td colspan="5" class="detail_right detail_left" >${RVMAP.RV_TITLE }</td>
											<input type="hidden" id="curPage" value="${RVMAP.curPage}" />
											<input type="hidden" id="searchType"
												value="${RVMAP.searchType}" />
											<input type="hidden" id="searchWord"
												value="${RVMAP.searchWord}" />
										</tr>
										<tr>
											<th scope="row">구매상품</th>
											<td colspan="5" class="detail_right detail_left" >${MBMAP.PD_NAME }</td>
										</tr>
										<tr>
											<th scope="row">시작체중</th>
											<td>${MBMAP.MB_INITIAL }</td>
											<th scope="row">목표체중</th>
											<td>${MBMAP.MB_TARGET }</td>
											<th scope="row">최저체중</th>
											<td class="detail_right">${MBMAP.MB_LOWEST }</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="6" style="white-space: pre-wrap;">${RVMAP.RV_BODY }</td>
										</tr>
									</tbody>
								</table>
								<div class="table_control">
								<div class="btns">
									<a href="#this" class="btn" id="list2"><span><strong>목록으로</strong></span></a>
									</div>
									<c:set var="MB_CODE" value="${RVMAP.MB_CODE }" />
									<c:set var="session" value="${loginInfo.MB_CODE }" />
									<c:if test="${MB_CODE eq session}">
										<div class="btns">
										<a href="#this" class="btn" id="update1"><span><strong>수정하기</strong></span></a>
										</div>
										<div class="btns">
										<a href="#this" class="btn" id="delete"><span><strong>삭제하기</strong></span></a>
									</div>
									</c:if>
								
								</div>
							</form>
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
	<script
		src="/common/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="/common/assets/scripts/klorofil-common.js"></script>
	<script src="/common/assets/js/common.js"></script>

</body>

</html>
