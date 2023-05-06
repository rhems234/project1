<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="com.example.domain.BoardVO" %>
<%@ page import="com.example.domain.BuyDTO" %>

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
<script>
      $(document).ready(function() {
         $(".btn-view").click(function() {
            var id = $(this).data("board-id");
            window.location.href = "<%=request.getContextPath()%>/board/" + id;
         });
      });
   </script>
</head>
<body>
    <%@ include file="../login_nav.jsp" %>

    <%@ include file="../main_nav.jsp" %>
   
      
   <h1>게시판 목록</h1>
 

<div style="padding: 50px; flex: 2;">
  <table class="table table-hover">
    <c:set var="titleSet" value="" />
    <c:forEach var="buy" items="${BuyDTO}">
      <c:if test="${!titleSet.contains(buy.title)}">
        <c:set var="titleSet" value="${titleSet + buy.title}" />
        <tr>
          <td style="width: 200px;">
            <img src="${buy.thumbnail}" style="max-width: 100%; height: auto;">
          </td>
          <td>
            <table>
              <tr>
                <th>닉네임</th>
                <th>내용</th>
                <th>평점</th>
              </tr>
              <c:set var="totalGrade" value="0" />
              <c:set var="count" value="0" />
              <c:forEach var="board" items="${BoardVO}">
                <c:if test="${board.title eq buy.title}">
                  <c:set var="totalGrade" value="${totalGrade + board.grade}" />
                  <c:set var="count" value="${count + 1}" />
                  <tr>
                    <td>${board.nickname}</td>
                    <td>${board.text}</td>
                    <td>${board.grade}</td>
                  </tr>
                </c:if>
              </c:forEach>
            </table>
          </td>
        </tr>
        <tr>
          <td colspan="3">평균 : ${count != 0 ? String.format("%.1f", totalGrade/count) : 0}</td>
        </tr>
      </c:if>
    </c:forEach>
  </table>
</div>

   
   <%@ include file="../footer.jsp" %>
</body>
</html>