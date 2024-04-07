<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h1>${film.title}</h1>
	
	<form action="delete" method="POST">
    	<input name="id" disabled="disabled" type = "text" value = "${film.id}" />
       <input type="submit" value="delete">
	</form>>
	
	<form action="editFilm" method="POST">
    	<input name="id" type = "text" value = "${film.id}" />
       <input type="submit" value="edit">
	</form>>