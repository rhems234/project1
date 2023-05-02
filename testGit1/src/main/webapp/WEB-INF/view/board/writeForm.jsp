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
	
</head>
<body>
	<%@ include file="../login_nav.jsp" %>

	<%@ include file="../main_nav.jsp" %>
	
	<h1>게시물 작성</h1>
	<form method="post" action="/board/write">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" required></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="nickname" required></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="main_text" required></textarea></td>
			</tr>
		</table>
		<br>
		<button type="submit">작성</button>
		<button type="button" onclick="location.href='/board/list'">목록</button>
	</form>


	<%@ include file="../footer.jsp" %>
</body>
</html>