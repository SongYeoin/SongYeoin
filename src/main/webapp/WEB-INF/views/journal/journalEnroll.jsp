<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/journal/journalEnroll.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
</head>
<body>


	<div class="journal_content_wrap">
		<div class="journal_content_subject">
			<span>교육일지 등록</span>
		</div>
		<div class="journal_content_main">
			<form action="/journal/journalEnroll.do" method="post"
				id="enrollForm">
				<div class="form_section">
					<div class="form_section_title">
						<label>교육일지 제목</label>
					</div>
					<div class="form_section_content">
						<input name="journalTitle"> <span id="warn_journalTitle">교육일지
							제목을 입력 해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>교육일지 작성일자</label>
					</div>
					<div class="form_section_content">
						<!-- 날짜 선택을 위한 input 요소 -->
						<input type="date" id="writeDate" name="writeDate" /> <span
							id="warn_date">날짜를 선택해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label for="journalFile">첨부파일</label>
					</div>
					<div class="form_section_content">
						<!-- 파일 첨부를 위한 input 요소 -->
						<input name="fileNo" type="file" id="fileNo" /> <span
							id="warn_fileNo">교육일지 파일을 첨부해주세요.</span>
					</div>
				</div>
			</form>
			<div class="btn_section">
				<button id="cancelBtn" class="btn">취 소</button>
				<button id="enrollBtn" class="btn enroll_btn">등 록</button>
			</div>
		</div>
	</div>


	<script>
		/* 등록 버튼 */
		$("#enrollBtn").click(function() {
			/* 검사 통과 유무 변수 */
			let titleCheck = false; // 일지 제목
			let writeDateCheck = false; // 일지 작성일자
			let fileCheck = false; // 일지 첨부파일

			/* 입력값 변수 */
			let journalTitle = $('input[name=journalTitle]').val(); // 일지 제목
			let writeDate = $('input[name=writeDate]').val(); // 일지 작성일자
			let fileNo = $('input[name=fileNo]').val(); // 일지 첨부파일

			/* 공란 경고 span 태그 */
			let wJournalTitle = $('#warn_journalTitle');
			let wWriteDate = $('#warn_date'); // 수정: warn_writeDate -> warn_date
			let wFileNo = $('#warn_fileNo');

			/* 일지 제목 공란 체크 */
			if (journalTitle === '') {
				wJournalTitle.css('display', 'block');
				titleCheck = false;
			} else {
				wJournalTitle.css('display', 'none');
				titleCheck = true;
			}

			/* 일지 작성일자 공란 체크 */
			if (writeDate === '') {
				wWriteDate.css('display', 'block');
				writeDateCheck = false;
			} else {
				wWriteDate.css('display', 'none');
				writeDateCheck = true;
			}

			/* 첨부파일 공란 체크 */
			if (fileNo === '') {
				wFileNo.css('display', 'block');
				fileCheck = false;
			} else {
				wFileNo.css('display', 'none');
				fileCheck = true;
			}

			/* 최종 검사 */
			if (titleCheck && writeDateCheck && fileCheck) {
				$("#enrollForm").submit();
			} else {
				return;
			}
		});

		/* 취소 버튼 */
		$("#cancelBtn").click(function() {
			location.href = "/journal/journalList";
		});
	</script>


</body>
</html>