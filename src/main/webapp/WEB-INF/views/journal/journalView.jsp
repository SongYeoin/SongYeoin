<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Journal View</title>
</head>
<body>
    <h2>Journal Details</h2>
    <p><strong>Title:</strong> ${journal.journalTitle}</p>
    <p><strong>Date:</strong> ${journal.journalDate}</p>

    <h3>Attached Files</h3>
    <ul>
        <!-- Assuming files are fetched and added to the model attribute -->
        <c:forEach var="file" items="${journal.files}">
            <li>
                <a href="${pageContext.request.contextPath}/uploads/${file.fileSavedName}" download>
                    ${file.fileOriginalName}
                </a>
            </li>
        </c:forEach>
    </ul>
</body>
</html>
