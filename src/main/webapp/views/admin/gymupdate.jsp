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
<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700"
	rel="stylesheet">
<!-- ICONS -->
<link rel="apple-touch-icon" sizes="76x76"
	href="/common/assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="/common/assets/img/favicon.png">
<!-- 다음주소 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
										<h3 class="panel-title">수정하기</h3>
									</div>
								</div>
								<div class="panel-body">
									<!-- 코드 넣는곳 -->
									<form id="form" name="form" enctype="multipart/form-data">
										<table class="add-table">
											<tbody>
												<tr>
													<th>상호명</th>
													<td><input type="text" id="GY_NAME" name="GY_NAME"
														value="${map.GY_NAME }"></td>
												</tr>
												<tr>
													<th>대표번호</th>
													<td><input type="text" id="GY_PHONE" name="GY_PHONE"
														value="${map.GY_PHONE }"></td>
												</tr>
												<tr>
													<th>사업자번호</th>
													<td>${map.GY_NUM }<input type="hidden" ID="GY_NUM"
														name="GY_NUM" value="${map.GY_NUM }">
													</td>
												</tr>
												<tr>
													<th rowspan="3">주소</th>
													<td><input type="text" id="GY_POST" name="GY_POST"
														placeholder="우편번호" value="${map.GY_POST }"></td>
													<td><input type="button"
														onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br></td>
													<td>
												</tr>
												<tr>
													<td><input type="text" id="GY_ADDR1" name="GY_ADDR1"
														placeholder="주소" value="${map.GY_ADDR1 }"></td>

													<td><input type="text" id="GY_ADDR4" name="GY_ADDR4"
														placeholder="참고항목"></td>
												</tr>
												<tr>
													<td><input type="text" id="GY_ADDR2" name="GY_ADDR2"
														placeholder="상세주소" value="${map.GY_ADDR2 }"></td>
												</tr>
												<tr>
													<th>코치이름</th>
													<td><input type="text" id="GY_CNAME" name="GY_CNAME"
														value="${map.GY_CNAME }"></td>
												</tr>
												<tr>
													<th>코치인사말</th>
													<td><input type="text" id="GY_CINTRO" name="GY_CINTRO"
														value="${map.GY_CINTRO }"></td>
												</tr>

											</tbody>
										</table>


										<p class="title">사진등록</p>
										<p>"('-'을 뺀 가맹점사업자번호)_(숫자)"의 형식으로 파일명을 수정한 후 등록해주시기
											바랍니다.(단, 파일명에 들어가는 숫자는 내부사진은 1,2이고 코치사진은 3)</p>
										<table>
											<tr>
												<th>첨부파일</th>
												<td>
													<div id="fileDiv">
														<c:forEach var="row" items="${list }" varStatus="var">
															<p>
																<input type="hidden" id="FILE_NUM"
																	name="FILE_NUM_${var.count }"> <a href="#"
																	id="name_${var.count }" name="name_${var.count }">${row.FILE_NAME }</a>
																<input type="file" id="file_${var.count }"
																	name="file_${var.count }">
															</p>
														</c:forEach>
													</div>
												</td>
											</tr>
										</table>
								</div>

								<div class="add-btn">
									<a href="#this" class="btn" id="update2">수정하기</a> <a
										href="#this" class="btn" id="list2">목록으로</a>

								</div>

								</form>
								<form id="commonForm" name="commonForm"></form>
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
								&copy; 2019 <a href="#" target="_blank">Ezen. 1401</a>. All
								Rights Reserved.
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

			<script src="/common/assets/js/gym.js"></script>
</body>

</html>
