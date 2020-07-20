<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>입고관리</title>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/JS/logistics/inbound.js"></script>
</head>
<body>
	<div class="container-fluid" id="main">
		<div class="row row-offcanvas row-offcanvas-left">

			<!-- 본문, 내가 할 거 -->
			<div class="col main pt-5 mt-3">
				<h1 class="display-4 d-none d-sm-block">YES25 입고관리</h1>
				<hr>

				<%--버튼 --%>
				<div class="container text-right">
					<button type="button" id="btnInbound" class="btn btn-primary">입고</button>
				</div>

				<div class="row my-4">
					<div class="col-lg-10 col-md-9">
						<div id="list" class="table-responsive">
							<form id="frmList" name="frmList">
								<table class="table table-striped">
									<thead class="thead-inverse">
										<tr>
											<th>번호선택</th>
											<th>발주번호</th>
											<th>도서번호</th>
											<th>단위가격</th>
											<th>발주수량</th>
											<th>발주일자</th>
											<th>발주상태</th>
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>

		


			</div>
			<!--/main col-->
			<!-- 본문, 내가 할 거 끝 -->
		</div>

	</div>

	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<script src="${pageContext.request.contextPath}/JS/scripts.js"></script>
</body>
</html>