<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<title>2nd Project - Elements</title>
<meta charset="utf-8">
<meta http-equiv="refresh" content="10; URL='/common/views/admin/charts.jsp'">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!-- VENDOR CSS -->
<link rel="stylesheet"
	href="/common/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/common/assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/common/assets/vendor/linearicons/style.css">
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
<!-- LOADING -->
<link rel="stylesheet" type="text/css" href="/common/assets/css/custom.css">
<link rel="stylesheet" type="text/css" href="/common/assets/css/wdtLoading.css">
<link rel="stylesheet" type="text/css" href="/common/assets/css/loading-bar.css">
</head>

<body class="layout-fullwidth loading-body">
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<!-- END NAVBAR -->

		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-4 loading-main">
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title loading-title">데이터를 분석중입니다.</h3>
								</div>
								<div class="panel-body">
									<div class="wdt-loading-screen">
										<div class="wdt-loading-phrases">
											<div class="wdt-loading-phrase-category"
												data-category="default">
												<div class="wdt-loading-phrase">Doing great things...</div>
												<div class="wdt-loading-phrase">Coffee break...</div>
												<div class="wdt-loading-phrase">Feeding cats...</div>
												<div class="wdt-loading-phrase">Health check...</div>
												<div class="wdt-loading-phrase">Storage check...</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

							<div class="row">
						<div class="col-md-4 loading-main">
						<div id="loadingbar">

								</div>
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
					&copy; 2019 <a href="#" target="_blank">Ezen. 1401</a>. All Rights Reserved.
				</p>
			</div>
		</footer>
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="/common/assets/vendor/jquery/jquery.min.js"></script>
	<script src="/common/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/common/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="/common/assets/scripts/klorofil-common.js"></script>
	<script src="/common/assets/scripts/wdtLoading.js" type="text/javascript"></script>
	<script src="/common/assets/scripts/loading-bar.js" type="text/javascript"></script>

	<script type="text/javascript">
		wdtLoading.start();

		setTimeout(function() {
			wdtLoading.done();
		}, 1226500);
	</script>
	
	
<script type="text/javascript">
var bar = new ProgressBar.Line(loadingbar, {
	  strokeWidth: 4,
	  easing: 'easeInOut',
	  duration: 5000,
	  color: '#FFEA82',
	  trailColor: '#eee',
	  trailWidth: 1,
	  svgStyle: {width: '100%', height: '100%'},
	  text: {
	    style: {
	      // Text color.
	      // Default: same as stroke color (options.color)
	      color: '#999',
	      position: 'absolute',
	      right: '0',
	      top: '30px',
	      padding: 0,
	      margin: 0,
	      transform: null
	    },
	    autoStyleContainer: false
	  },
	  from: {color: '#FFEA82'},
	  to: {color: '#ED6A5A'},
	  step: (state, bar) => {
	    bar.setText(Math.round(bar.value() * 100) + ' %');
	    bar.path.setAttribute('stroke', state.color);
	  }
	});

	bar.animate(1.0);  // Number from 0.0 to 1.0
</script>

<!-- <script type="text/javascript">
var bar = new ProgressBar.Circle(loadingbar, {
	  color: '#aaa',
	  // This has to be the same size as the maximum width to
	  // prevent clipping
	  strokeWidth: 4,
	  trailWidth: 1,
	  easing: 'easeInOut',
	  duration: 5000,
	  text: {
	    autoStyleContainer: false
	  },
	  from: { color: '#FFEA82', width: 1 },
	  to: { color: '#ED6A5A', width: 1 },
	  // Set default step function for all animate calls
	  step: function(state, circle) {
	    circle.path.setAttribute('stroke', state.color);
	    circle.path.setAttribute('stroke-width', state.width);

	    var value = Math.round(circle.value() * 100);
	    if (value === 0) {
	      circle.setText('');
	    } else {
	      circle.setText(value);
	    }

	  }
	});
	bar.text.style.fontFamily = '"Raleway", Helvetica, sans-serif';
	bar.text.style.fontSize = '2rem';

	bar.animate(1.0);  // Number from 0.0 to 1.0
</script> -->

</body>

</html>
    