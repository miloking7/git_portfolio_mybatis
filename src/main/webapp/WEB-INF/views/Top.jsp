<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<style>
.top {
	background-color: lightgray;
}

.green {
	color: GREEN;
}

.red {
	color: red;
}
</style>
<%
	String id = (String) session.getAttribute("id");
	if (id == null) {
		id = "GUEST";
	}
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>


</head>

<body>

	<table width="100%" border="0">
		<tr height="70" class="top">
			<td><a href="main" style="text-decoration: none"> <img
					src="<spring:url value ='/resources/img/LOGO.jpg'/>" height="70"
					alt="로고출력자리">

			</a></td>
			<td colspan="5">
				<div align="center">
					<h1 class="black">회원제 가계부 </h1>
					<h4 class="grey">Spring/MyBatis/Oracle/FrontControllPattern/SpringFrameWork방식</h4>
				</div>
			</td>
			<td align="center" width="200"><h3 class="y"><%=id%>님
				</h3> <%
 	if (id.equals("GUEST")) {
 %>
				<button class="btn btn-primary" onclick="location.href='fLogin'">로그인</button>
				<%
					} else {
				%>
				<button class="btn btn-primary" onclick="location.href='logout'">로그아웃</button>
				<%
					}
				%></td>
		</tr>

		<tr height="50">
			<td align="center" width="14%" bgcolor="black"><a
				href="memberJoin" style="text-decoration: none"><font
					color="white" size="4">회원가입</font></a></td>
			<td align="center" width="14%" bgcolor="gray"><a
				href="memberInforDo" style="text-decoration: none"><font
					color="white" size="4">본인정보</font></a></td>
			<td align="center" width="14%" bgcolor="gray"><a
				href="fHomebook" style="text-decoration: none"><font
					color="white" size="4">가계부입력</font></a></td>
			<td align="center" width="14%" bgcolor="black"><a
				href="datadisp2" style="text-decoration: none"><font color="RED"
					size="4">회원자료</font></a></td>
			<td align="center" width="14%" bgcolor="gray"><a
				href="memberlist" style="text-decoration: none"><font
					color="RED" size="4">모든회원</font></a></td>
			<td align="center" width="16%" bgcolor="gray"><a href="list"
				style="text-decoration: none"><font color="RED" size="4">게시판</font></a>
			</td>
			<td align="center" width="14%" bgcolor="black"><a
				href="instructions" style="text-decoration: none"><font
					color="white" size="4">본사이트이용법</font></a></td>

		</tr>
	</table>
</body>
</html>