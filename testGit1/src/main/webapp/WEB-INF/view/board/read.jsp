<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${board.title}</h1>
	<p>${board.nickname} | ${board.avg}</p>
	<p>${board.main_text}</p>
	<br>
	<button onclick="location.href='/board/list'">목록</button>
	<c:if test="${not empty loginUser}">
		<button onclick="location.href='/board/update?id=${board.id}'">수정</button>
		<button onclick="location.href='/board/delete?id=${board.id}'">삭제</button>
	</c:if>
</body>
</html>