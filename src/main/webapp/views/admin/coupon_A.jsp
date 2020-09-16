<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">

<head>
<title>2nd Project - Overview</title>
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
<link rel="stylesheet" href="/common/assets/css/admin.css">
<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700"
	rel="stylesheet">
<!-- ICONS -->
<link rel="apple-touch-icon" sizes="76x76"
	href="/common/assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="/common/assets/img/favicon.png">
</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="/common/adm/openIndex" class=""><i
								class="lnr lnr-home"></i> <span>Main</span></a></li>
						<li><a href="/common/adm/openMypage" class=""><i
								class="lnr lnr-home"></i> <span>Mypage</span></a></li>
						<li><a href="/common/adm/openCharts" class=""><i
								class="lnr lnr-chart-bars"></i> <span>Charts</span></a></li>
						<li><a href="#subPages" data-toggle="collapse" class="active"><i
								class="lnr lnr-file-empty"></i> <span>Member</span> <i
								class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages" class="collapse in">
								<ul class="nav">
									<li><a href="/common/admMB/mbOpenList" class="active">Active</a></li>
									<li><a href="/common/admMB/withdraw" class="">Withdraw</a></li>
								</ul>
							</div></li>
						<li><a href="/common/gym/gymList" class=""><i
								class="lnr lnr-linearicons"></i> <span>Gym</span></a></li>
						<li><a href="/common/adm/pdList" class=""><i
								class="lnr lnr-linearicons"></i> <span>Product</span></a></li>
						<li><a href="#subPages2" data-toggle="collapse"
							class="active"><i class="lnr lnr-file-empty"></i> <span>CS
									CENTER</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages2" class="collapse in">
								<ul class="nav">
									<li><a href="/common/admNT/ntList" class="active">Notice</a></li>
									<li><a href="/common/admFAQ/faqList" class="">FAQ</a></li>
								</ul>
							</div></li>
						<li><a href="/common/cp/cplistA" class=""><i
								class="lnr lnr-linearicons"></i> <span>Coupon</span></a></li>
						<c:choose>
							<c:when test="${admloginInfo.size()>0}">
								<li><a href="/common/adm/logoutTry">Logout</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/common/adm/openLogin">Login</a></li>
							</c:otherwise>
						</c:choose>

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
					<!-- OVERVIEW -->
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-headline">
								<div class="panel-heading">
									<div class="panel-heading">
										<h3 class="panel-title">쿠폰관리</h3>
									</div>
								</div>
								<div class="panel-body">
									<!-- 코드 넣는곳 -->
									<table class="table table-striped" summary="쿠폰관리">
										<colgroup>
											<col width="15%" />
											<col width="15%" />
											<col width="10%" />
											<col width="15%" />
											<col width="15%" />
											<col width="30%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">쿠폰번호</th>
												<th scope="col">신청자ID</th>
												<th scope="col">신청자이름</th>
												<th scope="col">전화번호</th>
												<th scope="col">신청날짜</th>
												<th scope="col">승인여부</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${fn:length(map.list_Cpa) > 0}">
													<c:forEach items="${map.list_Cpa }" var="row">
														<tr>
															<td>${row.CPN_CODE }</td>
															<td>${row.MB_ID }</td>
															<td>${row.MB_NAME }</td>
															<td>${row.MB_PHONE }</td>
															<td>${row.CPN_SDATE }<input type="hidden"
																id="CPN_DDATE" name="CPN_DDATE"
																value="${row.DPN_DDATE }" />
															</td>
															<c:set var="check" value="${row.CPN_CHECK }" />
															<c:choose>
																<c:when test="${check eq 'Y'}">
																	<td>승인</td>
																</c:when>
																<c:when test="${check eq 'W'}">
																	<td>
																		<div class="indetail2">
																			<div class="btns">
																				<a href="" id="cppermit" value="${row.CPN_CODE }"
																					class="btn">승인</a>
																			</div>
																			<div class="btns">
																				<a href="" id="cpreject" value="${row.CPN_CODE }"
																					class="btn">거절</a>
																			</div>
																		</div>
																	</td>
																</c:when>
																<c:when test="${check eq 'R'}">
																	<td>거절</td>
																</c:when>
																<c:when test="${check eq 'E'}">
																	<td>기간만료</td>
																</c:when>
															</c:choose>

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
												<a href="javascript:fn_list_c_a('1')">[처음]</a>
											</c:if>
											<!-- 이전 페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]을 출력	 -->
											<c:if test="${map.paging.curBlock>1 }">
												<a href="javascript:fn_list_c_a('map.paging.prevPage')">[이전]</a>
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
														<a href="javascript:fn_list_c_a('${num }')">${num }</a>&nbsp;
											</c:otherwise>
												</c:choose>
											</c:forEach>
											<!-- 다음 페이지 블록으로 이동 : 현재 페이지 블록이 전체 페이지 블럭보다 작거나 같으면 [다음]을 출력 -->
											<c:if test="${map.paging.curBlock<=map.paging.totalBlock }">
												<a href="javascript:fn_list_c_a('${map.paging.nextPage}')">[다음]</a>
											</c:if>
											<!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작으면 [끝]을 출력 -->
											<c:if test="${map.paging.curPage<map.paging.totalPage }">
												<a href="javascript:fn_list_c_a('${map.paging.totalPage }')">[끝]</a>
											</c:if>
										</div>
										<div class="table_search">
											<div class="search_category">
												<select name="searchType" id="searchType">
													<c:choose>
														<c:when test="${map.searchType == 'NAME' }">
															<option value="NAME" selected="selected">이름</option>
															<option value="ID">아이디</option>
															<option value="PHONE">전화번호</option>
														</c:when>
														<c:when test="${map.searchType == 'ID' }">
															<option value="NAME">이름</option>
															<option value="ID" selected="selected">아이디</option>
															<option value="PHONE">전화번호</option>
														</c:when>
														<c:when test="${map.searchType == 'PHONE' }">
															<option value="NAME">이름</option>
															<option value="ID">아이디</option>
															<option value="PHONE" selected="selected">전화번호</option>
														</c:when>

													</c:choose>
												</select>
											</div>
											<div class="search_input">
												<input type="text" name="searchWord" id="searchWord"
													value="${map.searchWord }"> <a href="#this"
													class="btn search_btn" id="c_search">검색</a>
											</div>
										</div>
									</div>
									<form id="commonForm" name="commonForm"></form>



								</div>
							</div>
						</div>
					</div>
					<!-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: -->
					<!-- END OVERVIEW -->


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

	<script src="/common/assets/js/coupon.js"></script>
</body>

</html>
