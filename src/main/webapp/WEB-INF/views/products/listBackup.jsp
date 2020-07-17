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
	href="${pageContext.request.contextPath}/CSS/styles.css" />
</head>
<body>
	<nav
		class="navbar fixed-top navbar-expand-md navbar-dark bg-primary mb-3">
		<div class="flex-row d-flex">
			<button type="button" class="navbar-toggler mr-2 "
				data-toggle="offcanvas" title="Toggle responsive left sidebar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<a class="navbar-brand" href="#"
				title="Free Bootstrap 4 Admin Template">YES25 서점ERP시스템</a>
		</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsingNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="navbar-collapse collapse" id="collapsingNavbar">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">Home</span>
				</a></li>
				<li class="nav-item"><a class="nav-link">Link</a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="#myAlert"
					data-toggle="collapse">Alert</a></li>
				<li class="nav-item"><a class="nav-link" href=""
					data-target="#myModal" data-toggle="modal">About</a></li>
			</ul>
		</div>
	</nav>
	<div class="container-fluid" id="main">
		<div class="row row-offcanvas row-offcanvas-left">
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

			<!-- 본문, 내가 할 거 -->
			<div class="col main pt-5 mt-3">
				<h1 class="display-4 d-none d-sm-block">YES25 도서관리</h1>

				<hr>
				<p class="lead mt-5">Are you ready for Bootstap 4? It's the 4th
					generation of this popular responsive framework. Bootstrap 4 will
					include some interesting new features such as flexbox, 5 grid sizes
					(now including xl), cards, `em` sizing, CSS normalization (reboot)
					and larger font sizes.</p>
				<div class="row my-4">
					<div class="col-lg-10 col-md-9">
						<div class="table-responsive">
							<table class="table table-striped">
								<thead class="thead-inverse">
									<tr>
										<th>#</th>
										<th>Label</th>
										<th>Header</th>
										<th>Column</th>
										<th>Data</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1,001</td>
										<td>responsive</td>
										<td>bootstrap</td>
										<td>cards</td>
										<td>grid</td>
									</tr>
									<tr>
										<td>1,002</td>
										<td>rwd</td>
										<td>web designers</td>
										<td>theme</td>
										<td>responsive</td>
									</tr>
									<tr>
										<td>1,003</td>
										<td>free</td>
										<td>open-source</td>
										<td>download</td>
										<td>template</td>
									</tr>
									<tr>
										<td>1,003</td>
										<td>frontend</td>
										<td>developer</td>
										<td>coding</td>
										<td>card panel</td>
									</tr>
									<tr>
										<td>1,004</td>
										<td>migration</td>
										<td>bootstrap 4</td>
										<td>mobile-first</td>
										<td>design</td>
									</tr>
									<tr>
										<td>1,005</td>
										<td>navbar</td>
										<td>sticky</td>
										<td>jumbtron</td>
										<td>header</td>
									</tr>
									<tr>
										<td>1,006</td>
										<td>collapse</td>
										<td>affix</td>
										<td>submenu</td>
										<td>flexbox</td>
									</tr>
									<tr>
										<td>1,007</td>
										<td>layout</td>
										<td>examples</td>
										<td>themes</td>
										<td>grid</td>
									</tr>
									<tr>
										<td>1,008</td>
										<td>migration</td>
										<td>bootstrap 4</td>
										<td>flexbox</td>
										<td>design</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!--/row-->



			</div>
			<!--/main col-->
			<!-- 본문, 내가 할 거 끝 -->
		</div>

	</div>
	<!--/.container-->
	<footer class="container-fluid">
		<p class="text-right small">©2016-2018 Company</p>
	</footer>


	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Modal</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
					</button>
				</div>
				<div class="modal-body">
					<p>This is a dashboard layout for Bootstrap 4. This is an
						example of the Modal component which you can use to show content.
						Any content can be placed inside the modal and it can use the
						Bootstrap grid classes.</p>
					<p>
						<a href="https://www.codeply.com/go/KrUO8QpyXP" target="_ext">Grab
							the code at Codeply</a>
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary-outline"
						data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
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