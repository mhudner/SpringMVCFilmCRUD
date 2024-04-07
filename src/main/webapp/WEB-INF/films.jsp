<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<style type="text/css">
main {
	display: flex;
	flex-flow: row wrap;
	gap: .5rem;
	justify-content: space-around;
	gap: .5rem;
}

.hidden {
	display: none !important;
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
	li{
		list-style: none;
	}
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
						<p>Release Year: ${film.releaseYear}</p>
						<p>Length: ${film.length}</p>
						<p>Replacement Cost: $${film.replacementCost}</p>
						<p>Rating: ${film.rating}</p>
						<p>Rental Rate: ${film.rentalRate}</p>
						<p>Category: ${film.category}</p>					
						
						
						
					
  						<div class="accordion-item">
   							 <h2 class="accordion-header">
      							<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									     <h3>Cast: </h3>   						
      							</button>
    						</h2>
    					<div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
      						<div class="accordion-body">
        						
        						<ul>
									<c:forEach var = "actor" items="${film.actors}">
										<li>${actor.getFirstName()}  ${actor.getLastName()}</li>
									</c:forEach>
								</ul>
      						</div>
    					</div>
  					</div>
					
					

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
						<p>Release Year: ${film.releaseYear}</p>
						<p>Length: ${film.length}</p>
						<p>Replacement Cost: $${film.replacementCost}</p>
						<p>Rating: ${film.rating}</p>
						<p>Rental Rate: $${film.rentalRate}</p>
						<p>Category: ${film.category}</p>	
			
  						<div class="accordion-item">
   							 <h2 class="accordion-header">
      							<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									     <h3>Cast: </h3>   						
      							</button>
    						</h2>
    					<div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
      						<div class="accordion-body">
        						
        						<ul>
									<c:forEach var = "actor" items="${film.actors}">
										<li>${actor.getFirstName()}  ${actor.getLastName()}</li>
									</c:forEach>
								</ul>
      						</div>
    					</div>
  					</div>	
		
	
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




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>