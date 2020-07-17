<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>서점ERP시스템</title>
    <meta name="description" content="A Bootstrap 4 admin dashboard theme that will get you started. The sidebar toggles off-canvas on smaller screens. This example also include large stat blocks, modal and cards. The top navbar is controlled by a separate hamburger toggle button." />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="Codeply">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/styles.css" />
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
    <nav class="navbar fixed-top navbar-expand-md navbar-dark bg-primary mb-3">
    <div class="flex-row d-flex">
        <button type="button" class="navbar-toggler mr-2 " data-toggle="offcanvas" title="Toggle responsive left sidebar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="#" title="Free Bootstrap 4 Admin Template">YES25 서점ERP시스템</a>
    </div>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsingNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="navbar-collapse collapse" id="collapsingNavbar">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">Home</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link">Link</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="#myAlert" data-toggle="collapse">Alert</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="" data-target="#myModal" data-toggle="modal">About</a>
            </li>
        </ul>
    </div>
</nav>
<div class="container-fluid" id="main">
    <div class="row row-offcanvas row-offcanvas-left">
        <div class="col-md-3 col-lg-2 sidebar-offcanvas bg-light pl-0" id="sidebar" role="navigation">
            <ul class="nav flex-column sticky-top pl-0 pt-5 mt-3">
                <li class="nav-item"><a class="nav-link" href="#">Dashboard</a></li>
                <li class="nav-item">
                    <a class="nav-link" href="#" data-toggle="collapse" data-target="#submenu1">매출</a>
                    <ul class="list-unstyled flex-column pl-3 collapse" id="submenu1" aria-expanded="false">
                       <li class="nav-item"><a class="nav-link" href="#">매출관리 1</a></li>
                       <li class="nav-item"><a class="nav-link" href="#">매출관리 2</a></li>
                    </ul>
                </li>
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

        <div class="col main pt-5 mt-3">
        
        
        
        
        
<!-- 작업페이지 -->

<!-- 내가 작상한 전표 목록보기 -->
<h1 class="display-4 d-none d-sm-block">작성한 전표 목록</h1>
<table>
<tr>
	<th>날짜</th>
	<th>계정과목</th>
	<th>적요</th>
	<th>금액</th>
</tr>

<c:choose>
	<c:when test="${empty list || fn.length(list) == 0 }"></c:when>
	<c:otherwise>
	<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.date }</td>
		<td>${dto.account_uid }</td>
		<td>${dto.summary }</td>
		<td>${dto.sum }</td>
	</tr>
	</c:forEach>
	</c:otherwise>
</c:choose>

</table>
<br><br><br><br><br>


<h1 class="display-4 d-none d-sm-block">전표 입력</h1>
<form name="frm" action="writeOk.bn" method="post" onsubmit="return chkSubmit()">
	담당자<input><button>담당자 선택</button><br>
	결재자<input><button>결재자 선택</button><br>
	
	<table>
	<tr>
		<th>날짜</th>
		<th>계정과목</th>
		<th>적요</th>
		<th>금액</th>
	</tr>
	<tr>
		<td><input></td>
		<td><input></td>
		<td><input></td>
		<td><input></td>
	</tr>
	</table>
	
	<button>증빙 파일 등록</button><br><br><br>
	
	작성자<input><br>
	
	<button type="submit">등록</button>
</form>
</body>
</html>