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

	<div id="eventDetails">
  <h1>Event Details</h1>
  <c:set var="eventList" value="${sessionScope.eventList}" />
  <c:forEach var="event" items="${eventList}" varStatus="status">
    <c:if test="${status.index == param.eventIndex}">
      <div class="event">
        <p>Title: ${event.title}</p>
        <p>Place: ${event.place}</p>
        <p>Start Date: ${event.startDate}</p>
        <p>End Date: ${event.endDate}</p>
        <p>Realm Name: ${event.realmName}</p>
        <c:if test="${event.thumbnail != null}">
          <img src="${event.thumbnail}" />
        </c:if>
      </div>
    </c:if>
  </c:forEach>
</div>

	

	<%@ include file="footer.jsp" %>
</body>
</html>