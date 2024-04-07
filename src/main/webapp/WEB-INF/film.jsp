<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
* {
	padding: 0;
	margin: 0;
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
	li
	{
	list-style
	:
	none;
}

}
}
.canDelete {
	background-color: red;
}

ul {
	
}
</style>

</head>




<body>
	<main>




		<a href="index"> Back To Start</a>

		<c:if test="${film != null}">


			<c:choose>

				<c:when test="${film.id > 1000}">
					<div class="card canDelete">

						<h1>${film.title}</h1>
						<p>Description: ${film.description}</p>
						<p>Release Year: ${film.releaseYear}</p>
						<p>Length: ${film.length}</p>
						<p>Replacement Cost: $${film.replacementCost}</p>
						<p>Rating: ${film.rating}</p>
						<p>Rental Rate: $${film.rentalRate}</p>
						<p>Category: ${film.category}</p>

						<h3>Actors</h3>
						<ul>
							<c:forEach var="actor" items="${film.actors}">
								<li>${actor.getFistName()}  ${actor.getLastName()}</li>
							</c:forEach>
						</ul>





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
						<p>Description: ${film.description}</p>
						<p>Release Year: ${film.releaseYear}</p>
						<p>Length: ${film.length}</p>
						<p>Replacement Cost: $${film.replacementCost}</p>
						<p>Rating: ${film.rating}</p>
						<p>Rental Rate: $${film.rentalRate}</p>
						<p>Category: ${film.category}</p>

						<%-- 			<c:if test="${films.actors != null || !films.actors.isEmpty()}">
 --%>
						<br>
						<h3>Cast</h3>
						<ul>
							<c:forEach var="actor" items="${film.actors}">
								<li>${actor.getFirstName()}  ${actor.getLastName()}</li>
							</c:forEach>
						</ul>

						<%-- 			</c:if>
 --%>

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
		</c:if>

		<c:if test="${film == null}">

			<h1>Cannot find, please try again.</h1>
		</c:if>

	</main>
</body>
</html>
