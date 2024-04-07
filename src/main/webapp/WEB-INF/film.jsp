<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

body{
background-color: pink;
}

</style>

</head>
<body>
	<h1>${film.title}</h1>
	<p>${film.description}</p>
	<p>${film.releaseYear}</p>
	<p>${film.length}</p>
	<p>${film.replacementCost}</p>
	<p>${film.rating}</p>
	<p>${film.rentalRate}</p>
	
	<form action="delete" method="POST">
    	<input name="id" readonly="readonly" type = "text" value = "${film.id}" />
       <input type="submit" value="delete">
	</form>>
	
	<form action="editFilm" method="POST">
    	<input name="id" type = "text" value = "${film.id}" />
       <input type="submit" value="edit">
	</form>>