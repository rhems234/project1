<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style type="text/css">
.btn{ background: linear-gradient(to right, #F7A4A4, #FEA679);}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript">
	function checkForm() {
		if (!document.newMember.id.value) {
		    $('#myModal .modal-title').text('아이디를 입력하세요.');
		    $('#myModal').modal('show');
		    return false;
		  }
		
		if (!document.newMember.password.value) {
			$('#myModal .modal-title').text('비밀번호를 입력하세요.');
		    $('#myModal').modal('show');
		    return false;
		}
		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			$('#myModal .modal-title').text('비밀번호를 동일하게 입력하세요.');
		    $('#myModal').modal('show');
		    return false;
		}
		 $('#sucess').modal('show');
		 return false;
	    }
</script>

<title>회원 가입</title>
</head>
<body>
		
	<%@include file="../login_nav.jsp" %>	
	<%@include file="../main_nav.jsp" %>	
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title" id="myModalLabel">회원가입 완료</h4>
	      </div>
	        <button type="button" class="btn" style="color: white;" data-dismiss="modal">확인</button>
	    </div>
	  </div>
	</div>
	
	<div class="modal fade" id="sucess" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title" id="myModalLabel">회원가입 완료</h4>
	      </div>
	        <a href="<c:url value='/login'/>" class="btn" style="color: white;">로그인하기</a>
	    </div>
	  </div>
	</div>

	<div class="container" style="width: 400px; margin-top: 10px">
		<form name="newMember" class="form-horizontal"  action="${pageContext.request.contextPath}/processAddMember" method="post" onsubmit="return checkForm()">
			<div class="input-group mb-3">
				<label class="input-group-text">아이디</label>
				<input name="id" type="text" class="form-control" placeholder="id" >
			</div>
			
			<div class="input-group mb-3">
				<label class="input-group-text">비밀번호</label>
				<input name="password" type="text" class="form-control" placeholder="password" >
			</div>
			
			<div class="input-group mb-3">
				<label class="input-group-text">비밀번호확인</label>
				<input name="password_confirm" type="text" class="form-control" placeholder="password confirm" >
			</div>
			
			<div class="input-group mb-3">
				<label class="input-group-text">성명</label>
				<input name="name" type="text" class="form-control" placeholder="name" >
			</div>
			
			<div class="input-group mb-3">
				<label class="input-group-text">이메일</label>
				<input type="text" class="form-control" name="mail1" maxlength="50">@ 
				<select name="mail2"class="form-control">
					<option>naver.com</option>
					<option>daum.net</option>
					<option>gmail.com</option>
					<option>nate.com</option>
				</select>			
			</div>
			
			<div class="input-group mb-3">
				<label class="input-group-text">닉네임</label>
				<input name="nickname" type="text" class="form-control" placeholder="nickname" >
			</div>
	
			<div class="form-group row" style="margin-top: 10px">
				<div class="col-sm-offset-2 col-sm-10 ">
				<button type="submit" class="btn" style="color: white;">회원가입</button>
				<button type="reset" class="btn" style="color: white;" onclick="reset()">취소</button>
				</div>
			</div>
		</form>
	</div>
	
	<%@include file="../footer.jsp" %>

</body>
</html>