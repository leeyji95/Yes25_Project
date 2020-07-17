<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>재고현황</title>
<meta name="description"
	content="A Bootstrap 4 admin dashboard theme that will get you started. The sidebar toggles off-canvas on smaller screens. This example also include large stat blocks, modal and cards. The top navbar is controlled by a separate hamburger toggle button." />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="Codeply">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/logistics/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/logistics/gd5-style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/logistics/non-responsive.css" />

<script src="${pageContext.request.contextPath }/resources/JS/board.js"></script>




</head>
<body>
	<div class="container-fluid" id="main">
		<div class="row row-offcanvas row-offcanvas-left">

			<!-- 본문, 내가 할 거 -->
			<div id="container-wrap" class="container-fluid">
				<div id="container" class="row">
					<div id="header" class="col-xs-12">
						<nav class="navbar"></nav>



						<!-- 고도 사이트로 이동 시작 -->
						<form name="frmGotoGodomall" action="" method="post">
							<input type="hidden" name="pageKey" value="332317"> <input
								type="hidden" name="sno" value="332317"> <input
								type="hidden" name="mode" value="">
						</form>

						<div id="panel_popupPanel"></div>
					</div>

					<div id="content-wrap">
						<div id="menu"></div>
						<div id="content" class="row">
							<div class="col-xs-12">
								<div class="page-header js-affix">
									<h3>재고현황</h3>

								</div>


								<!-- 검색을 위한 form -->
								<form id="frmSearchOrder" method="get"
									class="js-form-enter-submit">
									<input type="hidden" name="detailSearch" value="" />

									<div class="table-title gd-help-manual">
										검색 조건 <span class="search">
											<button type="button" class="btn btn-sm btn-black"
												onclick="set_search_config(this.form, 'n')">검색</button>
										</span>
									</div>

									<div class="search-detail-box">
										<table class="table table-cols">
											<colgroup>
												<col class="width-sm">
												<col>
												<col class="width-sm">
												<col>
											</colgroup>
											<tbody>

												<tr>
													<th>검색어</th>
													<td colspan="3">
														<div class="form-inline">
															<select class=" form-control " id="key" name="key">
																<option value="#">선택</option>
																<option value="#">서명</option>
																<option value="#">저자</option>
																<option value="#">ISBN</option>
																<option value="#">출판사</option>
															</select>
															<div class="input-group">
																<input type="text" name="keyword" value=""
																	class="form-control width300" placeholder="검색어를 입력하세요.">
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th>재고위치</th>
													<td colspan="3">
														<div class="form-inline">
															<select class=" form-control " id="key" name="key">
																<option value="#">선택</option>
																<option value="#">창고</option>
																<option value="#">매장</option>
															</select>
														</div>
													</td>
												</tr>

												<tr>
													<th>카테고리</th>
													<td colspan="3">
														<div class="form-inline">
															<select class=" form-control " id="key" name="key">
																<option value="#">선택</option>
																<option value="#">인문</option>
																<option value="#">과학</option>
																<option value="#">문학</option>
																<option value="#">경제</option>
																<option value="#">생활</option>
															</select>
														</div>
													</td>
												</tr>

												<tr>
													<th>기간검색</th>
													<td colspan="3">
														<div class="form-inline">
															<select class=" form-control " id="treatDateFl"
																name="treatDateFl">
																<option value="og.regDt" selected="selected">선택</option>
																<option value="og.paymentDt">출간일자</option>
																<option value="og.invoiceDt">등록일자</option>
															</select>
															<div class="input-group js-datepicker">
																<input type="text" name="treatDate[]" value="2020-07-11"
																	class="form-control width-xs"> <span
																	class="input-group-addon"> <span
																	class="btn-icon-calendar"> <i
																		class="far fa-calendar-alt"></i>
																</span>
																</span>
															</div>
															~
															<div class="input-group js-datepicker">
																<input type="text" name="treatDate[]" value="2020-07-17"
																	class="form-control width-xs"> <span
																	class="input-group-addon"> <span
																	class="btn-icon-calendar"> <i
																		class="far fa-calendar-alt"></i>
																</span>
																</span>
															</div>

															<div class="btn-group js-dateperiod"
																data-toggle="buttons" data-target-name="treatDate[]">
																<label class="btn btn-white btn-sm hand "><input
																	type="radio" name="searchPeriod" value="0">오늘</label><label
																	class="btn btn-white btn-sm hand "><input
																	type="radio" name="searchPeriod" value="6">7일</label><label
																	class="btn btn-white btn-sm hand "><input
																	type="radio" name="searchPeriod" value="14">15일</label><label
																	class="btn btn-white btn-sm hand "><input
																	type="radio" name="searchPeriod" value="29">1개월</label><label
																	class="btn btn-white btn-sm hand "><input
																	type="radio" name="searchPeriod" value="89">3개월</label><label
																	class="btn btn-white btn-sm hand "><input
																	type="radio" name="searchPeriod" value="364">1년</label>
															</div>
														</div>
													</td>
												</tr>
											</tbody>
											<tbody class="js-search-detail">

											</tbody>
										</table>
									</div>




									<div class="table-header table-header-tab">
										<div class="pull-left">
											검색 <strong class="text-danger">3</strong>개 / 전체 <strong
												class="text-danger">3</strong>개 ( 검색된 주문 총 결제금액 : <span
												class="text-danger">633,600</span>원 )
										</div>
										<div class="pull-right">
											<div class="form-inline">
												<select class="form-control " id="pageNum" name="pageNum">
													<option value="10">10개 보기</option>
													<option value="20" selected="selected">20개 보기</option>
													<option value="30">30개 보기</option>
													<option value="40">40개 보기</option>
													<option value="50">50개 보기</option>
													<option value="60">60개 보기</option>
													<option value="70">70개 보기</option>
													<option value="80">80개 보기</option>
													<option value="90">90개 보기</option>
													<option value="100">100개 보기</option>
													<option value="200">200개 보기</option>
													<option value="300">300개 보기</option>
													<option value="500">500개 보기</option>
												</select>

											</div>
										</div>
									</div>
									<input type="hidden" name="view" value="order" /> <input
										type="hidden" name="searchFl" value="y"> <input
										type="hidden" name="applyPath"
										value="/order/order_list_all.php?view=order">
								</form>
								<!-- // 검색을 위한 form -->


								<input type="hidden" name="mode" value="combine_status_change" />
								<input type="hidden" id="orderStatus" name="changeStatus"
									value="" />
								<div class="table-action-dropdown">
									<div class="table-action mgt0 mgb0">
										<div class="pull-right"></div>
									</div>
								</div>

								<div class="table-responsive">
									<table class="table table-rows order-list">
										<thead>
											<tr>
												<th>번호</th>
												<th>서명</th>
												<th>저자</th>
												<th>ISBN</th>
												<th>출판사명</th>
												<th>재고위치</th>
												<th>출간일자</th>
												<th>등록일자</th>
												<th>잔여재고</th>

											</tr>
										</thead>
										<tbody>
											<tr class="text-center" data-mall-sno="1">
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
											<tr class="text-center" data-mall-sno="1">
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
											<tr class="text-center" data-mall-sno="1">
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>

										</tbody>
									</table>
								</div>
								<form>
								<div class="table-action">
									<div class="pull-right">
										<button type="button"
											class="btn btn-white btn-icon-excel js-excel-download"
											data-target-form="frmSearchOrder" data-search-count="3"
											data-total-count="3" data-state-code=""
											data-target-list-form="frmOrderStatus"
											data-target-list-sno="statusCheck">엑셀다운로드</button>
									</div>
								</div>
								</form>
								<div class="text-center">
									<nav>
										<ul class="pagination pagination-sm">
											<li class="active"><span>1</span></li>
										</ul>
									</nav>
								</div>
							</div>
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