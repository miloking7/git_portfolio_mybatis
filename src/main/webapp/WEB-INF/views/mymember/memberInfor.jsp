<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sjw.mybatisboard.dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보확인</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>

<body>
	<%@include file="../Top.jsp"%>
<div class = "container">
<%
	MyMember vo = (MyMember)session.getAttribute("joinVo");
	if(vo==null){
	%>
	<script>
		alert('로그인 하세요');
		document.location.href="main";
	</script>
	<%
	}else{	
%>
<h1 align="center"><%=vo.getId() %> 회원 가입정보</h1>
<div align="right">
		<button type="button" class="btn btn-primary" onclick="location.href='main'">메인</button>
	</div>
<hr>
<form action ="memberInforAdjustDo" method="POST">
<table class="table table-bordered" border="1">
	<tr><th>아이디</th><td>
	<input type="hidden" name="no" value="<%=vo.getNo() %>">
	<%=vo.getNo()%>	
	</td></tr>
	<tr><th>회원아이디</th><td>
		<input type="hidden" class="form-control" name="id" value="<%=vo.getId()%>"><%=vo.getId() %>
	</td></tr>
	<tr><th>패스워드</th><td>
		<input type="text" class="form-control" name="password" value="<%=vo.getPassword()%>">
	</td></tr>
	<tr><th>전화번호</th><td>
		<input type="text" class="form-control" name="phone" value="<%=vo.getPhone()%>">
	</td></tr>
	<tr><th>가입일자</th><td>
		<input type="hidden" name="joindate" value="<%=vo.getJoindate() %>">
		<%=vo.getJoindate() %>
	</td></tr>
	
	<tr><th>가입상태</th><td>
		<input type="hidden" class="form-control" name="iswithrew" value="<%=vo.getIswithrew() %>"><%=vo.getIswithrew() %>
		
	</td></tr>
	
	
	<tr><td colspan="2" align="center">
		<input type="submit" class="btn btn-outline-danger" value="수정">
	</td></tr>
</table>

</form>
<%} %> 
</div>
</body>
</html>