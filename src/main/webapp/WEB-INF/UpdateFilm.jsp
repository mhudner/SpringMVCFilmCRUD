<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film Edit</title>


</head>
<body>

	<form id="addFilmForm" action="updateFilm.do" method="POST">

		<label>Film Id</label> <input type="text" name="id" value="${film.id}">

		<label>Title </label> <input type="text" name="title" required
			value="${film.title}" /> <br> <label>Description</label> <input
			type="text" name="description" value="${film.description}" /> <br>
		<label for="addMovieYear">Release Year</label> <input type="text"
			name="releaseYear" placeholder="YYYY" value="${film.releaseYear}" />
		<br> <select name="language" id="addFilmLanguage">
			<option value="1" selected>English</option>
			<option value="2">Italian</option>
			<option value="3">Japanese</option>
			<option value="4">Mandarin</option>
			<option value="5">French</option>
			<option value="6">German</option>
		</select> <br> <label>Length</label> <input type="text" name="length"
			value="${film.length}" /> <br> <label>Replacement Cost </label>
		<input type="text" name="replacementCost"
			value="${film.replacementCost}" /> <br> <label>Rating</label> <input
			type="text" name="rating" value="${film.rating}" /> <br> <label>Rental
			Rate </label> <input type="text" name="rentalRate" value="${film.rentalRate}" />
		<br> <input type="submit" value="submit" />
	</form>


</body>
</html>