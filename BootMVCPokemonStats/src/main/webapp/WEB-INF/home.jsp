<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HomePage</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link href="https://fonts.cdnfonts.com/css/pokemon-solid"
	rel="stylesheet">

<style>
.container-main {
	max-width: 1200px;
	margin: 54px auto;
}

.container-main>.row {
	margin: 20px;
}
/*Accordion styling */
.accordion-button {
	display: inline-block;
	font-size: 20px;
	text-decoration: none;
	background: linear-gradient(to right, #227ed4, #be2a56);
	border-radius: 20px;
	border: 1px solid #408fde;
	color: #ebb434;
	font-family: 'Pokemon Solid', sans-serif;
}

.accordion-button:hover{
background: linear-gradient(to right, #be2a56, #227ed4);
	cursor: pointer;
}

.accordion-item {
	margin: 15px;
	border-radius: 20px;
	padding: 0px;
	background: rgb(63,94,251);
background: radial-gradient(circle, rgba(63,94,251,1) 0%, rgba(252,70,107,1) 100%);
}

.accordion-header {
	border-radius: 20px;
	padding: 0px;
}

.accordion-body{
border-radius: 20px;
}


/*Accordion styling  */
div.form-container {
	width: 60%;
}

h1, h2 {
	color: #bf2517;
	text-align: center;
}

form {
	font-family: 'Pokemon Solid', sans-serif;
	font-size: 20px;
}

div.row {
	font-size: 20px;
}

#background-video {
	width: 100vw;
	height: 100vh;
	object-fit: fill;
	position: fixed;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	z-index: -1;
	opacity: 0.8;
}

ul {
	list-style-type: none;
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	flex-wrap: wrap;
}

li {
	margin: 2px;
	padding: 5px;
	border-radius: 5px;
	background: linear-gradient(to right, #3b9928, #26bd08);
	box-shadow: 1px 2px 4px rgba(0, 0, 0, 0.3);
}

li:hover {
	cursor: pointer;
	background: linear-gradient(to right, #290202, #6e0606);
	position: relative;
	top: -2px;
	left: -2px;
	position: relative;
	position: relative
}

a {
	text-decoration: none;
}

a:hover {
	color: #c0a50c;
}

a#catch-pokemon, form button {
	display: inline-block;
	font-size: 20px;
	text-decoration: none;
	background: linear-gradient(to right, #227ed4, #be2a56);
	padding: 10px;
	color: #ebb434;
	border-radius: 6px;
	box-shadow: 2px 4px 8px rgba(0, 0, 0, 0.3);
}

a#catch-pokemon:hover, form button:hover {
	background: linear-gradient(to right, #be2a56, #227ed4);
	cursor: pointer;
	position: relative;
	top: -3px;
	left: -3px;
	border: 0.5px solid blue;
}

a#catch-pokemon:click, form button:click {
	position: static;
}
</style>
</head>
<body>
	<!-- The video -->
	<video autoplay muted loop id="background-video">
		<source src="homeBackgroundVideo.mp4" type="video/mp4">
	</video>
	<!-- The video -->
	<div class="container container-main">
		<div class="row">
			<h1>Greeting trainer, welcome to your <span style="font-family: 'Pokemon Solid', sans-serif;"
			>Pokedex</span> Info</h1>
		</div>
		<div class="row">
			<div class="accordion" id="accordionPokemon">

				<!-- Accordion BEGIN FIND Pokemon by ID -->
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingOne">
						<button class="accordion-button ${findPokemonBtn} " type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseOne"
							aria-expanded="true" aria-controls="collapseOne">Find a
							Pokemon</button>
					</h2>
					<div id="collapseOne"
						class="accordion-collapse collapse ${findPokemonShow}"
						aria-labelledby="headingOne" data-bs-parent="#accordionPokemon">
						<div class="accordion-body">
							<div class="container form-container">
								<form action="showPokemon.do" method="GET">
									<div class="row" style="text-align: center;">
										<div class="col">
											<label for="findPokemonById" class="form-label">Pokemon
												ID:</label>
										</div>
										<div class="col ">
											<input type="number" class="form-control" name="id"
												id="findPokemonById" required>
										</div>
										<div class="col ">
											<button type="submit" class="btn btn-primary"
												style="color: #ebb434;">Show Pokemon</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- Accordion END FIND Pokemon by ID -->

				<!-- Accordion BEGIN Show all Pokemon by ID -->
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingTwo">
						<button class="accordion-button ${collectionPokemonBtn}"
							type="button" data-bs-toggle="collapse"
							data-bs-target="#collapseTwo" aria-expanded="false"
							aria-controls="collapseTwo">My Pokemon collection</button>
					</h2>
					<div id="collapseTwo"
						class="accordion-collapse collapse ${collectionPokemonShow}"
						aria-labelledby="headingTwo" data-bs-parent="#accordionPokemon">
						<div class="accordion-body">

							<c:choose>
								<c:when test="${empty strongestPokemon|| empty weakestPokemon}">
									<h2>
										There is no pokemon in your collection. Let's <a
											id="catch-pokemon" style="font-family: 'Pokemon Solid', sans-serif;" href="add.do?spriteIdHomeAdd=1">catch-a
											pokemon</a>
									</h2>
								</c:when>
								<c:otherwise>
									<ul>
										<li id="strongest-pokemon"><img src="questionMark.jpg"
											width="50px"><a
											href="showPokemon.do?id=${strongestPokemon.id}">Strongest
												Pokemon</a></li>
										<li id="weakest-pokemon"><img src="questionMark.jpg"
											width="50px"><a
											href="showPokemon.do?id=${weakestPokemon.id}">Weakest
												Pokemon</a></li>
										<c:forEach var="pokemon" items="${pokemonList}">
											<li><img
												src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemon.spriteId}.png"
												width="50px"><a href="showPokemon.do?id=${pokemon.id}">${pokemon.name}</a></li>
										</c:forEach>
									</ul>
								</c:otherwise>
							</c:choose>

						</div>
					</div>
				</div>
				<!-- Accordion END Show all Pokemon by ID -->

				<!-- Accordion BEGIN Add a Pokemon by ID -->
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingThree">
						<button class="accordion-button ${addPokemonBtn}" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree">Add
							a pokemon to your collection</button>
					</h2>
					<div id="collapseThree"
						class="accordion-collapse collapse ${addPokemonShow}"
						aria-labelledby="headingThree" data-bs-parent="#accordionPokemon">
						<div class="accordion-body">
							<div class="container form-container">
								<form action="addPokemon.do" method="GET">

									<div class="row mb-3">

										<div class="col">
											<label for="spriteId" class="form-label">Sprite Id*</label> <input
												type="number" class="form-control" id="spriteId" min="1"
												max="1017" name="spriteId" required
												value="${spriteIdHomeAdd}">
											<div id="spriteIdHelp" class="form-text"
												style="font-size: 14px;">
												<a href="showSpriteHomeAdd.do" style="font-family: Aria, san-serifs; font-weight:600; color: yellow;">🌪️🦄Lets catch a
													pokemon🌊🐟</a>
											</div>
										</div>

										<div class="col-2"></div>

										<div class="col">
											<label for="hitpoint" class="form-label">Hit Points</label> <input
												type="number" class="form-control" id="hitpoint" min="0"
												name="hitpoint" required>
										</div>
									</div>
									<div class="row mb-3">
										<div class="col">
											<label for="attack" class="form-label">Attack</label> <input
												type="number" class="form-control" id="attack" min="0"
												name="attack" required>
										</div>

										<div class="col-2"></div>

										<div class="col">
											<label for="specialAttack" class="form-label">Special
												Attack</label> <input type="number" class="form-control"
												id="specialAttack" min="0" name="specialAttack" required>
										</div>
									</div>

									<div class="row mb-3">
										<div class="col">
											<label for="defense" class="form-label">Defense</label> <input
												type="number" class="form-control" id="defense" min="0"
												name="defense" required>
										</div>

										<div class="col-2"></div>

										<div class="col">
											<label for="specialDefense" class="form-label">Special
												Defense</label> <input type="number" class="form-control"
												id="specialDefense" min="0" name="specialDefense" required>
										</div>
									</div>

									<div class="row mb-3">
										<div class="col">
											<label for="speed" class="form-label">Speed</label> <input
												type="number" class="form-control" id="speed" min="0"
												name="speed" required>
										</div>

										<div class="col-2"></div>

										<div class="col">
											<label for="name" class="form-label">Pokemon name*</label> <input
												type="text" class="form-control" id="name" name="name"
												required>
										</div>

									</div>
									<div class="row m-3" style="text-align: center;">
										<div class="col">
											<button type="submit" class="btn btn-primary"
												style="font-size: 20px; color: #ebb434; padding: 10px;">Add
												Pokemon to collection</button>

										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- Accordion END Add a Pokemon by ID -->

				<!-- Accordion BEGIN Update a Pokemon by ID -->
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingFour">
						<button class="accordion-button ${updatePokemonBtn}" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseFour"
							aria-expanded="false" aria-controls="collapseFour">
							Update a pokemon in your collection</button>
					</h2>
					<div id="collapseFour"
						class="accordion-collapse collapse ${updatePokemonShow}"
						aria-labelledby="headingFour" data-bs-parent="#accordionPokemon">
						<div class="accordion-body">
							<div class="container form-container">
								<form action="updatePokemon.do" method="GET">
									<div class="row" style="text-align: center;">
										<div class="col">
											<label for="updatePokemonById" class="form-label">Pokemon
												ID:</label>
										</div>
										<div class="col ">
											<input type="number" class="form-control" name="id"
												id="updatePokemonById" required> <input
												type="number" class="form-control" name="spriteIdFromList"
												value="0" style="display: none;" />
										</div>
										<div class="col ">
											<button type="submit" class="btn btn-primary"
												style="color: #ebb434;">Update Pokemon</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- Accordion END Update a Pokemon by ID -->

				<!-- Accordion BEGIN Delete a Pokemon by ID -->
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingFive">
						<button class="accordion-button ${deletePokemonBtn}" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseFive"
							aria-expanded="false" aria-controls="collapseFive">
							Delete a pokemon from your collection</button>
					</h2>
					<div id="collapseFive"
						class="accordion-collapse collapse ${deletePokemonShow}"
						aria-labelledby="headingFive" data-bs-parent="#accordionPokemon">
						<div class="accordion-body">
							<div class="container form-container">
								<form action="deletePokemon.do" method="GET">
									<div class="row" style="text-align: center;">
										<div class="col">
											<label for="deletePokemonById" class="form-label">Pokemon
												ID:</label>
										</div>
										<div class="col ">
											<input type="number" class="form-control" name="id"
												id="deletePokemonById" required>
										</div>
										<div class="col ">
											<button type="submit" class="btn btn-primary"
												style="color: #ebb434;">Delete Pokemon</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- Accordion END Delete a Pokemon by ID -->


			</div>

		</div>

	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>