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


<link href="https://fonts.cdnfonts.com/css/pokemon-solid"
	rel="stylesheet">
<title>Pokemon Info</title>

<style>
body {
	font-family: 'Pokemon Solid', sans-serif;
}

div.form-container, input {
	text-align: center;
	width: 50%;
}

label {
	font-size: 20px;
}
</style>
</head>
<body>
	<div class="container">
		<c:choose>
			<c:when test="${pokemon == null}">
				<h1>Pokemon with id #${id} not found.</h1>
				<c:if test="${showNAV=='showPokemon'}">
					<nav>
						<a href="home.do">Back to Find</a> <a href="collection.do">Back
							to Collection</a>
					</nav>
				</c:if>

				<c:if test="${showNAV=='deletePokemon'}">
					<nav>
						<a href="delete.do">Back to home</a>
					</nav>
				</c:if>

				<c:if test="${showNAV=='updatePokemon'}">
					<nav>
						<a href="update.do">Back to home</a>
					</nav>
				</c:if>

			</c:when>
			<c:otherwise>
				<c:if test="${showNAV=='deletePokemon'}">
					<p style="font-size: 24px">Do you really want to delete this
						pokemon?
					<p>
				</c:if>

				<c:if test="${showNAV=='updatePokemon'}">
					<p style="font-size: 24px">Updating Pokemon...
					<p>
				</c:if>
				<h1>${pokemon.name}#${pokemon.id}</h1>
				<div>
					<img
						src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemon.spriteId}.png">
				</div>

				<c:if test="${showNAV!='updatePokemon'}">
					<ul>

						<li>HP: ${pokemon.hitpoint}</li>
						<li>Attack: ${pokemon.attack}</li>
						<li>Defense: ${pokemon.defense}</li>
						<li>Special Attack: ${pokemon.specialAttack}</li>
						<li>Special Defense: ${pokemon.specialDefense}</li>
						<li>Speed: ${pokemon.speed}</li>

					</ul>
				</c:if>


				<c:if test="${showNAV=='showPokemon'}">
					<nav>
						<a href="home.do">Back to Find</a> <a href="collection.do">Back
							to Collection</a> <a href="updatePokemon.do?id=${pokemon.id}&spriteIdFromList=${pokemon.spriteId}">Update
							this Pokemon</a> <a href="deletePokemon.do?id=${pokemon.id}">Delete
							this Pokemon</a>
					</nav>
				</c:if>

				<c:if test="${showNAV=='deletePokemon'}">
					<nav>
						<a href="deletePokemonConfirmed.do?id=${pokemon.id}">Confirm
							Deletion</a> <a href="showPokemon.do?id=${pokemon.id}">Cancel</a> <a
							href="delete.do">Back to home</a>
					</nav>
				</c:if>

				<c:if test="${showNAV=='updatePokemon'}">

					<div class="container form-container">
						<form action="updatePokemonConfirmed.do" method="POST">
							<div class="row mb-3" style="display: none;">
								<div class="col">
									<label for="id" class="form-label">Pokemon id</label> <input
										type="number" class="form-control" id="id" name="id"
										value="${pokemon.id}">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col">
									<label for="name" class="form-label">Pokemon name</label> <input
										type="text" class="form-control" id="name" name="name"
										value="${pokemon.name}">
								</div>

								<div class="col-2"></div>

								<div class="col">
									<label for="hitpoint" class="form-label">Hit Points</label> <input
										type="number" class="form-control" id="hitpoint"
										name="hitpoint" value="${pokemon.hitpoint}">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col">
									<label for="attack" class="form-label">Attack</label> <input
										type="number" class="form-control" id="attack" name="attack"
										value="${pokemon.attack}">
								</div>

								<div class="col-2"></div>

								<div class="col">
									<label for="specialAttack" class="form-label">Special
										Attack</label> <input type="number" class="form-control"
										id="specialAttack" name="specialAttack"
										value="${pokemon.specialAttack}">
								</div>
							</div>

							<div class="row mb-3">
								<div class="col">
									<label for="defense" class="form-label">Defense</label> <input
										type="number" class="form-control" id="defense" name="defense"
										value="${pokemon.defense}">
								</div>

								<div class="col-2"></div>

								<div class="col">
									<label for="specialDefense" class="form-label">Special
										Attack</label> <input type="number" class="form-control"
										id="specialDefense" name="specialDefense"
										value="${pokemon.specialDefense}">
								</div>
							</div>

							<div class="row mb-3">
								<div class="col">
									<label for="speed" class="form-label">Speed</label> <input
										type="number" class="form-control" id="speed" name="speed"
										value="${pokemon.speed}">
								</div>

								<div class="col-2"></div>

								<div class="col">
									<label for="spriteId" class="form-label">Sprite Id</label> <input
										type="number" class="form-control" id="spriteId" min="1"
										max="1017" name="spriteId" value="${spriteId}">
									<div id="spriteIdHelp" class="form-text"
										style="font-size: 12px;">
										<a href="showSpriteShowPokeUpdate.do?pokemonId=${pokemon.id}">Available Pokemon Sprites</a>
									</div>

								</div>
							</div>
							<div class="row mb-3">
								<div class="col">
									<button type="submit" class="btn btn-primary"
										style="font-size: 20px">Confirm Update</button>

								</div>
							</div>
						</form>
					</div>
					<nav>
						<a href="showPokemon.do?id=${pokemon.id}">Cancel</a> <a
							href="update.do">Back to home</a>
					</nav>
				</c:if>

			</c:otherwise>
		</c:choose>

	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>