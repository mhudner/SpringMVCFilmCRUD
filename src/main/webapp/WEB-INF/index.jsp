<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

<style type="text/css">
main {
	display: flex;
	gap: 2em;
}

.addFormCont {
	background-color: blue;
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
	display:flex;
	flex-flow: column;
	gap: 1em;

	label { 
	background-color:grey;
	padding: 1em;
	border-radius: 1rem;
}
}
</style>

</head>
<body class="ick">
	<h1>MVC Film</h1>

	<main>

		<div class="selections">
			<label for="option1">Search Film By ID</label> <label for="option2">Search
				films by keyword</label> <label for="option3">Add a film</label>
		</div>
		<div class=hideOptions>
			<input type="radio" name="options" id="option1">

			<form id="searchFilm" action="find.do">

				<label>Film id: <input type="text" name="id"></label> <input
					type="submit" value="Search" form="searchFilm">
			</form>

		</div>




		<div class=hideOptions>
			<input type="radio" name="options" id="option2">

			<form action="searchByWord">
				<label>Search By Keyword <input type="text" name="search"></label>
				<input type="submit" value="Search">
			</form>
		</div>

		<div class=hideOptions>
			<input type="radio" name="options" id="option3">
			<div class="addFormCont">
				<form id="addFilmForm" action="addFilm.do" method="POST">

					<h1>Add A Film</h1>

					<label>Title </label> <input type="text" name="title" required />
					<br> <label>Description</label> <input type="text"
						name="description" /> <br> <label for="addMovieYear">Release
						Year</label> <input type="text" name="releaseYear" placeholder="YYYY"
						value="2001" /> <br> <select name="language"
						id="addFilmLanguage">
						<option value="1" selected>English</option>
						<option value="2">Italian</option>
						<option value="3">Japanese</option>
						<option value="4">Mandarin</option>
						<option value="5">French</option>
						<option value="6">German</option>
					</select> <br> <label>Length</label> <input type="text" name="length" />
					<br> <label>Replacement Cost </label> <input type="text"
						name="replacementCost" /> <br> <label>Rating</label> <input
						type="text" name="rating" /> <br> <label>Rental Rate
					</label> <input type="text" name="rentalRate" /> <br> <input
						type="submit" value="submit" />
				</form>
			</div>
		</div>


	</main>
</body>
</html>