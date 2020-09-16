<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en" class="fullscreen-bg">

<head>
	<title>2nd Project - Guard</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="/common/assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/common/assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/common/assets/vendor/linearicons/style.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="/common/assets/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="/common/assets/css/demo.css">
	<link rel="stylesheet" href="/common/assets/css/admin.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="/common/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/common/assets/img/favicon.png">
</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box lockscreen clearfix">
					<div class="content">
						<h1 class="sr-only">Klorofil - Free Bootstrap dashboard</h1>
						<div class="user text-center">
							<img src="/common/assets/img/admin_ico.png" class="img-circle" alt="Avatar">
							<h2 class="name">관리자</h2>
						</div>
						<form name="frm" action="/common/adm/loginTry" onsubmit="return fn_logincheck();" method="post">
							<div class="input-group input_id">
								<input type="text" class="form-control" name="ADM_ID" id="ADM_ID" placeholder="ID">
							</div>
							<div class="input-group">
								<input type="password" class="form-control" name="ADM_PW" id="ADM_PW" placeholder="PASSWORD">
								<span class="input-group-btn"><button type="submit" class="btn btn-primary" ><i class="fa fa-arrow-right"></i></button></span>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="/common/assets/js/admin.js"></script>
	
</body>

</html>
