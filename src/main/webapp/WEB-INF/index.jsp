<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
	background-color: blue; 
	.ick {color: blue}
</style>
<meta charset="UTF-8">
<title>Home</title>
<!-- <link rel="stylesheet" href="index.css">
 --></head>
<body class="ick">



	<h1>MVC Film</h1>

	<form id="searchFilm" action="find.do">

		<label>Film id: <input type="text" name="id"></label> <input
			type="submit" value="Search" form="searchFilm">

	</form>

	<form id="addFilmForm" action="addFilm.do" method="POST">

	<label>Title </label> 
			<input type="text" name="title" required /> 
		<br>
			<label>Description</label> 
			<input type="text" name="description"/>
		<br>
			<label for="addMovieYear">Release Year</label> 
			<input type="text" name="releaseYear" placeholder="YYYY" value="2001"/>
		<br>	
			<select name="language"	id="addFilmLanguage">
						<option value="1" selected>English</option>
						<option value="2">Italian</option>
						<option value="3">Japanese</option>
						<option value="4">Mandarin</option>
						<option value="5">French</option>
						<option value="6">German</option>
			</select> 
		<br>
			<label>Length</label>
			<input type="text" name="length" />
		<br>
			<label>Replacement Cost </label> 
			<input type="text" name="replacementCost"/>
		<br>	
			<label>Rating</label> 
			<input type="text" name="rating"/>
		<br>
			<label>Rental Rate </label> 
			<input type="text" name="rentalRate"/>
		<br>		
			<input type="submit" value="submit" /> 
	</form>

</body>
</html>