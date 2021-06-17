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
	table {
		border: 2px solid black;
		margin: 20px 0px;
	}
	th {
		border: 2px solid black;
		padding: 10px;
	}
	td {
		border: 2px solid black;
		padding: 10px;
	}
	a {
		margin: 10px;
	}
</style>
</head>
<body>
	<div class="container">
		<h1>${dojo.name} Location Ninjas</h1>
		
		<table>
			<thead>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Age</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${dojoToShow.ninjas}" var="ninja">
				<tr>
					<td>${ninja.first_name}</td>
					<td>${ninja.last_name}</td>
					<td>${ninja.age}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<a href="/dojos/new">Create Dojo</a>
		<a href="ninjas/new">Create Ninja</a>
	</div>
</body>
</html>