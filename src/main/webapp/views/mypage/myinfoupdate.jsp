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
<link rel="stylesheet"
	href="/common/assets/vendor/chartist/css/chartist-custom.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="/common/assets/css/main.css">
<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
<link rel="stylesheet" href="/common/assets/css/demo.css">
<link rel="stylesheet" href="/common/assets/css/join.css">
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
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="/common/member/mbOpenInfo" class=""><i
								class="lnr lnr-home"></i> <span><strong>회원정보수정</strong></span></a></li>
						<li><a href="/common/cp/cplistM" class=""><i
								class="lnr lnr-home"></i> <span><strong>쿠폰신청내역</strong></span></a></li>
						<li><a href="/common/member/openbye" class=""><i
								class="lnr lnr-home"></i> <span><strong>탈퇴</strong></span></a></li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main" id="mypageinfo_main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-7 loading-main">
							<!-- 코드 넣는곳 -->
							<form id="frm">

								<div class="btn_div">
									<div class="mypage_index">
										<label class="infoupdate"><strong>회원정보수정</strong></label>
									</div>
									<div class="col-md_11">
										<label class="col-md-5">아이디</label> <label class="col-md-5">${Info.MB_ID }</label>
									</div>
									<div class="col-md_11">
										<label class="col-md-5">새로운 비밀번호</label> <input
											type="password" id="MB_PW" name="MB_PW" class="col-md-7"
											maxlength="15" value="${Info.MB_PW }">
									</div>

									<input type="hidden" id="MB_LEVEL" name="MB_LEVEL"
										value="${Info.MB_LEVEL }"> <input type="hidden"
										id="MB_CODE" name="MB_CODE" value="${Info.MB_CODE }">
									<c:if test="${loginInfo.MB_LEVEL > 1 }">
										<div class="col-md_11">
											<label class="col-md-5">이름</label> <input type="text"
												id="MB_NAME" name="MB_NAME" class="col-md-7" maxlength="10"
												value="${Info.MB_NAME }">
										</div>
									</c:if>
									<div class="col-md_11">
										<label class="col-md-5">휴대전화번호</label> <input type="tel"
											id="MB_PHONE" name="MB_PHONE" class="col-md-7"
											value="${Info.MB_PHONE }">
									</div>
									<div class="joinadd_btn_area1">
										<a href="#" class="btn btn_border" id="updateinfo">정보수정</a>
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
	<script
		src="/common/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="/common/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="/common/assets/scripts/klorofil-common.js"></script>
	<script src="/common/assets/js/common.js"></script>
</body>

</html>
