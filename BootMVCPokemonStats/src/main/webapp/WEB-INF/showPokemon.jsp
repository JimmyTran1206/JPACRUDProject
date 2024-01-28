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
body>div.container {
	font-family: 'Pokemon Solid', sans-serif;
	max-width: 1000px;
	margin: 36px auto;
}

div.form-container, input {
	text-align: center;
	width: 60%;
}

label {
	font-size: 20px;
}

body {
	background: linear-gradient(to right, #081a2b, #053563);
}

h1 {
	color: #dfe80b;
}

p, form {
	color: #96940d;
}

.hit-point, .attack, .defense, .special-attack, .special-defense, .speed
	{
	color: magenta;
}

nav {
	display: flex;
	justify-content:space-between;
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
				<!-- BEGIN Pokemon Info Container -->
				<div class="container pokemon-info">
					<div class="row" style="text-align: center;">
						<div class="col">
							<h1>${pokemon.name}#${pokemon.id}</h1>
						</div>
					</div>
					<div class="row pokemon-sprite" style="text-align: center;">
						<div class="col">
							<img
								src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${spriteId}.png">
						</div>
					</div>
					<c:if test="${showNAV!='updatePokemon'}">

						<!-- Intentionally empty block -->
						<div class="row">
							<div class="col"></div>
							<div class="col"></div>
						</div>
						<!-- Intentionally empty block -->

						<div class="row hit-point">
							<div class="col-3" style="font-size: 20px;">❤️ Hit Points</div>

							<div class="col">
								<div class="progress" role="progressbar"
									style="height: 24px; font-size: 18px;">
									<div
										class="progress-bar progress-bar-striped progress-bar-animated bg-danger"
										style="width: ${pokemon.hitpoint/maxHitPoint*100}%">${pokemon.hitpoint}</div>
								</div>
							</div>
						</div>

						<div class="row attack">
							<div class="col-3" style="font-size: 20px;">⚔️ Attack</div>

							<div class="col">
								<div class="progress" role="progressbar"
									style="height: 24px; font-size: 18px;">
									<div
										class="progress-bar progress-bar-striped progress-bar-animated bg-success"
										style="width: ${pokemon.attack/maxAttack*100}%">${pokemon.attack}</div>
								</div>
							</div>
						</div>

						<div class="row defense">
							<div class="col-3" style="font-size: 20px;">🛡️ Defense</div>

							<div class="col">
								<div class="progress" role="progressbar"
									style="height: 24px; font-size: 18px;">
									<div
										class="progress-bar progress-bar-striped progress-bar-animated bg-info"
										style="width: ${pokemon.defense/maxDefense*100}%">${pokemon.defense}</div>
								</div>
							</div>
						</div>

						<div class="row special-attack">
							<div class="col-3" style="font-size: 20px;">💥️ Special
								Attack</div>

							<div class="col">
								<div class="progress" role="progressbar"
									style="height: 24px; font-size: 18px;">
									<div
										class="progress-bar progress-bar-striped progress-bar-animated bg-success"
										style="width: ${pokemon.specialAttack/maxSpecialAttack*100}%">${pokemon.specialAttack}</div>
								</div>
							</div>
						</div>

						<div class="row special-defense">
							<div class="col-3" style="font-size: 20px;">⚜️ Special
								Defense</div>

							<div class="col">
								<div class="progress" role="progressbar"
									style="height: 24px; font-size: 18px;">
									<div
										class="progress-bar progress-bar-striped progress-bar-animated bg-info"
										style="width: ${pokemon.specialDefense/maxSpecialDefense*100}%">${pokemon.specialDefense}</div>
								</div>
							</div>
						</div>

						<div class="row speed">
							<div class="col-3" style="font-size: 20px;">🥾 Speed</div>

							<div class="col">
								<div class="progress" role="progressbar"
									style="height: 24px; font-size: 18px;">
									<div
										class="progress-bar progress-bar-striped progress-bar-animated bg-warning"
										style="width: ${pokemon.speed/maxSpeed*100}%">${pokemon.speed}</div>
								</div>
							</div>
						</div>

					</c:if>

					<c:if test="${showNAV=='showPokemon'}">
						<div class="row">
							<div class="col">
								<nav>
									<a href="home.do">Back to Find</a> <a href="collection.do">Back
										to Collection</a> <a
										href="updatePokemon.do?id=${pokemon.id}&spriteIdFromList=${pokemon.spriteId}">Update
										this Pokemon</a> <a href="deletePokemon.do?id=${pokemon.id}">Delete
										this Pokemon</a>
								</nav>
							</div>
						</div>
					</c:if>

					<c:if test="${showNAV=='deletePokemon'}">
						<div class="row">
							<div class="col">
								<nav>
									<a href="deletePokemonConfirmed.do?id=${pokemon.id}">Confirm
										Deletion</a> <a href="showPokemon.do?id=${pokemon.id}">Cancel</a>
									<a href="delete.do">Back to home</a>
								</nav>
							</div>
						</div>
					</c:if>
				</div>
				<!-- END Pokemon Info Container -->

				<c:if test="${showNAV=='updatePokemon'}">

					<!--BEGIN UpdatePokemon Form Container  -->
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
									<label for="name" class="form-label">Pokemon name*</label> <input
										type="text" class="form-control" id="name" name="name"
										value="${pokemon.name}" required>
								</div>

								<div class="col-2"></div>

								<div class="col">
									<label for="hitpoint" class="form-label">Hit Points</label> <input
										type="number" class="form-control" id="hitpoint" min="0"
										name="hitpoint" value="${pokemon.hitpoint}">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col">
									<label for="attack" class="form-label">Attack</label> <input
										type="number" class="form-control" id="attack" min="0"
										name="attack" value="${pokemon.attack}">
								</div>

								<div class="col-2"></div>

								<div class="col">
									<label for="specialAttack" class="form-label">Special
										Attack</label> <input type="number" class="form-control"
										id="specialAttack" min="0" name="specialAttack"
										value="${pokemon.specialAttack}">
								</div>
							</div>

							<div class="row mb-3">
								<div class="col">
									<label for="defense" class="form-label">Defense</label> <input
										type="number" class="form-control" id="defense" min="0"
										name="defense" value="${pokemon.defense}">
								</div>

								<div class="col-2"></div>

								<div class="col">
									<label for="specialDefense" class="form-label">Special
										Attack</label> <input type="number" class="form-control"
										id="specialDefense" min="0" name="specialDefense"
										value="${pokemon.specialDefense}">
								</div>
							</div>

							<div class="row mb-3">
								<div class="col">
									<label for="speed" class="form-label">Speed</label> <input
										type="number" class="form-control" id="speed" min="0"
										name="speed" value="${pokemon.speed}">
								</div>

								<div class="col-2"></div>

								<div class="col">
									<label for="spriteId" class="form-label">Sprite Id*</label> <input
										type="number" class="form-control" id="spriteId" min="1"
										max="1017" name="spriteId" value="${spriteId}" required>
									<div id="spriteIdHelp" class="form-text"
										style="font-size: 12px;">
										<a href="showSpriteShowPokeUpdate.do?pokemonId=${pokemon.id}">Available
											Pokemon Sprites</a>
									</div>

								</div>
							</div>
							
							<div class="row mb-3">
								<div class="col">
									<button type="submit" class="btn btn-primary"
										style="font-size: 20px; color:#c0a50c; padding:10px; ">Confirm Update</button>
								</div>
							</div>
						</form>

						<div class="row">
							<div class="col">
								<nav>
									<a href="showPokemon.do?id=${pokemon.id}">Cancel</a> <a
										href="update.do">Back to home</a>
								</nav>
							</div>
						</div>

					</div>
					<!--END UpdatePokemon Form Container  -->

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