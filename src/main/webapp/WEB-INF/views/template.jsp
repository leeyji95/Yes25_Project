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
<jsp:include page="nav.jsp"/>

	<div class="container-fluid" id="main">
		<div class="row row-offcanvas row-offcanvas-left">
 			<jsp:include page="left_menu.jsp"/>
			<!-- 본문, 내가 할 거 -->
			<div class="col main pt-5 mt-3">
				<h1 class="display-4 d-none d-sm-block">YES25 근태관리</h1>
				<hr>
				<!-- 검색창 -->
				<div>
				<select>
				<option>제목</option>
				<option>내용</option>
				<option>저자</option>
				<option>출판사</option>
				</select>
				
				<input type="text" name="keyword">
				<input type="button" value="검색">
				</div>
				<!-- 검색창 끝 -->
				
				<div class="row my-4">
					<div class="col-lg-10 col-md-9">
						<div class="table-responsive">
							<table class="table table-striped">
								<thead class="thead-inverse">
									<tr>
										<th>번호</th>
										<th>사진</th>
										<th>내용</th>
										<th>가격</th>
										<th>수정 삭제</th>
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

	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<script src="${pageContext.request.contextPath}/JS/scripts.js"></script>
</body>
</html>