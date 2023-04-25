<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 목록</title>
</head>
<body>
<h1>전시회 목록</h1>
<table>
	<tr>
		<th>전시회명</th>
		<th>장소</th>
		<th>시작일</th>
		<th>종료일</th>
		<th>설명</th>
	</tr>
	
	<c:forEach var="exhibition" items="${exhibitionList}">
		<tr>
			<td>${exhibition.title}</td>
			<td>${exhibition.place}</td>
			<td>${exhibition.startDate}</td>
			<td>${exhibition.endDate}</td>
			<td>${exhibition.description}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>
