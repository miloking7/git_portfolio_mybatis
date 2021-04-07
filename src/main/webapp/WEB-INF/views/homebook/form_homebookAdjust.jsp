<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sjw.mybatisboard.dto.*" %>
<%@ page import="com.sjw.mybatisboard.dao.*" %>

<%@ page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="com.sjw.mybatisboard.service.Constant"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈북 수정화면</title>

</head>
<body>
	<%@include file="../Top.jsp"%>
	
<%
	HomeBook vo = (HomeBook)session.getAttribute("targetBook");
%>
<div class="container">
<h1 align="center">가계부개별자료 수정작업</h1>
적색부분은 수정할 수 없습니다!
<div align="right"><button type="button" class="btn btn-primary" onclick="history.go(-1)">뒤로</a></div>
<hr> 
<table class="table table-bordered" border="1" align="left">
	<form name="homebookadjust" action="adjustProcDo" method="post">
	<!-- 히든시키는 폼과 그 값은 폼테그 안에만 있으면 된다.  ------------------>
	<input type="hidden" name="userId" value="<%=vo.getMid()%>">
	<input type="hidden" name="serialno" value="<%=vo.getSerialno()%>">
	<!-- ------------------------------------------------------------ -->
	<tr><th bgcolor='red'>관리번호</th>
		<td><%=vo.getSerialno()%></td>
	</tr>
	<tr><th bgcolor='green'>일자</th><td><input type="datetime-local" class="form-control" name="day" value=<%=vo.getDay().toLocalDateTime()%>></td> </tr>
	<tr><th bgcolor='green'>구분</th><td><input type="text" class="form-control" name="section" value="<%=vo.getSection()%>"></td></tr>
	<tr><th bgcolor='green'>계정과목</th><td><input type="text" class="form-control" name="accountTitle" value="<%=vo.getAccounttitle()%>" size="80"></td></tr>
	<tr><th bgcolor='green'>적요</th><td><input type="text" class="form-control" name="remark" value="<%=vo.getRemark()%>" size="80"></td></tr>
	<tr><th bgcolor='green'>수입(차변)</th><td ><input type="text" class="form-control" name="revenue" value="<%=vo.getRevenue()%>" style = "text-align:right;"></td></tr>
	<tr><th bgcolor='green'>지출(대변)</th><td ><input type="text" class="form-control" name="expense" value="<%=vo.getExpense()%>" style = "text-align:right;"></td></tr>
	<tr><th bgcolor='red'>사용자ID</th><td><%=vo.getMid()%></td></tr>
	<tr><td colspan="2" align="center">
		<input type="submit" class="btn btn-outline-danger" value="수정">&nbsp;
		<button type="button" class="btn btn-primary" onclick="history.go(-1)">뒤로</button>
	</td></tr>	
	</form>
</table>
</div>
</body>
</html>