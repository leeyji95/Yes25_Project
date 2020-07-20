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
<style>
    [class^='col-sm'] {
        padding: 4%;
    }
    
    .pagination {
   		justify-content: center;
   	}
   	
   	.pagination li {
   		cursor: pointer;
   	}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath }/JS/purchase/purchase.js"></script>

<body>
    <div class="container-fluid">
        <div class="row">
        	<!-- 거래처 목록 -->
            <div class="col-sm-6">
                <div class="card">
                <div class="card-header bg-dark text-white">거래처 목록</div>
                <div class="card-body">
                    <div class="table-responsive table-hover">
                        <table class="table">
                            <thead class="thead-inverse">
                                <tr>
                                    <th>거래처명</th>
                                    <th>대표자명</th>
                                    <th>연락처</th>
                                </tr>
                            </thead>
                            <tbody id="publisher-list">
                            </tbody>
                        </table>
                    </div>
                </div>
	            <ul class="pagination" id="pagination"></ul>
                </div>
            </div>
           	
			<div class="col-sm-6">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#pub-reg-tab">거래처 등록</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#pub-search-tab">거래처 검색</a></li>
				</ul>

				<div class="tab-content">
					<!-- 거래처 등록 -->
					<div class="tab-pane fade show active" id="pub-reg-tab">
						<div class="card">
							<div class="card-header bg-dark text-white">거래처 등록</div>
							<div class="card-body">
								<form role="form" id="reg-pub">
									<div class="form-group">
										<label for="name">거래처명</label>
										<input type="text" class="form-control" name="pub_name" placeholder="거래처명" required>
									</div>
									<div class="form-group">
										<label for="num">사업자 등록번호</label>
										<input type="text" class="form-control" name="pub_num"	placeholder="사업자 등록번호" required>
									</div>
									<div class="form-group">
										<label for="rep">대표자명</label>
										<input type="text" class="form-control" name="pub_rep"	placeholder="대표자명">
									</div>
									<div class="form-group">
										<label for="contact">연락처</label>
										<input type="text" class="form-control" name="pub_contact"	placeholder="연락처">
									</div>
									<div class="form-group">
										<label for="address">주소</label>
										<input type="text" class="form-control" name="pub_address"	placeholder="주소">
									</div>

									<div class="form-group text-right">
										<button type="reset" id="reset" class="btn btn-warning">
											초기화<i class="fa fa-refresh spaceLeft"></i>
										</button>
										<button id="insert" class="btn btn-primary">
											등록<i class="fa fa-check spaceLeft"></i>
										</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					
					<!-- 거래처 검색 -->
					<div class="tab-pane fade" id="pub-search-tab">
		              <div class="card">
		                <div class="card-header bg-dark text-white">거래처 검색</div>
		                <div class="card-body">
		                	<!--  -->
		                	<form role="form" id="pub-search" onsubmit="return false">
								<div class="form-group row justify-content-center">
									<div style="padding-right: 10px">
										<select class="form-control" name="searchType" id="searchType">
											<option value="pub_name">거래처명</option>
											<option value="pub_rep">대표자명</option>
											<option value="all">전체</option>
										</select>
									</div>
									<div style="padding-right: 10px">
										<input type="text" class="form-control" name="keyword" id="keyword">
									</div>
									<div>
										<button type="button" class="btn btn-primary" id="search">검색</button>
									</div>
								</div>
							</form>
							<!--  -->
		                </div>
		              </div>
					</div>
				</div>
			</div>

		</div>
    </div>
</body>

<div class="modal" id="pub-info">
	<form role="form" id="edit-pub" method="post">
	<input type="hidden" id="pub_uid" name="pub_uid">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title"></h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<table class="table table-boardered">
						<tr>
							<th>거래처명</th>
							<td><input type="text" class="form-control" name="pub_name" placeholder="거래처명" required></td>
						</tr>
						<tr>
							<th>사업자 등록번호</th>
							<td><input type="text" class="form-control" name="pub_num" placeholder="사업자 등록번호" required></td>
						</tr>
						<tr>
							<th>대표자명</th>
							<td><input type="text" class="form-control" name="pub_rep" placeholder="대표자명"></td>
						</tr>
						<tr>
							<th>연락처</th>
							<td><input type="text" class="form-control" name="pub_contact" placeholder="연락처"></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input type="text" class="form-control" name="pub_address" placeholder="주소"></td>
						</tr>																					
					</table>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<div id="view-btns">
						<button type="button" id="delete" class="btn btn-danger">삭제</button>
						<button type="button" id="update" class="btn btn-success">수정</button>
					</div>
					<div id="update-btns">
						<button type="button" id="cancel" class="btn btn-danger">취소</button>
						<button type="button" id="apply" class="btn btn-primary">적용</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>

</html>