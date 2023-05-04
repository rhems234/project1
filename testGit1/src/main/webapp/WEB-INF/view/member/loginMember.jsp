<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.btn{ background: linear-gradient(to right, #F7A4A4, #FEA679); color: #fff; }
</style>
<title>Login</title>
</head>
<body>
	
		<%@include file="../login_nav.jsp" %>	
		<%@include file="../main_nav.jsp" %>	
		
		<div id="myModal" class="modal">
		    <div class="modal-content">
		        <% if (request.getAttribute("welcomeMsg") != null) { %>
		            <p>${welcomeMsg}</p>
		        <% } else { %>
		            <p>${msg}</p>
		        <% } %>
		        <span class="close">&times;</span>
		    </div>
		</div>
		
		
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
		
<script>
    <%-- 모달창 띄우기 --%>
    <% if (request.getAttribute("msg") != null || request.getAttribute("welcomeMsg") != null) { %>
        var modal = document.getElementById("myModal");
        var span = document.getElementsByClassName("close")[0];
        modal.style.display = "block";
        span.onclick = function() {
            modal.style.display = "none";
        }
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    <% } %>
</script>

	
		<%@include file="../footer.jsp" %>

</body>
</html>