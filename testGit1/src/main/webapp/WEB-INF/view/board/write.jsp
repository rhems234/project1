<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
	<h1>글쓰기</h1>
	<form action="/board/write" method="post">
		<table>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="nickname"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>평점</td>
				<td><input type="number" name="avg" min="0" max="5"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="text"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록"></td>
			</tr>
		</table>
	</form>
</body>
</html>
