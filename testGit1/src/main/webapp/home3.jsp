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
	
	
<div id="eventList1"></div>
<div id="eventList2"></div>
<div id="eventList3"></div>
<div id="eventList4"></div>
<div id="eventList5"></div>
<div id="eventList6"></div>
<div id="eventList7"></div>
<div id="eventList8"></div>
<div id="eventList9"></div>
<div id="eventList10"></div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

	      for (var i = 0; i < jsonArray.length; i++) {
	        var title = jsonArray[i].title;
	        var place = jsonArray[i].place;
	        var startDate = jsonArray[i].startDate;
	        var endDate = jsonArray[i].endDate;
	        var realmName = jsonArray[i].realmName;

	        var eventEl = $("<div>").addClass("event").attr("data-event-index", i);

	        if (jsonArray[i].thumbnail) {
	          var thumbnailImage = jsonArray[i].thumbnail;
	          var thumbnailEl = $("<img>").addClass("thumbnail").attr("src", thumbnailImage);
	          eventEl.append(thumbnailEl);
	        }

	        var titleEl = $("<p>").text("Title: " + title);
	        var placeEl = $("<p>").text("Place: " + place);
	        var startDateEl = $("<p>").text("Start Date: " + startDate);
	        var endDateEl = $("<p>").text("End Date: " + endDate);
	        var realmNameEl = $("<p>").text("Realm Name: " + realmName);

	        eventEl.append(titleEl);
	        eventEl.append(placeEl);
	        eventEl.append(startDateEl);
	        eventEl.append(endDateEl);
	        eventEl.append(realmNameEl);

	        eventEl.on("click", function() {
	          var eventIndex = $(this).attr("data-event-index");
	          window.location.href = "Details.jsp?index=" + eventIndex;
	        });
	        
	        var eventListIndex = i % 10 + 1; 
	        $("#eventList" + eventListIndex).append(eventEl);
	      }

	      (function(jsonArray) {
	        $(document).on("click", ".event", function() {
	          var eventIndex = $(this).attr("data-event-index");
	          console.log(jsonArray[eventIndex]);
	        });
	      })(jsonArray);
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