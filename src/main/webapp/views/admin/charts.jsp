<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">

<head>
<title>2nd Project - Chart</title>
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
<!-- CHART -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.css">
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
						<li><a href="/common/adm/openIndex" class=""><i class="lnr lnr-home"></i>
								<span>Main</span></a></li>
						<li><a href="/common/adm/openMypage" class=""><i class="lnr lnr-home"></i>
								<span>Mypage</span></a></li>
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
						<li><a href="#subPages2" data-toggle="collapse" class="active"><i
								class="lnr lnr-file-empty"></i> <span>CS CENTER</span> <i
								class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages2" class="collapse in">
								<ul class="nav">
									<li><a href="/common/admNT/ntList" class="active">Notice</a></li>
									<li><a href="/common/admFAQ/faqList" class="">FAQ</a></li>
								</ul>
							</div>
						</li>
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

				<div class="row">
					<!-- Age(Group) -->
					<div class="col-md-6">
						<div class="panel panel-headline">
							<div class="panel-heading">
								<h3 class="panel-title">Age(Group)</h3>
								<div class="right">
									<button type="button" class="btn-toggle-collapse">
										<i class="lnr lnr-chevron-up"></i>
									</button>
								</div>
							</div>
							<div class="panel-body">
								<canvas id="myChart01"></canvas>
							</div>
						</div>
					</div>
					<!-- Price -->
					<div class="col-md-6">
						<div class="panel panel-headline">
							<div class="panel-heading">
								<h3 class="panel-title">Price</h3>
								<div class="right">
									<button type="button" class="btn-toggle-collapse">
										<i class="lnr lnr-chevron-up"></i>
									</button>
								</div>
							</div>
							<div class="panel-body">
								<canvas id="myChart02"></canvas>
							</div>
						</div>
					</div>

				</div>

				<div class="row">
					<!-- Initial Weight(Group) -->
					<div class="col-md-6">
						<div class="panel panel-headline">
							<div class="panel-heading">
								<h3 class="panel-title">Initial Weight(Group)</h3>
								<div class="right">
									<button type="button" class="btn-toggle-collapse">
										<i class="lnr lnr-chevron-up"></i>
									</button>
								</div>
							</div>
							<div class="panel-body">
								<canvas id="myChart03"></canvas>
							</div>
						</div>
					</div>

					<!-- Lowest Weight(Group) -->
					<div class="col-md-6">
						<div class="panel panel-headline">
							<div class="panel-heading">
								<h3 class="panel-title">Lowest Weight(Group)</h3>
								<div class="right">
									<button type="button" class="btn-toggle-collapse">
										<i class="lnr lnr-chevron-up"></i>
									</button>
								</div>
							</div>
							<div class="panel-body">
								<canvas id="myChart04"></canvas>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<!-- Gender -->
					<div class="col-md-6">
						<div class="panel panel-headline">
							<div class="panel-heading">
								<h3 class="panel-title">Gender</h3>
								<div class="right">
									<button type="button" class="btn-toggle-collapse">
										<i class="lnr lnr-chevron-up"></i>
									</button>
								</div>
							</div>
							<div class="panel-body">
								<canvas id="myChart05"></canvas>
							</div>
						</div>
					</div>

					<!-- Channel -->
					<div class="col-md-6">
						<div class="panel panel-headline">
							<div class="panel-heading">
								<h3 class="panel-title">Channel</h3>
								<div class="right">
									<button type="button" class="btn-toggle-collapse">
										<i class="lnr lnr-chevron-up"></i>
									</button>
								</div>
							</div>
							<div class="panel-body">
								<canvas id="myChart06"></canvas>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<!-- Week(Clean) -->
					<div class="col-md-6">
						<div class="panel panel-headline">
							<div class="panel-heading">
								<h3 class="panel-title">Week(Clean)</h3>
								<div class="right">
									<button type="button" class="btn-toggle-collapse">
										<i class="lnr lnr-chevron-up"></i>
									</button>
								</div>
							</div>
							<div class="panel-body">
								<canvas id="myChart07"></canvas>
							</div>
						</div>
					</div>

					<!-- Day of week -->
					<div class="col-md-6">
						<div class="panel panel-headline">
							<div class="panel-heading">
								<h3 class="panel-title">Day of week</h3>
								<div class="right">
									<button type="button" class="btn-toggle-collapse">
										<i class="lnr lnr-chevron-up"></i>
									</button>
								</div>
							</div>
							<div class="panel-body">
								<canvas id="myChart08"></canvas>
							</div>
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
	<script src="/common/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="/common/assets/scripts/klorofil-common.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>

	<!-- Age(Group) -->
	<script>
		var ctx = document.getElementById('myChart01');
		var myChart01 = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ 'Completed', 'Refunded', 'Cancelled' ],
				datasets : [
						{
							label : '3',
							data : [ 29, 1, 0 ],
							backgroundColor : [ 'rgba(76, 114, 176, 0.8)',
									'rgba(76, 114, 176, 0.8)',
									'rgba(76, 114, 176, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '4',
							data : [ 1450, 87, 430 ],
							backgroundColor : [ 'rgba(221, 132, 82, 0.8)',
									'rgba(221, 132, 82, 0.8)',
									'rgba(221, 132, 82, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '5',
							data : [ 1692, 221, 1090 ],
							backgroundColor : [ 'rgba(85, 168, 104, 0.8)',
									'rgba(85, 168, 104, 0.8)',
									'rgba(85, 168, 104, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '6',
							data : [ 332, 40, 119 ],
							backgroundColor : [ 'rgba(196, 78, 82, 0.8)',
									'rgba(196, 78, 82, 0.8)',
									'rgba(196, 78, 82, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '7',
							data : [ 125, 21, 63 ],
							backgroundColor : [ 'rgba(129, 114, 179, 0.8)',
									'rgba(129, 114, 179, 0.8)',
									'rgba(129, 114, 179, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '8',
							data : [ 6, 0, 0 ],
							backgroundColor : [ 'rgba(147, 120, 96, 0.8)',
									'rgba(147, 120, 96, 0.8)',
									'rgba(147, 120, 96, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						} ]
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
	</script>

	<!-- Price -->
	<script>
		var ctx = document.getElementById('myChart02');
		var myChart02 = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ 'Completed', 'Cancelled', 'Refunded' ],
				datasets : [
						{
							label : '44780',
							data : [ 213, 13, 136 ],
							backgroundColor : [ 'rgba(76, 114, 176, 0.8)',
									'rgba(76, 114, 176, 0.8)',
									'rgba(76, 114, 176, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '56250',
							data : [ 4, 0, 0 ],
							backgroundColor : [ 'rgba(221, 132, 82, 0.8)',
									'rgba(221, 132, 82, 0.8)',
									'rgba(221, 132, 82, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '68900',
							data : [ 81, 10, 32 ],
							backgroundColor : [ 'rgba(85, 168, 104, 0.8)',
									'rgba(85, 168, 104, 0.8)',
									'rgba(85, 168, 104, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '112500',
							data : [ 3222, 334, 1486 ],
							backgroundColor : [ 'rgba(196, 78, 82, 0.8)',
									'rgba(196, 78, 82, 0.8)',
									'rgba(196, 78, 82, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '118000',
							data : [ 45, 5, 27 ],
							backgroundColor : [ 'rgba(129, 114, 179, 0.8)',
									'rgba(129, 114, 179, 0.8)',
									'rgba(129, 114, 179, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '132000',
							data : [ 43, 8, 16 ],
							backgroundColor : [ 'rgba(147, 120, 96, 0.8)',
									'rgba(147, 120, 96, 0.8)',
									'rgba(147, 120, 96, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '137800',
							data : [ 11, 0, 5 ],
							backgroundColor : [ 'rgba(218, 139, 195, 0.8)',
									'rgba(218, 139, 195, 0.8)',
									'rgba(218, 139, 195, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '168750',
							data : [ 1, 0, 0 ],
							backgroundColor : [ 'rgba(140, 140, 140, 0.8)',
									'rgba(140, 140, 140, 0.8)',
									'rgba(140, 140, 140, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '177000',
							data : [ 14, 0, 0 ],
							backgroundColor : [ 'rgba(204, 185, 116, 0.8)',
									'rgba(204, 185, 116, 0.8)',
									'rgba(204, 185, 116, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						}, ]
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
	</script>

	<!-- Initial Weight(Group) -->
	<script>
		var ctx = document.getElementById('myChart03');
		var myChart03 = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ 'Completed', 'Refunded', 'Cancelled' ],
				datasets : [
						{
							label : '9',
							data : [ 1, 0, 0 ],
							backgroundColor : [ 'rgba(76, 114, 176, 0.8)',
									'rgba(76, 114, 176, 0.8)',
									'rgba(76, 114, 176, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '10',
							data : [ 112, 8, 23 ],
							backgroundColor : [ 'rgba(221, 132, 82, 0.8)',
									'rgba(221, 132, 82, 0.8)',
									'rgba(221, 132, 82, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '11',
							data : [ 1043, 81, 295 ],
							backgroundColor : [ 'rgba(85, 168, 104, 0.8)',
									'rgba(85, 168, 104, 0.8)',
									'rgba(85, 168, 104, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '12',
							data : [ 1056, 113, 416 ],
							backgroundColor : [ 'rgba(196, 78, 82, 0.8)',
									'rgba(196, 78, 82, 0.8)',
									'rgba(196, 78, 82, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '13',
							data : [ 773, 56, 507 ],
							backgroundColor : [ 'rgba(129, 114, 179, 0.8)',
									'rgba(129, 114, 179, 0.8)',
									'rgba(129, 114, 179, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '14',
							data : [ 365, 63, 268 ],
							backgroundColor : [ 'rgba(147, 120, 96, 0.8)',
									'rgba(147, 120, 96, 0.8)',
									'rgba(147, 120, 96, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '15',
							data : [ 173, 32, 127 ],
							backgroundColor : [ 'rgba(218, 139, 195, 0.8)',
									'rgba(218, 139, 195, 0.8)',
									'rgba(218, 139, 195, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '16',
							data : [ 78, 15, 50 ],
							backgroundColor : [ 'rgba(140, 140, 140, 0.8)',
									'rgba(140, 140, 140, 0.8)',
									'rgba(140, 140, 140, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '17',
							data : [ 18, 1, 12 ],
							backgroundColor : [ 'rgba(204, 185, 116, 0.8)',
									'rgba(204, 185, 116, 0.8)',
									'rgba(204, 185, 116, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '18',
							data : [ 3, 0, 3 ],
							backgroundColor : [ 'rgba(100, 181, 205, 0.8)',
									'rgba(100, 181, 205, 0.8)',
									'rgba(100, 181, 205, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '19',
							data : [ 7, 0, 0 ],
							backgroundColor : [ 'rgba(76, 114, 176, 0.8)',
									'rgba(76, 114, 176, 0.8)',
									'rgba(76, 114, 176, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '20',
							data : [ 3, 1, 0 ],
							backgroundColor : [ 'rgba(221, 132, 82, 0.8)',
									'rgba(221, 132, 82, 0.8)',
									'rgba(221, 132, 82, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '21',
							data : [ 2, 0, 1 ],
							backgroundColor : [ 'rgba(85, 168, 104, 0.8)',
									'rgba(85, 168, 104, 0.8)',
									'rgba(85, 168, 104, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						}, ]
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
	</script>

	<!-- Lowest Weight(Group) -->
	<script>
		var ctx = document.getElementById('myChart04');
		var myChart04 = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ 'Completed', 'Refunded', 'Cancelled' ],
				datasets : [
						{
							label : '23',
							data : [ 3, 0, 0 ],
							backgroundColor : [ 'rgba(76, 114, 176, 0.8)',
									'rgba(76, 114, 176, 0.8)',
									'rgba(76, 114, 176, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '24',
							data : [ 175, 11, 35 ],
							backgroundColor : [ 'rgba(221, 132, 82, 0.8)',
									'rgba(221, 132, 82, 0.8)',
									'rgba(221, 132, 82, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '25',
							data : [ 1152, 105, 321 ],
							backgroundColor : [ 'rgba(85, 168, 104, 0.8)',
									'rgba(85, 168, 104, 0.8)',
									'rgba(85, 168, 104, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '26',
							data : [ 1036, 104, 464 ],
							backgroundColor : [ 'rgba(196, 78, 82, 0.8)',
									'rgba(196, 78, 82, 0.8)',
									'rgba(196, 78, 82, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '27',
							data : [ 686, 60, 466 ],
							backgroundColor : [ 'rgba(129, 114, 179, 0.8)',
									'rgba(129, 114, 179, 0.8)',
									'rgba(129, 114, 179, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '28',
							data : [ 358, 52, 242 ],
							backgroundColor : [ 'rgba(147, 120, 96, 0.8)',
									'rgba(147, 120, 96, 0.8)',
									'rgba(147, 120, 96, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '29',
							data : [ 135, 24, 126 ],
							backgroundColor : [ 'rgba(218, 139, 195, 0.8)',
									'rgba(218, 139, 195, 0.8)',
									'rgba(218, 139, 195, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '30',
							data : [ 60, 12, 35 ],
							backgroundColor : [ 'rgba(140, 140, 140, 0.8)',
									'rgba(140, 140, 140, 0.8)',
									'rgba(140, 140, 140, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '31',
							data : [ 14, 1, 11 ],
							backgroundColor : [ 'rgba(204, 185, 116, 0.8)',
									'rgba(204, 185, 116, 0.8)',
									'rgba(204, 185, 116, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '32',
							data : [ 6, 0, 1 ],
							backgroundColor : [ 'rgba(100, 181, 205, 0.8)',
									'rgba(100, 181, 205, 0.8)',
									'rgba(100, 181, 205, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '33',
							data : [ 3, 0, 0 ],
							backgroundColor : [ 'rgba(76, 114, 176, 0.8)',
									'rgba(76, 114, 176, 0.8)',
									'rgba(76, 114, 176, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '34',
							data : [ 3, 1, 0 ],
							backgroundColor : [ 'rgba(221, 132, 82, 0.8)',
									'rgba(221, 132, 82, 0.8)',
									'rgba(221, 132, 82, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '35',
							data : [ 2, 0, 1 ],
							backgroundColor : [ 'rgba(85, 168, 104, 0.8)',
									'rgba(85, 168, 104, 0.8)',
									'rgba(85, 168, 104, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						}, ]
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
	</script>

	<!-- Gender -->
	<script>
		var ctx = document.getElementById('myChart05');
		var myChart05 = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ 'Completed', 'Refunded', 'Cancelled' ],
				datasets : [
						{
							label : '1',
							data : [ 913, 130, 948 ],
							backgroundColor : [ 'rgba(76, 114, 176, 0.8)',
									'rgba(76, 114, 176, 0.8)',
									'rgba(76, 114, 176, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '2',
							data : [ 2721, 240, 754 ],
							backgroundColor : [ 'rgba(221, 132, 82, 0.8)',
									'rgba(221, 132, 82, 0.8)',
									'rgba(221, 132, 82, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						} ]
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
	</script>

	<!-- Channel -->
	<script>
		var ctx = document.getElementById('myChart06');
		var myChart06 = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ 'Completed', 'Refunded', 'Cancelled' ],
				datasets : [
						{
							label : '301',
							data : [ 447, 8, 486 ],
							backgroundColor : [ 'rgba(76, 114, 176, 0.8)',
									'rgba(76, 114, 176, 0.8)',
									'rgba(76, 114, 176, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '302',
							data : [ 561, 234, 77 ],
							backgroundColor : [ 'rgba(221, 132, 82, 0.8)',
									'rgba(221, 132, 82, 0.8)',
									'rgba(221, 132, 82, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '303',
							data : [ 1239, 31, 300 ],
							backgroundColor : [ 'rgba(85, 168, 104, 0.8)',
									'rgba(85, 168, 104, 0.8)',
									'rgba(85, 168, 104, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '304',
							data : [ 125, 16, 181 ],
							backgroundColor : [ 'rgba(196, 78, 82, 0.8)',
									'rgba(196, 78, 82, 0.8)',
									'rgba(196, 78, 82, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '305',
							data : [ 120, 7, 44 ],
							backgroundColor : [ 'rgba(129, 114, 179, 0.8)',
									'rgba(129, 114, 179, 0.8)',
									'rgba(129, 114, 179, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '306',
							data : [ 688, 71, 252 ],
							backgroundColor : [ 'rgba(147, 120, 96, 0.8)',
									'rgba(147, 120, 96, 0.8)',
									'rgba(147, 120, 96, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '307',
							data : [ 454, 3, 362 ],
							backgroundColor : [ 'rgba(218, 139, 195, 0.8)',
									'rgba(218, 139, 195, 0.8)',
									'rgba(218, 139, 195, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						} ]
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
	</script>

	<!-- Week(clean) -->
	<script>
		var ctx = document.getElementById('myChart07');
		var myChart07 = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ 'Completed', 'Refunded', 'Cancelled' ],
				datasets : [
						{
							label : '1',
							data : [ 782, 65, 352 ],
							backgroundColor : [ 'rgba(76, 114, 176, 0.8)',
									'rgba(76, 114, 176, 0.8)',
									'rgba(76, 114, 176, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '2',
							data : [ 787, 73, 396 ],
							backgroundColor : [ 'rgba(221, 132, 82, 0.8)',
									'rgba(221, 132, 82, 0.8)',
									'rgba(221, 132, 82, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '3',
							data : [ 746, 100, 331 ],
							backgroundColor : [ 'rgba(85, 168, 104, 0.8)',
									'rgba(85, 168, 104, 0.8)',
									'rgba(85, 168, 104, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '4',
							data : [ 999, 103, 465 ],
							backgroundColor : [ 'rgba(196, 78, 82, 0.8)',
									'rgba(196, 78, 82, 0.8)',
									'rgba(196, 78, 82, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '5',
							data : [ 320, 29, 158 ],
							backgroundColor : [ 'rgba(129, 114, 179, 0.8)',
									'rgba(129, 114, 179, 0.8)',
									'rgba(129, 114, 179, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						} ]
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
	</script>

	<!-- Day of Week-->
	<script>
		var ctx = document.getElementById('myChart08');
		var myChart08 = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ 'Completed', 'Refunded', 'Cancelled' ],
				datasets : [
						{
							label : '200',
							data : [ 447, 8, 486 ],
							backgroundColor : [ 'rgba(76, 114, 176, 0.8)',
									'rgba(76, 114, 176, 0.8)',
									'rgba(76, 114, 176, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '201',
							data : [ 561, 234, 77 ],
							backgroundColor : [ 'rgba(221, 132, 82, 0.8)',
									'rgba(221, 132, 82, 0.8)',
									'rgba(221, 132, 82, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '203',
							data : [ 1239, 31, 300 ],
							backgroundColor : [ 'rgba(85, 168, 104, 0.8)',
									'rgba(85, 168, 104, 0.8)',
									'rgba(85, 168, 104, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '204',
							data : [ 125, 16, 181 ],
							backgroundColor : [ 'rgba(196, 78, 82, 0.8)',
									'rgba(196, 78, 82, 0.8)',
									'rgba(196, 78, 82, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '205',
							data : [ 120, 7, 44 ],
							backgroundColor : [ 'rgba(129, 114, 179, 0.8)',
									'rgba(129, 114, 179, 0.8)',
									'rgba(129, 114, 179, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '206',
							data : [ 688, 71, 252 ],
							backgroundColor : [ 'rgba(147, 120, 96, 0.8)',
									'rgba(147, 120, 96, 0.8)',
									'rgba(147, 120, 96, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						},
						{
							label : '207',
							data : [ 454, 3, 362 ],
							backgroundColor : [ 'rgba(218, 139, 195, 0.8)',
									'rgba(218, 139, 195, 0.8)',
									'rgba(218, 139, 195, 0.8)' ],
							borderColor : [ 'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)',
									'rgba(255, 255, 255, 1)' ],
							borderWidth : 1
						} ]
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
	</script>

</body>

</html>


