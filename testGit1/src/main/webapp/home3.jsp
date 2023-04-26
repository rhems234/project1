<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Arrays"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
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
	<%@ include file="login_nav.jsp" %>

	<%@ include file="main_nav.jsp" %>
	
	<div id="title"></div>
	<div id="place"></div>
	<div id="startDate"></div>
	<div id="endDate"></div>
	<div id="realmName"></div>
	
	<img id="thumbnail">
    
    <script>
    $.ajax({
        url: "test2", // 호출할 API의 URL
        type: "GET",
        xhrFields: {
            withCredentials: true
        },
        success: function(data) { // 성공적으로 응답 받았을 때의 콜백 함수
            // XML 데이터 파싱
            console.log(data);
            /* var title = $(data).find("title").text();
            var place = $(data).find("place").text();
            var startDate = $(data).find("startDate").text();
            var endDate = $(data).find("endDate").text();
            var realmName = $(data).find("realmName").text();
            var thumbnailImage = $(data).find("thumbnailImage").text(); */
            
            // 추출한 정보를 HTML에 추가하여 화면에 보여주기
            $("#title").text("전시회명: " + title);
            $("#place").text("장소: " + place);
            $("#startDate").text("시작일: " + startDate);
            $("#endDate").text("종료일: " + endDate);
            $("#realmName").text("분류: " + realmName);
            
            // 이미지 데이터를 img 태그에 넣어 이미지 보여주기
            var img = document.createElement("img");
            img.src = "data:image/jpeg;base64," + thumbnailImage; // 이미지의 base64 데이터를 src에 넣어줌
            $("#thumbnail").append(img); // 이미지를 보여줄 태그에 추가
        },
        error: function(jqXHR, textStatus, errorThrown) { // 에러 발생 시의 콜백 함수
            console.log("에러 발생: " + textStatus + ", " + errorThrown);
        }
    });
    </script>
		
	<%@ include file="footer.jsp" %>
</body>
</html>