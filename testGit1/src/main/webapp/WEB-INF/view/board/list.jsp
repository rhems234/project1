<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Arrays"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
@font-face {
    font-family: 'GangwonEdu_OTFBoldA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

 *{font-family: 'GangwonEdu_OTFBoldA', sans-serif;}
</style>
<meta charset="UTF-8">
<title>Exhibition Info</title>
<script>
		$(document).ready(function() {
			$(".btn-view").click(function() {
				var id = $(this).data("board-id");
				window.location.href = "<%=request.getContextPath()%>/board/" + id;
			});
		});
	</script>
</head>
<body>
 	<%@ include file="../login_nav.jsp" %>

 	<%@ include file="../main_nav.jsp" %>
	
		
	<h1>게시판 목록</h1>
	<c:if test="${not empty msg}">
		<p>${msg}</p>
	</c:if>
	<table>
		<tr>
			<th>전시회</th>
			<th>작성자</th>
			<th>내용</th>
			<th>평점</th>
		</tr>
		<c:forEach var="board" items="${boardList}">
			<tr>
				<td><a href="/board/detail?id=${board.title}">${board.title}</a></td>

				<td>${board.nickname}</td>
				<td>${board.text}</td>
				<td>${board.grade}</td>
			</tr>
		</c:forEach>
	</table>

	
	<%@ include file="../footer.jsp" %>
</body>
</html>