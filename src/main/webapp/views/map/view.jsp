<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">

<head>
<title>지도보기</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- VENDOR CSS -->
<link rel="stylesheet"
	href="/common/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
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
<!-- CUSTOM -->
<!-- MAP CSS -->
<link rel="stylesheet" href="/common/assets/css/mapCustom.css">


</head>

<body class="layout-fullwidth hi">
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top main-navbar">
			<div class="main-brand">
				<ul>
					<li>
						<a class="left_icon left_home" href="/common/home/openHome">
							<i class="fa fa-home" aria-hidden="true"></i>
							<span>HOME</span>
						</a>
					</li>
					<c:choose>
						<c:when test="${loginInfo.size()>0}">
							<li>
								<a class="left_icon left_logout" href="/common/member/logoutTry">
									<i class="fa fa-home" aria-hidden="true"></i>
									<span>로그아웃</span>
								</a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a class="left_icon left_login" href="/common/member/openLogin">
									<i class="fa fa-sign-in-alt" aria-hidden="true"></i>
									<span>로그인</span>
								</a>
							</li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${loginInfo.size()>0}">
							<li>
								<a class="left_icon left_mypage" href="/common/member/mbOpenInfo">
									<i class="fa fa-home" aria-hidden="true"></i>
									<span>MYPAGE</span>
								</a>
							</li>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${loginInfo.size()>0 }">
						</c:when>
						<c:otherwise>
							<li>
								<a class="left_icon left_join" href="/common/member/mbOpenSignUp">
									<i class="fa fa-flag" aria-hidden="true"></i>
									<span>회원가입</span>
								</a>
							</li>
						</c:otherwise>
					</c:choose>
					
					<li>
						<a class="left_icon left_map" href="/common/search/openMapList">
							<i class="fa fa-search-plus"></i>
							<span>가맹점</span>
						</a>
					</li>
					
					<li>
						<a class="left_icon left_community" href="/common/review/rvList">
							<i class="fa fa-comment-dots" aria-hidden="true"></i>
							<span>커뮤니티</span>
						</a>
					</li>
					
					<c:choose>
						<c:when test="${loginInfo.size()>0}">
							<li>
								<a class="left_icon left_coupon" href="/common/cp/mbOpenCpDown">
									<i class="fa fa-heart" aria-hidden="true"></i>
									<span>쿠폰</span>
								</a>
							</li>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${loginInfo.MB_LEVEL == 1}">
							<li>
							<a class="left_icon left_payment" href="/common/member/mbOpenSignUpAdd2">
								<i class="fa fa-parking" aria-hidden="true"></i>
								<span>결제하기</span>
							</a>
							</li>
						</c:when>
					</c:choose>
					<li>
						<a class="left_icon" href="/common/home/ntList">
							<i class="fa fa-question-circle" aria-hidden="true"></i>
							<span>고객센터</span>
						</a>
					</li>
				</ul>
			</div>
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar map-leftbar">
			<div class="sidebar-scroll">
				<nav>
					<div class="map_search">
						<input type="text" placeholder="제휴시설, 가맹점, 장소 검색"
							name="searchWord" id="searchWord" class="map_search_input"
							onkeypress="if( event.keyCode==13 ){fn_searchList();}"
							value="${map.searchWord }">
						<button onclick="location.href='#this'" type="button" id="search"
							class="btn map_search_btn"></button>

					</div>
					<ul id="List_El" class="nav">
						<c:choose>
							<c:when test="${fn:length(map.list) > 0}">
								<c:forEach items="${map.list}" var="row">
									<li class="List_NAME" id="list_${row.GY_NUM }">
										<div class="List_div">
											<div class="List_IMAGE"
												style="background: url(/common/gymfile/${row.GY_NUM}_1.jpg)"></div>
										</div>
										<div class="List_li">
											<a
												href="javascript:fn_openMapDetail('${row.GY_NUM }',
                                 '${map.paging.curPage }', '${map.searchWord }')">
												${row.GY_NAME } </a> <input type="hidden" id="GY_NUM"
												value="${row.GY_NUM}" /> <span class="hidden List_TITLE">${row.GY_NAME }</span>
											<span class="hidden List_NUM">${row.GY_NUM}</span> <span
												class="List_ADDR1">${row.GY_ADDR1}</span> <br> <span
												class="List_ADDR2">${row.GY_ADDR2}</span> <br> <span
												class="List_PHONE">${row.GY_PHONE}</span> <span
												class="List_INFO">피팅룸 > 제휴시설</span> <br>
										</div>
									</li>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<li>가맹점이 존재하지 않습니다.</li>
							</c:otherwise>
						</c:choose>
					</ul>
					<div class="paginate_wrap">
						<div class="paginate loaded">
							<!-- 처음 페이지로 이동 : 현재 페이지가 1보다 크면 [처음]을 출력 -->
							<c:if test="${map.paging.curPage>1 }">
								<a href="javascript:fn_list('1')">[처음]</a>
							</c:if>
							<!-- 이전 페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]을 출력    -->
							<c:if test="${map.paging.curBlock>1 }">
								<a class="first-child"
									href="javascript:fn_list('map.paging.prevPage')">[이전]</a>
							</c:if>
							<!-- 하나의 블럭에서 반복문 수행 시작페이부터 끝페이지까지 -->
							<c:forEach var="num" begin="${map.paging.blockBegin }"
								end="${map.paging.blockEnd }">
								<!-- 현재 페이지이면 하이퍼링크 제거 -->
								<c:choose>
									<c:when test="${num==map.paging.curPage }">
										<span class="mapPaging_curPage">${num }</span>
									</c:when>
									<c:otherwise>
										<a href="javascript:fn_list('${num }')">${num }</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<!-- 다음 페이지 블록으로 이동 : 현재 페이지 블록이 전체 페이지 블럭보다 작거나 같으면 [다음]을 출력 -->
							<c:if test="${map.paging.curBlock<=map.paging.totalBlock }">
								<a href="javascript:fn_list('${map.paging.nextPage}')">[다음]</a>
							</c:if>
							<!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작으면 [끝]을 출력 -->
							<c:if test="${map.paging.curPage<map.paging.totalPage }">
								<a class="last-child"
									href="javascript:fn_list('${map.paging.totalPage }')">[끝]</a>
							</c:if>
						</div>
					</div>
				</nav>
			</div>
		</div>
		<form id="commonForm" name="commonForm"></form>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div id="mapArea"></div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
	</div>
	<!-- END WRAPPER -->

	<!-- Javascript -->
	<script src="/common/assets/vendor/jquery/jquery.min.js"></script>
	<script src="<c:url value='/assets/js/common.js'/>" charset="utf-8"></script>

	<script src="/common/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="/common/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="/common/assets/scripts/klorofil-common.js"></script>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68528de2b1f0aa56cf8325a807deb0bd&libraries=services"></script>
	<script src="/common/assets/js/map.js"></script>




	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var mapContainer = document
									.getElementById('mapArea'), mapOption = {
								center : new kakao.maps.LatLng(
										37.53972352598898, 126.90699104833652), // 지도의 중심좌표
								level : 8
							};
							var map = new kakao.maps.Map(mapContainer,
									mapOption);
							var ps = new kakao.maps.services.Places(map);
							mapContainer.style.width = '100%';
							mapContainer.style.height = '100%';

							function relayout() {
								map.relayout();
							}

							var count = 0;

							var viewTitle = $('.List_TITLE');
							var titleArray = new Array();

							var viewAddr1 = $('.List_ADDR1');
							var addressArray = new Array();

							var viewNum = $('.List_NUM');
							var numArray = new Array();

							for (var i = 0; i < viewAddr1.length; i++) {

								titleArray.push(viewTitle[i].innerHTML);
								addressArray.push(viewAddr1[i].innerHTML);
								numArray.push(viewNum[i].innerText);

								ps.keywordSearch(addressArray[i], searchGym);
							}

							function searchGym(result, status) {
								if (status == kakao.maps.services.Status.OK) {

									var coords = new kakao.maps.LatLng(
											result[0].y, result[0].x);

									var marker = new kakao.maps.Marker({
										map : map,
										position : coords
									});

									marker.setMap(map);
									infowin();

								}

								function infowin() {
									var infowindow = new kakao.maps.InfoWindow(
											{
												position : coords,
												content : '<div class="info_wrap">'
														+ '<div class="info_content">'
														+ '<div class="info_name">'
														+ titleArray[count]
														+ '</div>'
														+ '<div class="info_address">'
														+ addressArray[count]
														+ '</div>'
														+ '</div>'
														+ '</div>',
												zIndex : 1,
											});

									kakao.maps.event.addListener(marker,
											'mouseover', makeOverListener(map,
													marker, infowindow,
													numArray[count]));

									kakao.maps.event.addListener(marker,
											'mouseout',
											makeOutListener(infowindow,
													numArray[count]));
									count++;
								}

							}

							function makeOverListener(map, marker, infowindow,
									num) {
								return function() {
									infowindow.open(map, marker);
									$("#list_" + num).css('background',
											'#FFFBE5');

								};
							}

							function makeOutListener(infowindow, num) {
								return function() {
									infowindow.close();
									$("#list_" + num).css('background', '');
								};
							}

						});
	</script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="https://use.fontawesome.com/fb2b5c2c9a.js"></script>
	<script src="https://kit.fontawesome.com/a302f0f140.js"
		crossorigin="anonymous"></script>
</body>
</html>