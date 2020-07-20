<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>서점ERP시스템</title>
    
    
    
    
    <!-- Latest compiled and minified CSS --> 
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> 
	
	<!-- jQuery library --> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
	
	<!-- Popper JS --> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> 
	
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    
    
    
    <!-- jQuery 선언 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <!-- 내 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/JS/financial/main.js"></script>
    
    
    <!-- 내 CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/CSS/financial/main.css"/>
      

    
  </head>

<!---------------------------------------------------------------------------------->  
<script>
function chkSubmit(){  // 폼 검증
	
	// 리턴값 ture과 false를 통해
	// 필수 작성 사항을 누락했는지 확인하는 함수 만들기
	// 나중에 잊지말고 external로 빼기
	
}

</script>
<!---------------------------------------------------------------------------------->  



<body>
        
        
        
<!-- 작업페이지 -->
<!-- 월별 매출 그래프 -->
<h1 class="display-4 d-none d-sm-block">월별 매출 그래프</h1>

<!-- 연매출 그래프 -->
<h1 class="display-4 d-none d-sm-block">연 매출 그래프</h1>



<!-- 결제를 기다리고 있는 전표 목록 -->








<!-- 내가 작상한 전표 목록보기 -->
<h1 class="display-4 d-none d-sm-block">작성한 전표 목록</h1>

<!-- 몇개의 글 리스트가 있는지 노출 -->


<%-- 글목록 --%>
<div id="list">
	<div class="d01">
		<div class="left" id="pageinfo"></div>
		<div class="right" id="pageRows"></div>
	</div>
	
	<div class="clear"></div>
	
	<form id="frmList" name="frmList">
	
	<table>
		<thead>
			<th>전표번호</th>
			<th>날짜</th>
			<th>계정과목</th>
			<th>적요</th>
			<th>금액</th>
		</thead>
		
		<tbody>
		
		</tbody>
	</table>
	
	</form>
	
	<%--버튼 --%>
	<div class="d01">
		<div class="left">
			<button type="button" id="btnDel" class="btn danger">전표삭제</button>
		</div>
		<div class="right">
			<button type="button" data-target="#UpdateModal" data-toggle="modal" 
				class="btn success btn-toggle" id="btnWrite">전표수정</button>
		</div>	
	</div>
</div>


<!-- 페이징 -->
<br><br>
<div class="center">
	<ul class="pagination" id="pagination"></ul>
</div>


<button type="button" data-toggle="modal" data-target="#WriteModal"
	class="btn-toggle" id="btnWrite">전표입력</button>
<button>목록보기</button>
<button>손익계산서 확인</button>




<br><br><br><br><br>
<!-- 글작성 모달창 -->
<div id="WriteModal" class="modal fade bs-example-modal-lg" 
	data-backdrop="static" data-keyboard="false" role="dialog" 
	tabindex="-1" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	
	<!-- Modal content-->
	<div class="modal-dialog modal-lg">
	<div class="modal-content">
	
	<!-- Modal 헤더 -->
	<div class="modal-header ">전표입력</div>
	
	<form id="frmWrite" name="frmWrite" method="post">
		<!-- Modal 텍스트 문구 -->
		<div class= "modal-body">
				<label for="manager">담당자</label>
				<input type="number" name="manager" required><button>담당자 선택</button>
				&nbsp;&nbsp;&nbsp;>&nbsp;
				<label for="approver">결재자</label>
				<input type="number" name="approver" required><button>결재자 선택</button><br>

				<br><br><br>
				<table>
					<tr>
						<th><label for="regDate">날짜</label></th>
						<th><label for="account_uid">계정과목</label></th>
						<th><label for="summary">적요</label></th>
						<th><label for="money">금액</label></th>
					</tr>
					
					<tr>
						<td>
							<input type="text" name="regDate" required>
						</td>
						<td>
							<input type="number" name="account_uid" required>
						</td>
						<td>
							<input type="text" name="summary" required>
						</td>
						<td>
							<input type="number" name="money" required>
						</td>
					</tr>
				</table>
				 
				<button>증빙 파일 등록</button><br><br><br>
				
				
				<label for="writer">작성자</label>
				<input type="number" name="writer" required><br>
		</div>
		
		<!-- Modal 푸터 -->
		<footer class="modal-footer">
		  <!-- btn-dismiss 모달 닫는 버튼, data-dismiss="modal" -->
		  <button class="btn-dismiss" type="button" data-dismiss="modal">취소</button>
		  
		  <button data-toggle = "modal" type="submit">등록</button>
		</footer>
	</form>
	</div>
	</div>
</div>





</body>
</html>