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
	
	<div id="exhibitionInfo">
  <!-- 전시회 정보가 출력될 영역 -->
</div>

	<script>
  // Ajax 요청을 통해 전시회 정보를 가져와서 화면에 출력하는 함수
  function getExhibitionInfo() {
    $.ajax({
      type: 'GET',
      url: 'api/test2', // ApiController의 URL
      success: function (response) {
        var thumbnailUrl = response.thumbnailUrl; // 이미지 URL을 가져옴
        var thumbnailImg = $('<img>').attr('src', thumbnailUrl); // 이미지 태그 생성 후 src 속성에 이미지 URL 설정
        $('#exhibitionInfo').append(thumbnailImg); // 생성한 이미지 태그를 화면에 추가
      },
      
      error: function (xhr, status, error) {
        console.error('Error occurred while fetching exhibition info:', error);
      }
    });
  }

  // 페이지 로드 시 전시회 정보를 가져와서 화면에 출력
  $(document).ready(function () {
    getExhibitionInfo();	    
  });
</script>

		
	<%@ include file="footer.jsp" %>
</body>
</html>