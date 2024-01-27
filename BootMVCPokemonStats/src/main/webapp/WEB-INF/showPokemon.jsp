<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<meta charset="UTF-8">
<link href="https://fonts.cdnfonts.com/css/pokemon-solid"
	rel="stylesheet">

<style>
body {
	font-family: 'Pokemon Solid', sans-serif;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<c:choose>
			<c:when test="${pokemon == null}">
				<h1>Pokemon with ${id} not found.</h1>
			</c:when>
			<c:otherwise>
				<h1>${pokemon.name} # ${pokemon.id}</h1>
				<div>
					<img
						src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemon.spriteId}.png">
				</div>

				<ul>

					<li>HP: ${pokemon.hitpoint} </li>
					<li>Attack: ${pokemon.attack}</li>
					<li>Defense: ${pokemon.defense}</li>
					<li>Special Attack: ${pokemon.specialAttack}</li>
					<li>Special Defense: ${pokemon.specialDefense}</li>
					<li>Speed: ${pokemon.speed}</li>

				</ul>
			</c:otherwise>
		</c:choose>


		<c:if test="${showNAV=='showPokemon'}">
			<nav>
				<a href="home.do">Back to Find</a> <a href="collection.do">Back to Collection</a>
		 <a href="update.do">Update
			Pokemon</a> <a href="delete.do">Delete Pokemon</a>
		
		</nav>
      
		</c:if>

	
		
		
	
			</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>