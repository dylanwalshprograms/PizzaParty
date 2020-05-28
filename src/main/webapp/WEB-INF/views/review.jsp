<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>Navigation: <a href = "/">Parties</a> <a href = "/review"> Review Options</a></p>
	<h2>Pizza Options For ${party.name}</h2>
	<table>
		<tr>
			<th>Name</th><th>Description</th><th>Votes</th>
		</tr>
	    <c:forEach items="${partyOptions}" var="option">
		    <c:if test = "${option.votes > 0 }">
			    <tr>
			    	<td><c:out value="${option.name}"/></td>
					<td><c:out value="${option.description}"/></td>
					<td><c:out value="${option.votes}"/></td>
				</tr>
			</c:if>
		</c:forEach>
	</table>

</body>
</html>