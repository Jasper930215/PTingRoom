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
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-headline">

										<c:choose>
											<c:when test="${map.list[0].MB_BYE eq 'N'}">
												<div class="panel-heading">
													<h3 class="panel-title">활동회원관리</h3>
												</div>
											</c:when>
											<c:when test="${map.list[0].MB_BYE eq 'Y'}">
												<div class="panel-heading">
													<h3 class="panel-title">탈퇴회원관리</h3>
												</div>
											</c:when>
										</c:choose>

										<div class="panel-body">
											<table class="table table-striped" summary="회원관리">
												<colgroup>
													<col width="15%" />
													<col width="25%" />
													<col width="15%" />
													<col width="20%" />
													<col width="25%" />
												</colgroup>
												<thead>
													<tr>
														<th>Member Code</th>
														<th>ID</th>
														<th>Name</th>
														<th>Phone</th>
														<th>Product Name</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${map.list}" var="member"
														begin="${start}" end="${end}" varStatus="i">
														<tr>
															<td><c:out value="${member.MB_CODE}" /></td>
															<td><a
																href="javascript:fn_admMemInfo('${member.MB_CODE}')"><c:out
																		value="${member.MB_ID}" /></a></td>
															<td>${member.MB_NAME}</td>
															<td><c:out value="${member.MB_PHONE}" /></td>
															<td><c:out value="${member.PD_NAME}" /></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<div class="table_control">
												<div class="table_paging">
													<c:if test="${map.paging.curPage ne 1 }">
														<a href="javascript:fn_admMemListPaging(1)">[처음]</a>
													</c:if>
													<c:if test="${map.paging.curBlock ne 1}">
														<a
															href="javascript:fn_admMemListPaging('${map.paging.prevPage }')">[이전]</a>
													</c:if>
													<c:forEach var="num" begin="${map.paging.blockBegin }"
														end="${map.paging.blockEnd }">
														<c:choose>
															<c:when test="${num eq  map.paging.curPage}">
																<span style="font-weight: bold;"> <a
																	href="javascript:fn_admMemListPaging('${num }')">${num }</a>
																</span>
															</c:when>
															<c:otherwise>
																<a href="javascript:fn_admMemListPaging('${num }')">${num }</a>
															</c:otherwise>
														</c:choose>
													</c:forEach>
													<c:if
														test="${map.paging.curBlock ne map.paging.totalBlock && map.paging.totalBlock > 0}">
														<a
															href="javascript:fn_admMemListPaging('${map.paging.nextPage }')">[다음]</a>
													</c:if>
													<c:if
														test="${map.paging.curPage ne map.paging.totalPage && map.paging.totalPage > 0}">
														<a
															href="javascript:fn_admMemListPaging('${map.paging.totalBlock }')">[끝]</a>
													</c:if>
												</div>
												<div class="table_search">
													<div class="search_category">
														<select name="searchType" id="searchType">
															<c:choose>
																<c:when test="${map.searchType == 'Name' }">
																	<option value="Name" selected="selected">이름</option>
																	<option value="ID">아이디</option>
																	<option value="Phone">전화번호</option>
																</c:when>
																<c:when test="${map.searchType == 'ID' }">
																	<option value="Name">이름</option>
																	<option value="ID" selected="selected">아이디</option>
																	<option value="Phone">전화번호</option>
																</c:when>
																<c:when test="${map.searchType == 'Phone' }">
																	<option value="Name">이름</option>
																	<option value="ID">아이디</option>
																	<option value="Phone" selected="selected">전화번호</option>
																</c:when>
																<c:otherwise>
																	<option value="Name">이름</option>
																	<option value="ID">아이디</option>
																	<option value="Phone">전화번호</option>
																</c:otherwise>
															</c:choose>
														</select>
													</div>
													<div class="search_input">
														<input type="text" name="searchWord" id="searchWord"
															value="${map.searchWord }"> <a href="#this"
															class="btn search_btn" id="MemSearch">검색</a> <a
															href="javascript:fn_clearSearchLog()"
															class="btn search_btn" id="clearSearchLog">초기화</a>
													</div>
												</div>
											</div>
											<form id="commonForm" name="commonForm"></form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
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
	<script src="/common/assets/js/admin_Member.js"></script>

</body>

</html>
