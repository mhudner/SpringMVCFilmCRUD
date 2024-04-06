<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="index.css">
</head>
<body>

	<h1>MVC Film</h1>


	<div>

		<!-- <form id="searchFilm" action="find.do">

			<label>Film id: <input type="text" name="id"></label> <input
				type="submit" value="Search" form="searchFilm">

		</form>
 -->
	</div>


	<div class="addFilmCont">

		<form id="addFilmForm" action="addFilm.do" method="POST">

			<div>

				<div>

					<label>Title </label> <input type="text" name="title" required/>

				</div>

				<div>

					<label>Description</label> <input type="text" name="description"/>
					<!-- <textarea name="description" cols="30" rows="20"></textarea> -->

				</div>

			</div>

			<div>

				<div>

					<label for="addMovieYear">Release Year</label> <input type="text"
						name="releaseYear" placeholder="YYYY"/>

				</div>

				<div>

					<label>Rating</label> <input type="text" name="rating"/>

				</div>

				<div>

					<label>Language Id</label> <input type="text"
						name="languageId" required/>

					<!-- 	<select name="language"
						id="addFilmLanguage">
						<option value="1" selected>English</option>
						<option value="2">Italian</option>
						<option value="3">Japanese</option>
						<option value="4">Mandarin</option>
						<option value="5">French</option>
						<option value="6">German</option>
					</select> -->

				</div>

				<div>

					<label>Length</label> <input type="text"
						name="length"/>
				</div>

				<div>

					<label>Replacement Cost </label> <input type="text"
						name="replacementCost"/>

				</div>
			</div>

			<div>

				<div>

					<label>Rental Rate </label> <input type="text" name="rentalRate"/>

				</div>
				<div>

					<label>Special Features</label> <input type="text"
						name="specialFeatures"/>
					<!--	<textarea name="specialFeatures" cols="20" rows="17"></textarea> -->

				</div>
				<div>

					<input type="submit" value="submit"/>

				</div>

			</div>

		</form>

	</div>






</body>
</html>