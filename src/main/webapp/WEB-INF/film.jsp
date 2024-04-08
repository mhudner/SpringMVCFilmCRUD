<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">


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
	max-width: 300px;
}

/* .card {
	display: flex;
	flex-flow: column;
	
	border-radius: 1rem;
	text-align: center;
	padding: .5em;
	max-width: 250px;
	li
	{
	list-style
	:
	none;
} */
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




		<a class="btn btn-primary" href="index"> Back To Start</a>

		<c:if test="${film != null}">


			<c:choose>

				<c:when test="${film.id > 1000}">
									<div class="card">
						<div class="card-header">
							<h4>${film.title}</h4>
						</div>
						<div class="card-body">

							<div class="row">
								<p>Description:</p>
								<p>${film.description}</p>
							</div>


							<div class="row">
								<p class="col">Rating:</p>
								<p class="col">${film.rating}</p>
							</div>

							<div class="row">
								<p class="col">Release Year:</p>
								<p class="col">${film.releaseYear}</p>
							</div>



							<div class="accordion" id="accordionExample">
								<div class="accordion-item">
									<h2 class="accordion-header">

										<button class="accordion-button .collapsed" type="button"
											data-bs-toggle="collapse" data-bs-target="#collapseOne"
											aria-expanded="false" aria-controls="collapseOne">

											Details</button>
									</h2>
									<div id="collapseOne" class="accordion-collapse collapse"
										data-bs-parent="#accordionExample">


										<div class="accordion-body">
											<div class="row">
												<p class="col">Length:</p>
												<p class="col">${film.length}</p>
											</div>

											<div class="row">
												<p class="col">Replacement Cost:</p>
												<p class="col">$${film.replacementCost}</p>
											</div>



											<div class="row">
												<p class="col">Rental Rate:</p>
												<p class="col">$${film.rentalRate}</p>
											</div>

											<div class="row">
												<p class="col">Rental Rate:</p>
												<p class="col">$${film.rentalRate}</p>
											</div>

											<div class="row">
												<p class="col">Category:</p>
												<p class="col">${film.category}</p>
											</div>
										</div>
									</div>
								</div>


								<div class="accordion-item">
									<h2 class="accordion-header">

										<button class="accordion-button .collapsed" type="button"
											data-bs-toggle="collapse" data-bs-target="#collapseTwo"
											aria-expanded="false" aria-controls="collapseTwo">

											Cast</button>
									</h2>
									<div id="collapseTwo" class="accordion-collapse collapse"
										data-bs-parent="#accordionExample">


										<div class="accordion-body">



											<ul class="list-group list-group-flush">
												<c:forEach var="actor" items="${film.actors}">

													<li class="list-group-item">${actor.getFirstName()}${actor.getLastName()}</li>
												</c:forEach>

											</ul>
										</div>
									</div>
								</div>
							</div>
							
							<div class="btn-group" role="group" aria-label="Basic example">							
  								<input class="btn btn-primary" type="submit" value="delete" form="deleteFilm">
  								<input class="btn btn-primary" type="submit" value="edit" form="editFilm">
							</div>
						
							<form action="delete" method="POST" id="deleteFilm">
								<input class="hidden" name="id" readonly="readonly" type="text" value="${film.id}" />
								
							</form>

							<form action="editFilm" method="POST" id="editFilm">
								<input class="hidden" name="id" readonly="readonly" type="text"	value="${film.id}" />
						        
					        </form>
						</div>
					</div>
				</c:when>

				<c:otherwise>
					<div class="card">
						<div class="card-header">
							<h4>${film.title}</h4>
						</div>
						<div class="card-body">

							<div class="row">
								<p>Description:</p>
								<p>${film.description}</p>
							</div>


							<div class="row">
								<p class="col">Rating:</p>
								<p class="col">${film.rating}</p>
							</div>

							<div class="row">
								<p class="col">Release Year:</p>
								<p class="col">${film.releaseYear}</p>
							</div>



							<div class="accordion" id="accordionExample">
								<div class="accordion-item">
									<h2 class="accordion-header">

										<button class="accordion-button .collapsed" type="button"
											data-bs-toggle="collapse" data-bs-target="#collapseOne"
											aria-expanded="false" aria-controls="collapseOne">

											Details</button>
									</h2>
									<div id="collapseOne" class="accordion-collapse collapse"
										data-bs-parent="#accordionExample">


										<div class="accordion-body">
											<div class="row">
												<p class="col">Length:</p>
												<p class="col">${film.length}</p>
											</div>

											<div class="row">
												<p class="col">Replacement Cost:</p>
												<p class="col">$${film.replacementCost}</p>
											</div>



											<div class="row">
												<p class="col">Rental Rate:</p>
												<p class="col">$${film.rentalRate}</p>
											</div>

											<div class="row">
												<p class="col">Rental Rate:</p>
												<p class="col">$${film.rentalRate}</p>
											</div>

											<div class="row">
												<p class="col">Category:</p>
												<p class="col">${film.category}</p>
											</div>
										</div>
									</div>
								</div>


								<div class="accordion-item">
									<h2 class="accordion-header">

										<button class="accordion-button .collapsed" type="button"
											data-bs-toggle="collapse" data-bs-target="#collapseTwo"
											aria-expanded="false" aria-controls="collapseTwo">

											Cast</button>
									</h2>
									<div id="collapseTwo" class="accordion-collapse collapse"
										data-bs-parent="#accordionExample">


										<div class="accordion-body">



											<ul class="list-group list-group-flush">
												<c:forEach var="actor" items="${film.actors}">

													<li class="list-group-item">${actor.getFirstName()}${actor.getLastName()}</li>
												</c:forEach>

											</ul>
										</div>
									</div>
								</div>
							</div>
							
							<div class="btn-group" role="group" aria-label="Basic example">							
  								<input class="btn btn-primary" type="submit" value="delete" form="deleteFilm">
  								<input class="btn btn-primary" type="submit" value="edit" form="editFilm">
							</div>
						
							<form action="delete" method="POST" id="deleteFilm">
								<input class="hidden" name="id" readonly="readonly" type="text" value="${film.id}" />
								
							</form>

							<form action="editFilm" method="POST" id="editFilm">
								<input class="hidden" name="id" readonly="readonly" type="text"	value="${film.id}" />
						        
					        </form>
						</div>
					</div>
				</c:otherwise>
			</c:choose>

					<%-- 

						<h3>Cast</h3>
						
						
						
						<div class="accordion" id="accordionExample">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        Accordion Item #1
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
      </div>
    </div>
  </div>  
</div>
						
						
						
						
						
						
						
						
						--%>



					

		</c:if>

		<c:if test="${film == null}">

			<h1>Cannot find, please try again.</h1>
		</c:if>

	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>
</html>
