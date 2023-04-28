<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/930e9d87c4.js"></script>
<style type="text/css">
.btn{ background: linear-gradient(to right, #F7A4A4, #FEA679); color: #fff; }
</style>
<title>Login</title>
</head>
<body>
	
		<%@include file="../login_nav.jsp" %>	
		<%@include file="../main_nav.jsp" %>	
		
		
		<%
				String error = request.getParameter("error");
				if (error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요");
					out.println("</div>");
				}
		%>
		<div class="container" style="width: 400px; margin-top: 10px" align="left">	
			<form action="${pageContext.request.contextPath}/processLoginMember" method="post">
				<div class="input-group mb-3">
					<label class="input-group-text">User ID</label> 
					<input type="text" class="form-control" name="id" placeholder="ID" required autofocus>
				</div>	
					<div class="input-group mb-3">
					<label class="input-group-text">Password</label>
					<input type="password" class="form-control" name="password" placeholder="PW" required>
				</div>
				<div class="d-grid gap-2 col-6 mx-auto">
				<button type="submit" class="btn">Login</button>
				</div>		
			</form>
		</div>	
		
		<%@include file="../footer.jsp" %>

</body>
</html>