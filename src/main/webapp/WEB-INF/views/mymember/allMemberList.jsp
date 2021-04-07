<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.sjw.mybatisboard.dto.*"%>
<%@ page import="com.sjw.mybatisboard.service.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>등록회원명단</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<body>
	<%@include file="../Top.jsp"%>
	<%
		String pageNumberStr = request.getParameter("xpage");
	MemberListService service = new MemberListService();
	//BDao dao = sqlSession.getMapper(BDao.class);
	//BDao dao = new BDao();
	int pageNumber = 1;
	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}
	MemberListView viewData = service.getMessageListView(pageNumber);
	int totalPages = viewData.getPageTotalCount();
	if (pageNumberStr == null)
		pageNumberStr = "1";

	out.println(pageNumberStr + "/" + totalPages);
	List<MyMember> subList = viewData.getMessageList();
	%>

 <div class="container">
	<h1 align="center">등록회원명단</h1>
	<div align="right">
		<button type="button" class = "btn btn-primary" onclick="location.href='main'">메인</button>
	</div>
	<hr>
	<%
		//List<MyMember> memList = 
	//(List<MyMember>)session.getAttribute("memList");
	out.print("<table class='table table-striped'>");
	out.print("<tr>");
	out.print("<th>회원번호</th>");
	out.print("<th>아이디/닉네임</th>");
	out.print("<th>패스워드</th>");
	out.print("<th>연락처</th>");
	out.print("</tr>");

	for (MyMember x : subList) {
		out.print("<tr >");
		out.print("<td>" + x.getNo() + "</td>");
		out.print("<td>" + x.getId() + "</td>");
		out.print("<td>" + "????" + "</td>");
		out.print("<td>" + x.getPhone() + "</td>");
		out.print("</tr>");
	}
	out.print("</table>");
	%>
	<div align="center">
	<ul class = "pagination">
	<li class="page-item "><a class="page-link" href="#">Previous</a></li>
		<%
			for (int i = 1; i <= viewData.getPageTotalCount(); i++) {
		%>
		<li class="page-item">
		<a class="page-link" href="memberlist?xpage=<%=i%>">[<%=i%>]
		</a> </li>
		<%
			}
		%>
		<li class="page-item"><a class="page-link" href="#">Next</a></li>
	</ul>
		<hr>
		<h3>비젼직업전문학교 인공지능과정</h3>
		(2020.10.16~2020.04.26)
	</div>
	<hr>






 </div>
</body>
</html>