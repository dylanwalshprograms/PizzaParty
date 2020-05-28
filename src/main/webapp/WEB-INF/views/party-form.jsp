<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Party Form</title>
</head>
<body>

		

			<h2>
				<c:out value="${title}" />
			</h2>

	
		
		<section>

			<form method="post">

				<input name="id" type="hidden" value="${party.id}">

				<div class="form-group">
					<label>Name:</label> 
					<input name="name" value="${party.name}">
				</div>

				<div class="form-group">
					<label>Date:</label> 
					<input type = "date" name="date" value="${party.date}">
				</div>


				<button>Submit</button>

				<a href="/admin">Cancel</a>

			</form>

		</section>

</body>
</html>