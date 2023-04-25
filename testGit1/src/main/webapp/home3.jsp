<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Arrays"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
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
<title>Welcome</title>
</head>
<body>
	<%@ include file="login_nav.jsp" %>

	<%@ include file="main_nav.jsp" %>
	 <h1>전시회 정보</h1>
    <table>
        <tr>
            <th>전시회명</th>
            <th>장소</th>
            <th>시작일</th>
            <th>종료일</th>
            <th>분류</th>
            <th>썸네일 URL</th>
        </tr>
        <%-- 전시회 정보를 동적으로 출력하는 부분 --%>
        <%-- 여기에 ApiController에서 전달한 데이터를 반복문을 통해 출력 --%>
        <c:forEach var="exhibition" items="${exhibitionList}">
            <tr>
                <td>${exhibition.title}</td>
                <td>${exhibition.place}</td>
                <td>${exhibition.startDate}</td>
                <td>${exhibition.endDate}</td>
                <td>${exhibition.realmName}</td>
                <td><img src="${exhibition.thumbnailUrl}" alt="썸네일"></td>
            </tr>
        </c:forEach>
    </table>

		
	<%@ include file="footer.jsp" %>
</body>
</html>