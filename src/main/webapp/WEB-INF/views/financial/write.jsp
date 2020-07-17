<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>테스트</title>
</head>

<script>
function chkSubmit(){  // 폼 검증
	
	// 리턴값 ture과 false를 통해
	// 필수 작성 사항을 누락했는지 확인하는 함수 만들기
	// 나중에 잊지말고 external로 빼기
	
}

</script>

<body>
전표 입력<br><br>

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
	
	<button type="submit">등록</button>
</form>
</body>
</html>