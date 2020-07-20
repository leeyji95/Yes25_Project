<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/CSS/login.css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<title>로그인</title>
</head>
<body>
	<div id="mainCoantiner">
		<!--dust particel-->
		<div>
			<div class="starsec"></div>
			<div class="starthird"></div>
			<div class="starfourth"></div>
			<div class="starfifth"></div>
		</div>
		<!--Dust particle end--->
	</div>

	<div>
		<div class="container">
			<span class="error animated tada" id="msg"></span>

			<form name="form1" class="box" onsubmit="return checkStuff()">
				<h2>
					YES25<span> Dashboard</span>
				</h2>
				<h4>Sign in to your number.</h4>

				<input type="text" name="email" placeholder="Email"	autocomplete="off"> <i class="fa fa-eye" id="eye"></i> 
				<input type="password" name="password" placeholder="Passsword" id="pwd" autocomplete="off">
				<label><input type="checkbox">
					<span></span> 
					<small class="rmb">Remember me</small></label> 
				<a href="#"	class="forgetpass">Forget Password?</a> 
				
				<!-- form 제출 -->
				<input type="submit" value="Sign in" class="btn1">
			</form>
		</div>
	</div>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.4.0/gsap.min.js"></script>
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/JS/login.js"></script>
</body>
</html>
