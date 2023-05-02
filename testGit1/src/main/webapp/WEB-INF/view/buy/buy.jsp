<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Arrays"%>

<!DOCTYPE html>
<html>
<head>
<%
	String title = request.getParameter("title");
%>

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
.btn{ background: linear-gradient(to right, #F7A4A4, #FEA679);}
</style>

<meta charset="UTF-8">
<title>Exhibition Info</title>
</head>
<body>

	
<%@include file="../login_nav.jsp" %>	
<%@include file="../main_nav.jsp" %>	

	
<h1>구매하기</h1>	
<div class="container mt-4">
  <div class="row">
    <div class="col">
      <div class="card" style="width: 18rem;">
        <img class="card-img-top" src="<%= request.getParameter("thumbnail") %>" alt="Card image cap">
      </div>
    </div>
    <div class="col">
      <div class="row">
        <div class="col">
          <div class="card" style="width: 18rem;">
            <div class="card-body">
              <h5 class="card-title"><%= request.getParameter("title") %></h5>
            </div>
          </div>
        </div>
      </div>
      
     <form class="form-horizontal"  action="${pageContext.request.contextPath}/processBuy" method="post">
      <div class="row mt-4">
        <div class="col">
          <div class="card" style="width: 18rem;">
            <div class="card-body">
              <input type="hidden" name ="title" value="<%=title%>">
              <h5 class="card-title">티켓 수량 선택</h5>
              <p class="card-text">성인</p>
              <select name="adult" class="form-control" style="height: 40px; font-size: 20px;">
                <option>0</option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
              </select>
              <p class="card-text">아동</p>
              <select name="child" class="form-control" style="height: 40px; font-size: 20px;">
                <option>0</option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
              </select>
              <button type="submit" class="btn" style="color: white;">구매하기</button>
			  <button type="reset" class="btn" style="color: white;" onclick="reset()">취소</button>         
            </div>
          </div>
        </div>
      </div>
    </div>
    </form>
  </div>
</div>
    
    
   
</body>
	
</body>
</html>
