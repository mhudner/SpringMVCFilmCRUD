<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
*{
	padding:0;
	margin:0;
	box-sizing: border-box;
}


body {
	background-color: pink;
}

.hidden {
	display: none !important;
}

main {
	height: 100svh;
	width: 100%; 
	display: flex;
	flex-flow: column;
	background-color: green;
	gap: .5em;
	justify-content: center;
	align-items: center;
}

.card {
	display: flex;
	flex-flow: column;
	background-color: grey;
	border-radius: 1rem;
	text-align: center;
	padding: .5em;
	max-width: 250px;
	
}

.canDelete {
	background-color: red;
}
</style>
</style>

</head>




<body>
	<main>


			<a href="index"> Back To Start</a>
		


		<c:choose>

			<c:when test="${film.id > 1000}">
				<div class="card canDelete">

					<h1>${film.title}</h1>
					<p>${film.description}</p>
					<p>${film.releaseYear}</p>
					<p>${film.length}</p>
					<p>${film.replacementCost}</p>
					<p>${film.rating}</p>
					<p>${film.rentalRate}</p>

					<form action="delete" method="POST">
						<input class="hidden" name="id" readonly="readonly" type="text"
							value="${film.id}" /> <input type="submit" value="delete">
					</form>

					<form action="editFilm" method="POST">
						<input class="hidden" name="id" readonly="readonly" type="text"
							value="${film.id}" /> <input type="submit" value="edit">
					</form>
				</div>
			</c:when>

			<c:otherwise>
				<div class="card">
					<h1>${film.title}</h1>
					<p>${film.description}</p>
					<p>${film.releaseYear}</p>
					<p>${film.length}</p>
					<p>${film.replacementCost}</p>
					<p>${film.rating}</p>
					<p>${film.rentalRate}</p>


					<form action="delete" method="POST">
						<input class="hidden" name="id" readonly="readonly" type="text"
							value="${film.id}" /> <input type="submit" value="delete">
					</form>

					<form action="editFilm" method="POST">
						<input class="hidden" name="id" readonly="readonly" type="text"
							value="${film.id}" /> <input type="submit" value="edit">
					</form>

				</div>
			</c:otherwise>
		</c:choose>
	</main>
</body>
</html>
