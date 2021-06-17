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
    input {
        margin: 20px;
    }
    .container {
        display: flex;
        justify-content: space-around;
        margin-top: 200px;
    }
    .right li {
        margin: 20px;
    }
    .right a {
        font-size: large;
        border: 2px solid black;
        padding: 10px;
    }
</style>
</head>
<body>
    <div class="container">
        <div class="left">
            <h1>New Dojo</h1>
            <form:form action="/createDojo" method="post" modelAttribute="dojo">
                <form:label path="name" >Name:</form:label>
                <form:input type="text" path="name"/>
                <input type="submit" value="Create"/>
            </form:form>
            <a href="ninjas/new">Create Ninja</a>
        </div>
        
        <div class="right">
            <c:forEach items= "${allDojos}" var="dojo">
                <ul>
                    <li><a href="${dojo.id}">${dojo.name}</a></li>
                </ul> <br>
            </c:forEach>
        </div>
    </div>
</body>
</html>