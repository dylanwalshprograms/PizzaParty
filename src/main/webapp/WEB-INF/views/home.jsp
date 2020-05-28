<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Homepage</title>
</head>
<body>
	<p>Navigation: <a href = "/admin">Admin</a></p>
	<br>
	<form action = "/">
		<label>Search by Name:</label>
		<input type="text" value="${param.keyword}" name="keyword" placeholder="Party Name" /> 
		<button>Search</button>			
	</form>
	<h1>Parties</h1>
	<ul>
		<c:forEach items = "${parties}" var = "party">
			<li>${party.name} - ${party.date} <a href = "/vote/${party.id}" >Voting </a><a href = "/review/${party.id}" >Review </a></li>
		</c:forEach>


</ul>

</body>
</html>