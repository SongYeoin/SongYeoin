<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Journal</title>
</head>
<body>
    <h1>Create Journal</h1>
    <form action="${pageContext.request.contextPath}/journal/save" method="post" enctype="multipart/form-data">
        <label for="journalTitle">Title:</label>
        <input type="text" id="journalTitle" name="journalTitle" required/><br/><br/>

        <label for="journalDate">Date:</label>
        <input type="date" id="journalDate" name="journalDate" required/><br/><br/>

        <label for="files">Files:</label>
        <input type="file" id="files" name="files" multiple/><br/><br/>

        <input type="submit" value="Save"/>
    </form>

    <c:if test="${success}">
        <p>Journal and files uploaded successfully!</p>
    </c:if>
</body>
</html>
