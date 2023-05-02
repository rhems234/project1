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
	<%@ include file="login_nav.jsp" %>

	<%@ include file="main_nav.jsp" %>
	
	
<div class="container">
    <div class="row row-cols-4" id="eventList">
    </div>
 </div>


 <script>
    $(document).ready(function() {
      $.ajax({
        url: "test2",
        type: "GET",
        xhrFields: {
          withCredentials: true
        },
        success: function(data) {
          console.log(data);
          var jsonArray = JSON.parse(data);

          $("#eventList").empty();

          for (var i = 0; i < jsonArray.length; i++) {
        	var realmName = jsonArray[i].realmName;  
            var title = jsonArray[i].title;
            var place = jsonArray[i].place;
            var startDate = jsonArray[i].startDate;
            var endDate = jsonArray[i].endDate;
            

            var thumbnailImage = jsonArray[i].thumbnail ? jsonArray[i].thumbnail : "https://via.placeholder.com/150x150"; // 썸네일 이미지가 없을 경우 기본 이미지 사용

            var cardEl = $("<div>").addClass("col mb-4");
            var card = $("<div>").addClass("card h-100");
            var img = $("<img>").addClass("card-img-top").attr("src", thumbnailImage).attr("alt", "Card image cap").attr("style", "height:300px;");
            var cardBody = $("<div>").addClass("card-body");
            var cardRealm = $("<p>").addClass("card-text").text(realmName);
            var cardTitle = $("<h3>").addClass("card-title").text(title);
            var cardText = $("<p>").addClass("card-text").text(place);
            var cardText = $("<p>").addClass("card-text").text(startDate + " ~ " + endDate);
            

            cardBody.append(cardTitle);
            cardBody.append(cardText);
            cardBody.append(cardRealm);
            card.append(img);
            card.append(cardBody);
            cardEl.append(card);
            
            // 버튼 1
           var btn1 = $("<button>").addClass("btn btn-primary mr-2").text("구매하기");
            btn1.attr("data-card-info", JSON.stringify(jsonArray[i]));
            btn1.click(function() {
                var cardInfo = JSON.parse($(this).attr("data-card-info"));
                var queryString = "?realmName=" + cardInfo.realmName + "&title=" + cardInfo.title + "&place=" + cardInfo.place + "&thumbnail=" + encodeURIComponent(cardInfo.thumbnail);
                var contextPath = "<%=request.getContextPath()%>";
                var url = contextPath + "/buy";
                window.location.href = url + queryString;
            });
            
            cardBody.append(btn1);

            // 버튼 2
            var btn2 = $("<button>").addClass("btn btn-secondary float-right ml-2").text("리뷰모음");
            btn2.attr("id", "btn2-" + i);
            btn2.click(function() {
                window.location.href = "eventPage?eventId=" + jsonArray[i].id + "&btnId=2";
            });
            cardBody.append(btn2);

            // 버튼 3
            var btn3 = $("<button>").addClass("btn btn-danger float-right").text("상세페이지 3");
            btn3.attr("id", "btn3-" + i);
            btn3.click(function() {
                window.location.href = "eventPage?eventId=" + jsonArray[i].id + "&btnId=3";
            });
            cardBody.append(btn3);

            $("#eventList").append(cardEl);
          }
        },
    error: function(xhr, status, error) {
      console.error(xhr, status, error);
    }
  });
});
</script>



	<%@ include file="footer.jsp" %>
</body>
</html>