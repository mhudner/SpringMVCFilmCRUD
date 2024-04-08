<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style type="text/css">
main {
	display: flex;
	gap: 2em;
}

.addFormCont {
	background-color: pink;
	padding: 1em;
}

.hideOptions {
	display: none; 
	&:has(input:checked){                 
	 	display: block;
}

input[name="options"] {
	display: none;
}

}
.selections {
	display: flex;
	flex-flow: column;
	gap: 1em;
	padding: 1em;
	border-radius: 1rem;
}
}
.addFilmForm{
	display: flex !important;
	flex-flow: column !important;
}

</style>

</head>
<body class="ick">
	<h1>MVC Film</h1>






	<main>

		<div class="selections">
			<label class="btn btn-primary" for="option1" >Search Film By ID</label> 
			<label class="btn btn-primary" for="option2">Search films by keyword</label> 
			<label class="btn btn-primary" for="option3">Add a film</label>
		</div>
		<div class=hideOptions>
		
			<input type="radio" name="options" id="option1">

			<form id="searchFilm" action="find.do">

				<label class="form-label"> Film id</label>
				<input class="form-control" type="text" name="id">
				
				<br>
				
				<input class="btn btn-primary" type="submit" value="Search" form="searchFilm">
				
			</form>

		</div>

		<div class=hideOptions>
			<input type="radio" name="options" id="option2">

			<form action="searchByWord">
				<label class="form-label"> Search By Keyword </label>
				<input class="form-control" type="text" name="search">
				
				<br>
				
				<input class="btn btn-primary" type="submit" value="Search">
			</form>
		</div>

		<div class=hideOptions>
			<input type="radio" name="options" id="option3">
			<div class="addFormCont">
				<form id="addFilmForm" action="addFilm.do" method="POST">

					<h1>Add A Film</h1>

					<label class="form-label">Title </label> 
					<input class="form-control" type="text" name="title" required />
					
					
					<label class="form-label">Description</label> 
					<input class="form-control" type="text" name="description" /> 
					
					
					<label class="form-label">Release Year</label>
					<input class="form-control" type="text" name="releaseYear" placeholder="YYYY" value="2001" />
		
					<label class="form-label">Language</label> 
					<select class="form-select" name="language">
						<option value="1" selected>English</option>
						<option value="2">Italian</option>
						<option value="3">Japanese</option>
						<option value="4">Mandarin</option>
						<option value="5">French</option>
						<option value="6">German</option>
					</select>
			
					<label class="form-label">Length</label> 
					<input class="form-control" type="text" name="length" /> 
					
					<label class="form-label">Replacement Cost </label> 
					<input class="form-control" type="text" name="replacementCost" /> 
					
					<label class="form-label">Rating</label>
					<input class="form-control" type="text" name="rating" placeholder="G,PG,PG13,R,NC17"/>
		
					<label class="form-label">Rental Rate </label> 
					<input class="form-control" type="text" name="rentalRate" /> 	
						
						<br>
						
					<input class="btn btn-primary" type="submit" value="submit" />
				</form>
			</div>
		</div>
		


	</main>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>