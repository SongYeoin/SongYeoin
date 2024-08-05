<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>송파여성인력센터 회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
body, h2, p, form {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: #f0f0f0;
}

#join-wrap {
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}

.join-wrapper {
    width: 500px;
    padding: 30px;
    background-color: #ffffff;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: left;
}

h2 {
    margin-bottom: 20px;
    font-size: 24px;
    color: #333;
    text-align: center;
}

form input[type="text"], 
form input[type="password"],
form input[type="email"] {
    width: calc(100% - 20px);
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 16px;
    color: #333;
}

form input[type="submit"] {
    width: 100%;
    padding: 10px;
    border: none;
    border-radius: 5px;
    background-color: #000000;
    color: #fff;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

form input[type="submit"]:hover {
    background-color: #0056b3;
}

.error {
    color: red;
    font-size: 14px;
    height: 20px; 
    line-height: 20px; 
    display: block;
    margin: 5px 0;
}

.agree-container {
    margin-bottom: 10px;
}

p a {
    color: #000000;
    text-decoration: none;
}

p a:hover {
    text-decoration: underline;
}
</style>
</head>
<body>
<div id="wrap">
<div class="join-wrapper">
		<h2>Sign Up</h2>
		<form action="${ pageContext.servletContext.contextPath }/member/join" method="post" id="join-form">
		
			<input type="text" name="memberId" id="memberId" placeholder="*아이디" ><br>
			<span id="memberIdType" class="error"></span>
			
			<input type="password" name="memberPwd" id="memberPwd" placeholder="*비밀번호" ><br>
			<span id="memberPwdType" class="error"></span>
			
			<input type="password" name="memberPwdCheck" id="memberPwdCheck" placeholder="*비밀번호 확인" ><br>
			<span id="memberPwdCheckType" class="error"></span>
			
			<input type="text" name="memberName" id="memberName" placeholder="*이름" ><br>
			<span id="memberNameType" class="error"></span>
			
			<input type="text" name="memberNickname" id="memberNickname" placeholder="*닉네임" ><br>
			<span id="memberNicknameType" class="error"></span>
			
			<input type="email" name="memberEmail" id="memberEmail" placeholder="*이메일" ><br>
			<span id="memberEmailType" class="error"></span>
			
			<label for="agreeTerms" class="agree-container">
				<input type="checkbox" id="agreeTerms" name="agreeTerms" >
				이용약관과 개인정보 수집 및 정보이용에 동의합니다
			</label>
			<span id="agreeTermsType" class="error"></span>
			
			<input type="submit" id="joinBtn" value="회원가입"><br>
			
		</form>
	</div>
	</div>
	
	<script>
		$(document).ready(function() {

		    // 아이디 입력 필드 실시간 유효성 검사
		    $("#memberId").on('input', function() {
		        validatememberId();
		    });

		    // 비밀번호 입력 필드 실시간 유효성 검사
		    $("#memberPwd").on('input', function() {
		        validatememberPwd();
		    });

		    // 비밀번호 확인 입력 필드 실시간 유효성 검사
		    $("#memberPwdCheck").on('input', function() {
		        validatememberPwdCheck();
		    });

		    // 이름 입력 필드 실시간 유효성 검사
		    $("#memberName").on('input', function() {
		        validatememberName();
		    });

		    // 닉네임 입력 필드 실시간 유효성 검사
		    $("#memberNickname").on('input', function() {
		        validatememberNickname();
		    });

		    // 이메일 입력 필드 실시간 유효성 검사
		    $("#memberEmail").on('input', function() {
		        validatememberEmail();
		    });

		    // 이용약관 동의 체크박스 실시간 유효성 검사
		    $("#agreeTerms").on('change', function() {
		        validateAgreeTerms();
		    });

		    // 폼 제출 시 유효성 검사
		    $("#join-form").submit(function(event) {
		        let isValid = true;

		        validatememberId();
		        validatememberPwd();
		        validatememberPwdCheck();
		        validatememberName();
		        validatememberNickname();
		        validatememberEmail();
		        validateAgreeTerms();

		        // 모든 입력 필드 유효성 검사
		        // error 요소가 'invalid' 클래스를 가지고 있는지 확인
		        $(".error").each(function() {		 
		            if ($(this).hasClass('invalid')) { 
		                isValid = false;	// 유효성 검사 실패
		                return false; 		// 유효성 검사 실패 시 바로 종료
		            }
		        });

		        if (!isValid) {
		            event.preventDefault();
		        }
		    });

		    // 아이디 유효성 검사 함수
		    function validatememberId() {
		        let memberIdPattern = /^[a-z0-9_]{6,12}$/;
		        let memberId = $("#memberId").val().trim();

		        if (memberId === "") {
		            $("#memberIdType").text("아이디는 필수입니다.").removeClass('valid').addClass('invalid');
		        } else if (memberIdPattern.test(memberId)) {
		            dupCheckmemberId(memberId);
		        } else {
		            $("#memberIdType").text("아이디는 6~12자의 영문 소문자, 숫자, 특수기호(_) 만 사용 가능합니다.").removeClass('valid').addClass('invalid');
		        }
		    }
		    
		 	// 아이디 중복 체크 함수
		    function dupCheckmemberId(memberId) {
		        $.ajax({
		            url: "${ pageContext.servletContext.contextPath }/member/check-id",
		            type: "post",
		            data: {memberId: memberId},
		            success: function(data) {
		                if (data.trim() === 'success') {
		                    $("#memberIdType").text("사용 가능한 ID 입니다.").removeClass('invalid').addClass('valid');
		                } else {
		                    $("#memberIdType").text("이미 사용 중인 ID 입니다.").removeClass('valid').addClass('invalid');
		                }
		            },
		            error: function(error) {
		                $("#memberIdType").text("아이디 확인 중 오류가 발생하였습니다.").removeClass('valid').addClass('invalid');
		            }
		        });
		    }

		    // 비밀번호 유효성 검사 함수
		    // 특수문자(!@#$%^&*?_) 가능
		    function validatememberPwd() {
 		        /* let memberPwdPattern = /^(?=.*[A-Za-z])(?=.*\d)|(?=.*[A-Za-z])(?=.*[!@#$%^&*?_])|(?=.*\d)(?=.*[!@#$%^&*?_])[A-Za-z\d!@#$%^&*?_]{8,16}$/; */
 		        let memberPwdPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*?_])[A-Za-z\d!@#$%^&*?_]{8,16}$/;
		        let memberPwd = $("#memberPwd").val().trim();

		        if (memberPwd === "") {
		            $("#memberPwdType").text("비밀번호는 필수입니다.").removeClass('valid').addClass('invalid');
		        } else if (memberPwdPattern.test(memberPwd)) {
		            $("#memberPwdType").text("사용할 수 있는 비밀번호 형식입니다.").removeClass('invalid').addClass('valid');
		        } else {
		            $("#memberPwdType").text("비밀번호는 8~16자의 영문자, 숫자, 특수문자를 모두 포함해야합니다.").removeClass('valid').addClass('invalid');
		        }
		    }

		    // 비밀번호 확인 유효성 검사 함수
		    function validatememberPwdCheck() {
		        let memberPwd = $("#memberPwd").val().trim();
		        let memberPwdCheck = $("#memberPwdCheck").val().trim();

		        if (memberPwdCheck === "") {
		            $("#memberPwdCheckType").text("비밀번호 확인은 필수입니다.").removeClass('valid').addClass('invalid');
		        } else if (memberPwd === memberPwdCheck) {
		            $("#memberPwdCheckType").text("비밀번호가 일치합니다.").removeClass('invalid').addClass('valid');
		        } else {
		            $("#memberPwdCheckType").text("비밀번호가 일치하지 않습니다.").removeClass('valid').addClass('invalid');
		        }
		    }

		    // 이름 유효성 검사 함수
		    function validatememberName() {
		        let memberNamePattern = /^[가-힣a-zA-Z]{2,15}$/;
		        let memberName = $("#memberName").val().trim();

		        if (memberName === "") {
		            $("#memberNameType").text("이름은 필수입니다.").removeClass('valid').addClass('invalid');
		        } else if (memberNamePattern.test(memberName)) {
		            $("#memberNameType").text("").removeClass('invalid').addClass('valid');
		        } else {
		            $("#memberNameType").text("이름은 2~15자의 한글 또는 영문자만 입력 가능합니다.").removeClass('valid').addClass('invalid');
		        }
		    }

		    // 닉네임 유효성 검사 함수
		    function validatememberNickname() {
		        let memberNicknamePattern = /^[가-힣a-zA-Z0-9]{2,15}$/;
		        let memberNickname = $("#memberNickname").val().trim();

		        if (memberNickname === "") {
		            $("#memberNicknameType").text("닉네임은 필수입니다.").removeClass('valid').addClass('invalid');
		        } else if (memberNicknamePattern.test(memberNickname)) {
		            dupCheckmemberNickname(memberNickname);
		        } else {
		            $("#memberNicknameType").text("닉네임은 2~15자의 한글, 영문자, 숫자만 사용 가능합니다.").removeClass('valid').addClass('invalid');
		        }
		    }

		    // 이메일 유효성 검사 함수
		    function validatememberEmail() {
		    	// ([-_.]?) 하나가 있을 수도 있고 없을 수도 있음
		    	// * 이 패턴이 0번 이상 반복될 수 있음
		        let memberEmailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		        let memberEmail = $("#memberEmail").val().trim();

		        if (memberEmail === "") {
		            $("#memberEmailType").text("이메일은 필수입니다.").removeClass('valid').addClass('invalid');
		        } else if (memberEmailPattern.test(memberEmail)) {
		            dupCheckmemberEmail(memberEmail);
		        } else {
		            $("#memberEmailType").text("유효하지 않은 이메일 형식입니다.").removeClass('valid').addClass('invalid');
		        }
		    }
		    
		 	// 이메일 중복 체크 함수
		    function dupCheckmemberEmail(memberEmail) {
		        $.ajax({
		            url: "${ pageContext.servletContext.contextPath }/member/check-email",
		            type: "post",
		            data: {memberEmail: memberEmail},
		            success: function(data) {
		                if (data.trim() === 'success') {
		                    $("#memberEmailType").text("사용 가능한 이메일입니다.").removeClass('invalid').addClass('valid');
		                } else {
		                    $("#memberEmailType").text("이미 사용 중인 이메일입니다.").removeClass('valid').addClass('invalid');
		                }
		            },
		            error: function(error) {
		                $("#memberEmailType").text("이메일 확인 중 오류가 발생하였습니다.").removeClass('valid').addClass('invalid');
		            }
		        });
		    }

		    // 이용약관 동의 유효성 검사 함수
		    function validateAgreeTerms() {
		        if (!$("#agreeTerms").is(":checked")) {
		            $("#agreeTermsType").text("이용약관에 동의해야 합니다.").removeClass('valid').addClass('invalid');
		        } else {
		            $("#agreeTermsType").text("").removeClass('invalid')
		        }
		    }
		});
		
	</script>

</body>
</html>