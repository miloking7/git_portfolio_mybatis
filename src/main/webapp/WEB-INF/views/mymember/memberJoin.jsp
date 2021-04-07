<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버조인 화면</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<body>
<%@include file="../Top.jsp"%>
<div class = "container">
	<h1 align="center">회원가입</h1>
	<div align="right">
		<button type="button" class="btn btn-primary" onclick="location.href='main'">메인</button>
		<button type="button" class="btn btn-primary" onclick="history.go(-1)">뒤로</button>
	</div>
	<hr>
	<form action="memberJoinDo" method="POST">
		<table class="table table-bordered" >
			<tr>
				<td><span class="badge badge-success">아이디</span></td>
				<td><input type="text" class="form-control" name="mid"></td>
				<!-- <td><button class="btn btn-primary" type="submit" formmethod="get" onclick="location.href='idconfirm?id={mid}'">확인</button></td>-->
			</tr>
			
			<tr>
				<td><span class="badge badge-success">패스워드</span></td>
				<td><input type="password" class="form-control" name="mpassword"></td>
			</tr>
			
			<tr>
				<td><span class="badge badge-success">패스워드확인</span></td>
				<td><input type="password"  class="form-control" name="mpassword2"></td>
			</tr>
			
			<tr>
				<td><span class="badge badge-success">전화번호</span></td>
				<td><input type="text" class="form-control" name="mphone"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center"><input class="btn btn-primary" type="submit" value="회원가입">
				</td>
			</tr>
		</table>
	</form>
	
</div>
</body>
</html>