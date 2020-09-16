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
<link rel="stylesheet" href="/common/assets/css/join.css">
<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
<link rel="stylesheet" href="/common/assets/css/demo.css">
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
						<div class="col-md-7 loading-main">
							<!-- 코드 넣는곳 -->
							<form id="frm">
								<div class="btn_div">
									<input type="hidden" name="MB_ID" value="${mbpd.MB_ID}" /> <input
										type="hidden" name="MB_PW" value="${mbpd.MB_PW}" /> <input
										type="hidden" name="MB_PHONE" value="${mbpd.MB_PHONE}" />
									<div class="col-md_11">
										<label class="col-md-5">이름</label> <input type="text"
											id="MB_NAME" name="MB_NAME" class="col-md-7" maxlength="10">
									</div>
									<div class="col-md_11">
										<label class="col-md-5">나이</label> <input type="number"
											id="MB_AGE" name="MB_AGE" class="col-md-7" maxlength="4">
									</div>
									<div class="col-md_11">
										<label class="col-md-5">키(cm)</label> <input type="number"
											id="MB_HEIGHT" name="MB_HEIGHT" class="col-md-7"
											maxlength="4">
									</div>
									<div class="col-md_11">
										<label class="col-md-5">시작몸무게(kg)</label> <input type="number"
											id="MB_INITIAL" name="MB_INITIAL" class="col-md-7"
											maxlength="4">
									</div>
									<div class="col-md_11">
										<label class="col-md-5">목표몸무게(kg)</label> <input type="number"
											id="MB_TARGET" name="MB_TARGET" class="col-md-7"
											maxlength="4">
									</div>
									<div class="col-md_11">
										<label class="col-md-5">상품선택</label> <select name="PD_NAME"
											id="PD_NAME" class="col-md-7 select">
											<option value="" selected disabled hidden>상품 선택</option>
											<c:forEach var="rowpd1" items="${mbpd.list_pd}">
												<option value1="${rowpd1.PD_NAME }">${rowpd1.PD_NAME }

												</option>
											</c:forEach>
										</select>
									</div>
									<c:forEach var="rowpd2" items="${mbpd.list_pd}">
										<div class="col-md_11">
											<label class="col-md-3 pdinfo">${rowpd2.PD_NAME }</label> <label
												class="col-md-3 pdinfo">${rowpd2.PD_PRICE }원</label> <label
												class="col-md-6 pdinfo">${rowpd2.PD_BODY }</label>
										</div>
									</c:forEach>
									<div class="col-md_11">
										<label class="col-md-5">성별</label> <select name="MB_GENDER"
											id="MB_GENDER" class="col-md-7 select">
											<option value="" selected disabled hidden>성별 선택</option>
											<option value="남성">남성</option>
											<option value="여성">여성</option>
										</select>
									</div>
									<div class="col-md_11">
										<label class="col-md-5">가입경로</label> <select name="MB_CH"
											id="MB_CH" class="col-md-7 select">
											<option value="" selected disabled hidden>가입경로 선택</option>
											<option value="NAVER">NAVER</option>
											<option value="Google">Google</option>
											<option value="Instagram">Instagram</option>
											<option value="Facebook">Facebook</option>
											<option value="Others">Others</option>
										</select>
									</div>
									<input type="hidden" id="MB_LEVEL" name="MB_LEVEL" value="2" />
									<input type="hidden" id="MB_STATUS" name="MB_STATUS"
										value="complete" />
									<div class="joinadd_btn_area1">
										<a href="#" class="btn btn_border" id="signUpPay2">가입&결제</a>
									</div>
									<div class="join_btn_area2">
										<a href="#" class="btn btn_border" id="cancle">취소</a>
									</div>
								</div>
							</form>
							<form class="hidden" id="commonForm" name="commonForm"></form>

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
	<script src="/common/assets/js/join.js"></script>

</body>

</html>
