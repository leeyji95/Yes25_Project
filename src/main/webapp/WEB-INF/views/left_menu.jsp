<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왼쪽메뉴바</title>
<meta name="description"
	content="A Bootstrap 4 admin dashboard theme that will get you started. The sidebar toggles off-canvas on smaller screens. This example also include large stat blocks, modal and cards. The top navbar is controlled by a separate hamburger toggle button." />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="Codeply">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/CSS/styles.css" />
</head>
<body>

	<div class="col-md-3 col-lg-2 sidebar-offcanvas bg-light pl-0"
		id="sidebar" role="navigation">
		<ul class="nav flex-column sticky-top pl-0 pt-5 mt-3">
			<li class="nav-item"><a class="nav-link" href="#">Dashboard</a></li>
			<li class="nav-item"><a class="nav-link" href="#"
				data-toggle="collapse" data-target="#submenu1">매출</a>
				<ul class="list-unstyled flex-column pl-3 collapse" id="submenu1"
					aria-expanded="false">
					<li class="nav-item"><a class="nav-link" href="#">매출관리 1</a></li>
					<li class="nav-item"><a class="nav-link" href="#">매출관리 2</a></li>
				</ul></li>
			<li class="nav-item"><a class="nav-link" href="#">물류</a></li>
			<li class="nav-item"><a class="nav-link" href="#">상품</a></li>
			<li class="nav-item"><a class="nav-link" href="#">구매</a></li>
			<li class="nav-item"><a class="nav-link" href="#">인사</a></li>
			<!-- <li class="nav-item"><a class="nav-link" href="#">Layouts</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Templates</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Themes</a></li> -->
		</ul>
	</div>
	<!--/col-->


<!-- 	<div class="col main pt-5 mt-3">
		<h1 class="display-4 d-none d-sm-block">YES25 Dashboard</h1>

		<div class="alert alert-warning fade collapse" role="alert"
			id="myAlert">
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
			</button>
			<strong>이것은 알림입니다!</strong> 알릴 내용 입력해주세요.
		</div>
	</div> -->

	<!--scripts loaded here-->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<script src="${pageContext.request.contextPath}/JS/scripts.js"></script>
</body>
</html>
