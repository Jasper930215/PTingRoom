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
			<div class="main-content" id="deatil_main_content">
				<div class="container-fluid">
					<div class="row" id="detail_main_section">
						<div class="centerMasterHead">
							<div class="centerMasterHead_bg_blur"
								style="background: url(/common/gymfile/${GYMMAP.GY_NUM}_1.jpg) no-repeat fixed center center; background-size: cover;"></div>
							<div class="container">
								<div class="row">
									<div class="cHeading">
										<i class="coverOverlay"></i>
										<div class="info">
											<div>
												<h3>
													<small class="centerNameLabel">피팅룸 제휴시설</small> <strong>
														<span class="cnText">${GYMMAP.GY_NAME }</span> <sup>
															<i class="fa fa-calendar"></i> 전일예약
													</sup>
													</strong>
												</h3>
												<address class="detail_address">${GYMMAP.GY_ADDR1 }&nbsp;${GYMMAP.GY_ADDR2 }&nbsp;${GYMMAP.GY_NAME }
												</address>

												<strong> <sup class="detail_phone"> <i
														class="fa fa-phone"></i> ${GYMMAP.GY_PHONE }
												</sup>
												</strong>

											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="btnLGWrap">
								<div class="container">
									<a href="#this" id="list2">
										<button class="btn btn-default btn-sm btn_lanunchGallery"
											id="launchGallery">
											<i class="fa fa-picture-o"></i>목록으로 가기
										</button>
									</a>
								</div>
							</div>
							<div class="fcRecord">
								<div class="container">
									<div class="fcRecordLeft">
										<div class="stat">
											<span class="tip">누적 이용</span> <b class="aq">57</b>
										</div>
									</div>
									<div class="fcRecordRight"></div>
								</div>
							</div>
						</div>
					</div>


					<div class="row">

						<div class="col-lg-7 col-md-7">
							<!-- ####	상세 소개	#### -->
							<div class="row">
								<div class="col-md-10 loading-main">
									<div class="panel">
										<div class="panel-heading">
											<h3 class="panel-title loading-title"></h3>
										</div>
										<div class="panel-body">
											<div class="row">
												<div class="col-lg-7 col-md-7">
													<div class="col-sm-11">
														<h6 class="col-sm-4">대표번호</h6>
														<div class="col-sm-8">${GYMMAP.GY_PHONE }</div>
													</div>

													<div class="col-sm-11">
														<h6 class="col-sm-4">주소</h6>
														<div class="col-sm-8">${GYMMAP.GY_ADDR1 }&nbsp;${GYMMAP.GY_ADDR2 }&nbsp;${GYMMAP.GY_NAME }</div>
													</div>

													<div class="col-sm-11">
														<h6 class="col-sm-4">우편번호</h6>
														<div class="col-sm-8">${GYMMAP.GY_POST }</div>
													</div>
												</div>

												<div class="col-lg-4 col-lg-offset-1 col-md-5">
													<div class="centerGallery">
														<div class="row" id="lightgallery">
															<div class="col-xs-4 col-sm-3 col-md-5">
																<a class="responsibleImgBox"> <img
																	src="/common/gymfile/${GYMMAP.GY_NUM}_1.jpg"> <span
																	class="overlay"><i class="fa fa-search-plus"></i></span>
																</a>
															</div>

															<div class="col-xs-4 col-sm-3 col-md-5">
																<a class="responsibleImgBox"> <img
																	src="/common/gymfile/${GYMMAP.GY_NUM}_2.jpg"> <span
																	class="overlay"><i class="fa fa-search-plus"></i></span>
																</a>
															</div>
														</div>
													</div>
												</div>
											</div>
											<input type="hidden" id="curPage" value="${curPage}" /> <input
												type="hidden" id="searchWord" value="${searchWord}" />
										</div>
									</div>
								</div>
							</div>



							<!-- ####	코치 소개	#### -->
							<div class="row">
								<div class="col-md-10 loading-main">
									<div class="panel">
										<div class="panel-heading">
											<h3 class="panel-title loading-title"></h3>
										</div>
										<div class="panel-body">
											<div class="row">
												<div class="col-lg-7 col-md-7">
													<div class="col-sm-11">
														<h6 class="col-sm-4">대표 코치</h6>
														<div class="col-sm-8">${GYMMAP.GY_CNAME }</div>
													</div>

													<div class="col-sm-11">
														<h6 class="col-sm-4">코치 인사말</h6>
														<div class="col-sm-8">${GYMMAP.GY_CINTRO }</div>
													</div>
												</div>



												<div class="col-lg-4 col-lg-offset-1 col-md-5">
													<div class="centerGallery">
														<div class="row" id="lightgallery">
															<div class="col-xs-4 col-sm-3 col-md-5">
																<a class="responsibleImgBox"> <img
																	src="/common/gymfile/${GYMMAP.GY_NUM}_3.jpg"> <span
																	class="overlay"><i class="fa fa-search-plus"></i></span>
																</a>
															</div>
														</div>
													</div>
												</div>
											</div>
											<input type="hidden" id="curPage" value="${curPage}" /> <input
												type="hidden" id="searchWord" value="${searchWord}" />
											<div class="hidden detail_ADDR1">${GYMMAP.GY_ADDR1 }</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-3 col-md-3">
							<div class="col-md-11 loading-main">
								<div class="row">
									<div id="detailArea" style="width: 100%; height: 400px;"></div>
								</div>
							</div>
						</div>



					</div>
				</div>
				<!-- END MAIN CONTENT -->
			</div>
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
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68528de2b1f0aa56cf8325a807deb0bd&libraries=services"></script>
	<script src="/common/assets/vendor/jquery/jquery.min.js"></script>
	<script src="/common/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="/common/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>

	<script src="/common/assets/scripts/klorofil-common.js"></script>
	<!-- MAP -->
	<script src="/common/assets/js/map.js"></script>

	<script type="text/javascript">
		var mapContainer = document.getElementById('detailArea'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.5187052, 127.049186), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		

		mapContainer.style.width = '100%';
		mapContainer.style.height = '400px';

		function relayout() {

			// 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
			// 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
			// window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
			map.relayout();
		}
		
		// 마커가 표시될 위치입니다 
		var viewList = $(".detail_ADDR1");
		var addressArray = [];

		for (var i = 0; i < viewList.length; i++) {
			addressArray.push(viewList[i].innerHTML);
		}
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		for (var i = 0; i < addressArray.length; i++) {

			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(addressArray[i],
					function(result, status) {

						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords,
							});
							map.setCenter(coords);
							marker.setMap(map);
						}
					});
		}
		
	</script>
</body>

</html>
