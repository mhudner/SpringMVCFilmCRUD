<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
main {
	display: flex;
	flex-flow: row wrap;
	gap: .5rem;
	justify-content: space-around;
	gap: .5rem;
	
}

.hidden{
	display:none !important;
}

.card {
	display: flex;
	flex-flow: column;
	background-color: grey;
	border-radius: 1rem;
	flex: 1 1 15%;
	text-align: center;
	padding: .5em;
	min-width: 200px;
	max-width: 250px;
}

.canDelete {
	background-color: red;
}
</style>
</head>
<body>
	<header>

		<a href="index"> Back To Start</a>

	</header>

	<main>





		<c:forEach var="film" items="${films}">



			<c:choose>

				<c:when test="${film.id > 1000}">
					<div class="card canDelete">
						<p>${film.title}</p>
						<p>${film.description}</p>


						<form action="delete" method="POST">
							<input class="hidden" name="id" readonly="readonly" type="text"
								value="${film.id}" /> <input type="submit" value="delete">
						</form>


						<form action="editFilm" method="POST">
							<input class="hidden" name="id" type="text" value="${film.id}" />
							<input type="submit" value="edit">
						</form>
					</div>
				</c:when>

				<c:otherwise>
					<div class="card">
						<p>${film.title}</p>
						<p>${film.description}</p>


						<form action="delete" method="POST">
							<input class="hidden" name="id" readonly="readonly" type="text"
								value="${film.id}" /> <input type="submit" value="delete">
						</form>


						<form action="editFilm" method="POST">
							<input class="hidden" name="id" type="text" value="${film.id}" />
							<input type="submit" value="edit">
						</form>

					</div>








				</c:otherwise>
			</c:choose>


		</c:forEach>


	</main>





</body>
</html>