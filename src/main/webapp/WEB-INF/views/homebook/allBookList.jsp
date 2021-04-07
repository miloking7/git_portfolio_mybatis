<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>
<%@ page import="com.sjw.mybatisboard.dto.*" %>
<%@ page import="com.sjw.mybatisboard.service.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 모두 출력(관리자용)</title>
</head>
<body>

	<%
	String pageNumberStr = request.getParameter("xpage");
	HomeBookListService service = new HomeBookListService();
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



	<h1 align="center">모든 회원들 가계부 정보 출력(관리자전용)</h1>
	<div align="right">
	<a href = "main">메인화면</a>
	</div>
	<hr>
	<%
		//List<HomeBook> bookList = 
		//	(List<HomeBook>)session.getAttribute("bookList");
		out.print("<h3><table border='1'>");
		out.print("<tr>");
		out.print("<th>시리얼번호</th>");
		out.print("<th>일자</th>");
		out.print("<th>구분</th>");
		out.print("<th>계정과목</th>");
		out.print("<th>적요</th>");
		out.print("<th>수입</th>");
		out.print("<th>지출</th>");
		out.print("<th>사용자ID</th>");
		out.print("</tr>");
		
		for(HomeBook x:subList){//bookList
			out.print("<tr>");
				out.print("<td>"+x.getSerialno()+"</td>");
				out.print("<td>"+x.getDay()+"</td>");
				out.print("<td>"+x.getSection()+"</td>");
				out.print("<td>"+x.getAccounttitle()+"</td>");
				out.print("<td>"+x.getRemark()+"</td>");
				out.print("<td>"+x.getRevenue()+"</td>");
				out.print("<td>"+x.getExpense()+"</td>");
				out.print("<td>"+x.getMid()+"</td>");
			out.print("</tr>");
		}
		out.print("</h3></table>");
	%>
		<div align="center">
	<%
		for (int i = 1; i <= viewData.getPageTotalCount(); i++) {
	 %>
		<a href="booklist?xpage=<%=i%>">[<%=i%>]</a>
	<%
		}
	%>
	<hr>
	<h3>비젼직업전문학교 인공지능과정</h3>
	(2020.10.16~2020.04.26)
	</div>
	<hr> 
	
	
	
	
	
	
	
</body>
</html>