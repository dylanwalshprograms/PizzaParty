<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vote</title>
</head>
<body>
<p>Navigation: <a href = "/">Parties</a> <a href = "/review"> Review Options</a></p>
	<h2>Pizza Options For Party: ${party.name} </h2>
	<table>
		<tr>
			<th>Name</th><th>Description</th><th>Votes</th>
		</tr>
	    <c:forEach items="${partyOptions}" var="option">
	    <tr>
	    	<td><c:out value="${option.name}"/></td>
			<td><c:out value="${option.description}"/></td>
			<td><c:out value="${option.votes}"/></td>
			<td><a href = "/add-vote/${option.id}">Vote!</a></td>
		</tr>
		</c:forEach>
	</table>
	<br>
	<form action = "/add-option">
		<label>Name:</label>
		<input type = "text" name = "name"></input>
		<label>Description:</label>
		<input type = "text" name = "description"></input>
		<button>Add</button>
	</form>

</body>
</html>