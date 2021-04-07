<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sjw.mybatisboard.dto.HomeBook"%>
<%@ page import="com.sjw.mybatisboard.service.Constant"%>
<%@ page import="com.sjw.mybatisboard.dao.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="com.sjw.mybatisboard.dto.*" %>
<%@ page import="com.sjw.mybatisboard.service.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력자료목록</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<body>
	<%@include file="../Top.jsp"%>
	<div class="container">
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
		
	String pageNumberStr = request.getParameter("xpage");
	HomeBookListService service = new HomeBookListService(vo.getId());
	//BDao dao = sqlSession.getMapper(BDao.class);
	//BDao dao = new BDao();
	int pageNumber = 1;
	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}
	HomeBookListView viewData = service.getMessageListView(pageNumber);
	int totalPages = viewData.getPageTotalCount();
	if(pageNumberStr==null) pageNumberStr="1";
	
	out.println(pageNumberStr + "/" + totalPages);
	List<HomeBook> subList = viewData.getMessageList();
	
%>


	<h1><%=vo.getId()%>님 입력자료 목록
	</h1>
	<div align="right">
		<button type="button" class = "btn btn-primary" onclick="location.href='main'">메인</button>
	</div>
	<hr>
	<table class="table table-bordered" border='1'>
		<tr>
			<th>관리번호</th>
			<th>일자</th>
			<th>구분</th>
			<th>계정과목</th>
			<th>적요</th>
			<th>차변</th>
			<th>대변</th>
			<th>사용자ID</th>
			<th>수정</th>
		</tr>
		<%
			for (HomeBook x : subList) {
		%>
		<tr>
			<td><%=x.getSerialno()%></td>
			<td><%=x.getDay()%></td>
			<td><%=x.getSection()%></td>
			<td><%=x.getAccounttitle()%></td>
			<td><%=x.getRemark()%></td>
			<td><%=x.getRevenue()%></td>
			<td><%=x.getExpense()%></td>
			<td><%=x.getMid()%></td>
			<td><button type="button"  class="btn btn-outline-danger" onclick="location.href='homebookAdjustDo?no=<%=x.getSerialno()%>'">
					수정<%=x.getSerialno()%></td>
		</tr>
		<%
			}
		%>
		<%
	}
		%>
	</table>
	</div>
</body>
</html>