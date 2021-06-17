<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    .container {
        margin: 200px;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>New Ninja</h1>
        
        <form:form action="/createNinja" method="post" modelAttribute="ninja">
            <p>
                <form:label path="dojo">Select Dojo:</form:label>
                <form:select path="dojo">
                    <c:forEach items="${allDojos}" var="dojo">
                        <option value="${dojo.id}">${dojo.name}</option>
                    </c:forEach>
                </form:select>
            </p>
            <p>
                <form:label path="first_name" >First Name:</form:label>
                <form:input type="text" path="first_name"/>
            </p>
            <p>
                <form:label path="Last_name" >Last Name:</form:label>
                <form:input type="text" path="Last_name"/>
            </p>
            <p>
                <form:label path="age" >Age:</form:label>
                <form:input type="text" path="age"/>
            </p>
            <p>
                <input type="submit" value="Create"/>
            </p>
        </form:form>
        
        <a href="/dojos/new">Create Dojo</a>
    </div>
</body>
</html>