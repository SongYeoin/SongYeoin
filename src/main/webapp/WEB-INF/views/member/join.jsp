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
    height: 150vh;
    background-color: #f0f0f0;
}

#join-wrap {
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}

.join-wrapper {
    width: 600px;
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
    background-color: #b3b3b3;
}

.error {
    color: red;
    font-size: 14px;
    height: 20px; 
    line-height: 20px; 
    display: block;
    margin: 5px 0;
}

.error.valid {
    color: green; 
    font-size: 14px; 
    margin-top: 5px; 
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
			
			<input type="text" name="memberBirthday" id="memberBirthday" placeholder="*생년월일 8자리" ><br>
			<span id="memberBirthdayType" class="error"></span>
			
			<input type="text" name="memberGender" id="memberGender" placeholder="*성별 (M/F)" ><br>
            <span id="memberGenderType" class="error"></span>
			
			<input type="tel" id="memberPhone" name="memberPhone" placeholder="*전화번호" maxlength="16"><br>
			<span id="memberPhoneType" class="error"></span>
			
			<input type="email" name="memberEmail" id="memberEmail" placeholder="*이메일" ><br>
			<span id="memberEmailType" class="error"></span>
			
			<input type="text" name="memberAddress" id="memberAddress" placeholder="*우편번호" readonly>
            <button type="button" id="findAddress">주소 검색</button><br>
            <span id="memberAddressCodeType" class="error"></span>

            <input type="text" name="memberStreetAddress" id="memberStreetAddress" placeholder="*도로명주소" readonly><br>
            <span id="memberStreetAddressType" class="error"></span>

            <input type="text" name="memberDetailAddress" id="memberDetailAddress" placeholder="*상세주소" readonly><br>
            <span id="memberDetailAddressType" class="error"></span>
			
			<input type="text" name="memberNickname" id="memberNickname" placeholder="*닉네임" ><br>
			<span id="memberNicknameType" class="error"></span>
			
			
			
			<label for="agreeTerms" class="agree-container">
				<input type="checkbox" id="agreeTerms" name="agreeTerms" >
				이용약관과 개인정보 수집 및 정보이용에 동의합니다
			</label>
			<span id="agreeTermsType" class="error"></span>
			
			<input type="submit" id="joinBtn" value="회원가입"><br>
			
		</form>
	</div>
	</div>
	
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script>
		$(document).ready(function() {
			
			// 주소 검색 버튼 클릭
			 $("#findAddress").click(function() {
			        execution_daum_address();
			    });

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
		    
		 	// 생년월일 입력 필드 실시간 유효성 검사
		    $("#memberBirthday").on('input', function() {
		        validatememberBirthday();
		    });
		 	
		 	// 성별 입력 필드 실시간 유효성 검사
		    $("#memberGender").on('input', function() {
		        validatememberGender();
		    });
		 	
		 	// 전화번호 입력 필드 실시간 유효성 검사
		    $("#memberPhone").on('input', function() {
		        validatememberPhone();
		    });
		 	
		 	// 이메일 입력 필드 실시간 유효성 검사
		    $("#memberEmail").on('input', function() {
		        validatememberEmail();
		    });
		 	
		 	// 주소 입력 필드 유효성 검사
		 	$("#memberAddress").on('input', function() {
		        validatememberAddress();
		    });
	

		    // 닉네임 입력 필드 실시간 유효성 검사
		    $("#memberNickname").on('input', function() {
		        validatememberNickname();
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
		        validatememberBirthday();
		        validatememberGender();
		        validatememberPhone();
		        validatememberEmail();
		        validatememberAddress();
		        validatememberNickname();
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
		    
		    // 생년월일 유효성 검사 함수
		    function validatememberBirthday() {
		    	
		    }
		    
		    // 성별 유효성 검사 함수
		    
		    // 전화번호 유효성 검사 함수
		    
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
		 	
		 	// 다음 주소 연동
			function execution_daum_address() {
				new daum.Postcode(
						{
							oncomplete : function(data) {
								// 팝업에서 검색결과 항목을 클릭했을 때 실행할 코드

								// 각 주소의 노출 규칙에 따라 주소를 조합한다.
								// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
								var addr = ''; // 주소 변수
								var extraAddr = ''; // 참고항목 변수

								//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
								if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
									addr = data.roadAddress;
								} else { // 사용자가 지번 주소를 선택했을 경우(J)
									addr = data.jibunAddress;
								}

								// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
								if (data.userSelectedType === 'R') {
									// 법정동명이 있을 경우 추가한다. (법정리는 제외)
									// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
									if (data.bname !== ''
											&& /[동|로|가]$/g.test(data.bname)) {
										extraAddr += data.bname;
									}
									// 건물명이 있고, 공동주택일 경우 추가한다.
									if (data.buildingName !== ''
											&& data.apartment === 'Y') {
										extraAddr += (extraAddr !== '' ? ', '
												+ data.buildingName
												: data.buildingName);
									}
									// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
									if (extraAddr !== '') {
										extraAddr = ' (' + extraAddr + ')';
									}
									// 주소변수 문자열과 참고항목 문자열 합치기
									addr += extraAddr;

								} else {
									addr += ' ';
								}

								// 우편번호와 주소 정보를 해당 필드에 넣는다.
								// document.getElementById('sample6_postcode').value = data.zonecode;
								// document.getElementById("sample6_address").value = addr;

								$("#memberAddress").val(data.zonecode);
								$("#memberStreetAddress").val(addr);

								// 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
								// document.getElementById("sample6_detailAddress").focus();
								$("#memberDetailAddress").attr("readonly", false);
								$("#memberDetailAddress").focus();
							}
						}).open();
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