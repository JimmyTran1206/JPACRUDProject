<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirm Pokemon Deletion</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">


<link href="https://fonts.cdnfonts.com/css/pokemon-solid"
	rel="stylesheet">

<style>
body>div.container {
	font-family: 'Pokemon Solid', sans-serif;
	max-width: 800;
	margin: 36px auto;
}

#background-video {
	width: 100vw;
	height: 100vh;
	object-fit: cover;
	position: fixed;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	z-index: -1;
	opacity: 0.9;
}

h1 {
	color: #c0a50c;
}

nav {
	display: flex;
	justify-content: space-between;
	margin-top: 20px
}

nav a, button {
	display: inline-block;
	font-size: 20px;
	text-decoration: none;
	background: linear-gradient(to right, #227ed4, #be2a56);
	padding: 10px;
	color: #c0a50c;
	border-radius: 6px;
	box-shadow: 2px 4px 8px rgba(0, 0, 0, 0.3);
}

nav a:hover, button:hover {
	background: linear-gradient(to right, #be2a56, #227ed4);
	cursor: pointer;
	position: relative;
	top: -3px;
	left: -3px;
	border: 0.5px solid blue;
}

nav a:click, button:click {
	position: static;
}
</style>
</head>
<body>
	<!-- The video -->
	<video autoplay muted loop id="background-video">
		<source src="deleteConfirmationBackground.mp4" type="video/mp4">
	</video>
	<!-- The video -->
	<div class="container">
		<h1>Your pokemon ${pokemon.name} with id #${pokemon.id} has been
			deleted from your collection</h1>
		<nav>
			<a href="delete.do">Back to home</a>
		</nav>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>