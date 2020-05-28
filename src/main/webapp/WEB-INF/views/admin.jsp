<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
</head>
<body>
<p>Navigation: <a href = "/">Back to Homepage</a>
<h1>Party Admin</h1>
	<ul>
		<c:forEach items = "${parties}" var = "party">
			<li>${party.name} - ${party.date} <a href = "/edit?id=${party.id}">Edit </a><a href="/delete/${party.id}" > Delete</a></li>
		</c:forEach>


	</ul>
	
	<a href = "/add-party">Add a Party</a>

</body>
</html>