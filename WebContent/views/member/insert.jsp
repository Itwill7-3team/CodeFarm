<%@page import="com.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./img/logo.ico" rel="shortcut icon" type="image/x-icon">
<title>코딩팜-회원가입</title>
<link rel="stylesheet" href="./css/insert.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<%
 request.setCharacterEncoding("UTF-8");
 String m_email = (String)session.getAttribute("m_email");
 if(m_email != null){
	response.sendRedirect("./Main.le");
 }
%>
<jsp:include page="/include/header.jsp"></jsp:include>
	<div class="main">
		<div class="container">
				<h1>회원가입</h1>
			<form class="signup_form" method="post">
				<div class="input_container">
					<label class="input_label"> <span class="label_text">이메일</span>
						<input class="text_input" name="m_email" id="email" type="email">
						<input type="button" value="idcheck" id="id_check_btn">
					</label>
					<p class="error"></p>
				</div>
				<div class="input_container">
					<label class="input_label"> <span class="label_text">이메일
							확인</span> <input class="text_input" name="m_emailCheck" id="email_check"
						type="email">
					</label>
					<p class="error_msg"></p>
				</div>
				<div class="input_container">
					<label class="input_label"> <span class="label_text">비밀번호</span>
						<input class="text_input" type="password" id="password"
						name="m_pw">
					</label>
					<p class="error_msg1"></p>
					<div class="input_container">
						<label class="input_label"> <span class="label_text">비밀번호
								확인</span> <input class="text_input" type="password" id="password_check"
							name="m_pwCheck">
						</label>
						<p class="error_msg2"></p>
					</div>
					<div class="button_wrapper">
						<button type="submit" class="btn_sub">가입하기</button>
					</div>
					</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
	var idcheck=false;
	var idcheck2=false;
	var pwcheck=false;
	var pwcheck2=false;
	var regExpPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,15}$/;
	var regExpEm = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

		$(".btn_sub").click(function() {
			if(idcheck && idcheck2 && pwcheck && pwcheck2)
			$(".signup_form").attr("action","./MemberJoinAction.me"); //action 생성
			else{
				alert("양식을 맞춰주세요");
			}
		});

		$("#id_check_btn").click(function() {
			if($("#email").val()==""){
				$(".error").text("아이디를 입력해주세요!");
				$(".error").css("color", "red");
				idcheck=false;
				return;
			}
			if(!regExpEm.test($("#email").val())) {
				$(".error").text("이메일형식을 맞춰주세요");
				$(".error").css("color", "red");
				idcheck=false;
				return;
			}
			$.ajax({
				type : "POST",
				url : "./idCheck.me",
				data : {
					m_email : $("#email").val()
				},

				success : function(data) {
					if (data == 0) {
						$(".error").text("사용가능한 이메일입니다.");
						$(".error").css("color", "blue");
						idcheck=true;
						return;

					} else if (data == 1) {
						$(".error").text("이미 등록된 이메일입니다.");
						$(".error").css("color", "red");
						idcheck=false;
						return;
					}
				},
				error : function(xhr, status, error) {
					alert("error: " + error);
				}

			});
		});

		$("#email_check").on("input propertychange paste",function() {  //값을 입력하거나 값이 바뀌었을경우
			if ($("#email").val() == $("#email_check").val()) {
				$(".error_msg").text("이메일 확인");
				$(".error_msg").css("color", "blue");
				idcheck2=true;

			} else {
				$(".error_msg").text("이메일 불일치");
				$(".error_msg").css("color", "red");
				idcheck2=false;
			}
		});

		$("#password").on("input propertychange paste",function() { //값을 입력하거나 값이 바뀌었을경우
			if (!regExpPw.test($("#password").val())) {
				$(".error_msg1").text("숫자와 영문자 특수문자(선택) 조합으로 8~15자리를 사용해야 합니다.");
				$(".error_msg1").css("color", "red");
				pwcheck=false;
				return false;
			} else {
				$(".error_msg1").text("사용가능");
				$(".error_msg1").css("color", "blue");
				pwcheck=true;
			}

		});
		$("#password_check").on("input propertychange paste",function() { //값을 입력하거나 값이 바뀌었을경우
			if ($("#password").val() == $("#password_check").val()) {
				$(".error_msg2").text("비밀번호가 일치합니다.");
				$(".error_msg2").css("color", "blue");
				pwcheck2=true;

			} else {
				$(".error_msg2").text("비밀번호가 일치하지 않습니다.");
				$(".error_msg2").css("color", "red");
				pwcheck2=false;
			}
		});
	</script>
      <jsp:include page="/include/footer.jsp"></jsp:include>
      
      
</body>
</html>