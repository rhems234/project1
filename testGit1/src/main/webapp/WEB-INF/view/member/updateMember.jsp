<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
	
<title>회원 수정</title>
</head>
<body onload="init()">
		
	<%@include file="../login_nav.jsp" %>	
	<%@include file="../main_nav.jsp" %>	
	
	<c:if test="${not empty errorMessage}">
		<p>${errorMessage}</p>
	</c:if>
	
	<div class="container" style="width: 400px; margin-top: 10px" align="left">
	
		<form name="newMember" class="form-horizontal" action="${pageContext.request.contextPath}/processUpdateMember"  method="post" onsubmit="return checkForm()">
			
			<div class="input-group mb-3">
				<label class="input-group-text"> 회원 ID </label>
				<input name="id" type="text" class="form-control" placeholder="id" value="<c:out value='${sessionScope.loginUser.id}'/>" />
			</div>
			
			<div class="input-group mb-3">
				<label class="input-group-text"> 회원 Password  </label>
					<input type="text" class="form-control" value="<c:out value='${sessionScope.loginUser.password}'/>" >
			</div>
			
			<div class="input-group mb-3">
				<label class="input-group-text"> 변경 Password </label>
					<input name="password" type="text" class="form-control" placeholder="password">
			</div>
			
			<div class="input-group mb-3">
				<label class="input-group-text"> Password 확인  </label>
					<input name="password_confirm" type="text" class="form-control" placeholder="password_confirm" >
			</div>
			
			<div class="input-group mb-3">
				<label class="input-group-text"> 현재 닉네임 </label>
					<input class="form-control" value="<c:out value='${sessionScope.loginUser.nickname}'/>" >
			</div>
			
			<div class="input-group mb-3">
				<label class="input-group-text"> 변경 닉네임</label>
					<input name="nickname" type="text" class="form-control" placeholder="nickname">
			</div>
			
			<div class="input-group mb-3">
				<label class="input-group-text"> 현재 이메일 </label>
					<input name="email" type="text" class="form-control"
					 value="<c:out value='${sessionScope.loginUser.email}'/>" >
			</div>
			
			<div class="input-group mb-3">
				<label class="input-group-text"> 변경 이메일 </label>
					<input type="text" id="mail1" name="mail1"required /> @
			<select name="mail2">
				<option value="naver.com" <c:if test="${member.mail2 eq 'naver.com'}">selected</c:if>>naver.com</option>
				<option value="daum.net" <c:if test="${member.mail2 eq 'daum.net'}">selected</c:if>>daum.net</option>
				<option value="gmail.com" <c:if test="${member.mail2 eq 'gmail.com'}">selected</c:if>>gmail.com</option>
			</select>
		</div>
			

			<div class="form-group  row" style="margin-top: 10px">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="회원수정"> 
					<a href="${pageContext.request.contextPath}/deleteMember" class="btn btn-primary">회원탈퇴</a>
				</div>
			</div>	
		</form>	
	</div>
	
	<%@include file="../footer.jsp" %>

</body>
</html>
<script type="text/javascript">
	function checkForm() {
		if (!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}
		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
</script>