<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서관리</title>
<meta name="description"
	content="A Bootstrap 4 admin dashboard theme that will get you started. The sidebar toggles off-canvas on smaller screens. This example also include large stat blocks, modal and cards. The top navbar is controlled by a separate hamburger toggle button." />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="Codeply">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/CSS/personnel/main.css" />
</head>
<body>
	<jsp:include page="nav.jsp" />

	<div class="container-fluid" id="main">
		<div class="row row-offcanvas row-offcanvas-left">
			<jsp:include page="left_menu.jsp" />

			<!-- 본문, 내가 할 거 -->
			<div class="col main pt-5 mt-3">
				<h1 class="display-4 d-none d-sm-block">이예지 사원님의 근태현황</h1>
				<hr>
				<div class="col-mb-3">
					<!-- 물결 슬라이드 컨테이너 -->
					<div class="container">
						<div class="cont">
							<div class="app">
								<div class="app__bgimg">
									<div class="app__bgimg-image app__bgimg-image--1"></div>
								</div>
								<div class="app__img">
									<img onmousedown="return false"
										src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/537051/whiteTest4.png"
										width="1050px" height="2000px" alt="city" />
								</div>

								<div class="app__text app__text--1">
									<div class="app__text-line app__text-line--4">
										<p style="font-size: 26px; margin: 0px; padding: 5px 0;">버튼을
											눌러 출근을 기록하세요</p>
										<!-- 출근/ 퇴근 버튼-->
										<div class="btn-group btn-group-toggle" data-toggle="buttons">
											<div class="top-buttons">
												<button class="to-signup top-active-button">출근</button>
												<button class="to-signin">퇴근</button>
											</div>
										</div>
									</div>

									<!-- date 박스 -->
									<div class="box app__text-line app__text-line--3">
										<div class="date">
											<div id="daymonthyear"></div>
										</div>
										<div class="time">
											<div id="hourminutesecond"></div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
					<!-- 끝! 물결 슬라이드 -->

				</div>
			</div>
		</div>
		<!--/main col-->
		<!-- 본문, 내가 할 거 끝 -->
	</div>


	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/JS/personnel/main.js"></script>
</body>
</html>