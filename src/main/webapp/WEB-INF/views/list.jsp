<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.sjw.mybatisboard.dto.*"%>
<%@ page import="com.sjw.mybatisboard.dao.*"%>
<%@ page import="com.sjw.mybatisboard.service.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String pageNumberStr = request.getParameter("xpage");
	BListService service = new BListService();
	//BDao dao = sqlSession.getMapper(BDao.class);
	//BDao dao = new BDao();
	int pageNumber = 1;
	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}
	MessageListView viewData = service.getMessageListView(pageNumber);
	int totalPages = viewData.getPageTotalCount();
	if(pageNumberStr==null) pageNumberStr="1";
	
	out.println(pageNumberStr + "/" + totalPages);
	List<BDto> subList = viewData.getMessageList();
%>


</head>
<body>
	<h1 align="center">Spring Mybatis MVC Board</h1>
	<hr>
	<table width="70%" cellpadding="0" cellspacing="0" border="1" align="center">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>제목</th>
			<th>날짜</th>
			<th>히트</th>
		</tr>
		<!-- Model.setAttribute("list",dtos)로 서비스에서 등록한 내용을 읽어 뿌려준다. -->
		
		<c:forEach items="<%=subList %>" var="dto">
		<tr>
			<td>${dto.bId}</td>
			<td>${dto.bName}</td>
			<td>
				<c:forEach begin="1" end="${dto.bIndent}">-</c:forEach>
				<a href="content_view?bId=${dto.bId}">${dto.bTitle}</a></td>
			<td>${dto.bDate}</td>
			<td>${dto.bHit}</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="5"> <a href="write_view">글작성</a> </td>
		</tr>
	</table>
	<div align="center">
	<%
		for (int i = 1; i <= viewData.getPageTotalCount(); i++) {
	 %>
		<a href="list?xpage=<%=i%>">[<%=i%>]</a>
	<%
		}
	%>
	<hr>
	<h3>비젼직업전문학교 인공지능과정</h3>
	(2020.10.16~2020.04.26)
	</div>
</body>
</html>