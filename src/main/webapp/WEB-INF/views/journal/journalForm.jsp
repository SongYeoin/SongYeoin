<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Journal Form</title>
</head>
<body>
    <h2>Submit Journal Entry</h2>
    <form:form method="post" action="${pageContext.request.contextPath}/journal/save" enctype="multipart/form-data">
        <form:input path="journalTitle" placeholder="Journal Title" />
        <input type="file" name="files" multiple />
        <button type="submit">Submit</button>
    </form:form>
</body>
</html>
