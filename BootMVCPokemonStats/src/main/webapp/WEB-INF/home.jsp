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
</head>
<body>
	<div class="container">
		<div class="row">
			<h1>Welcome to Your Pokedex Info</h1>
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
							<strong>Enter a pokemon id to find</strong>
							<form action="showPokemon.do" method="GET">
								Pokemon ID: <input type="number" name="id" /> <input
									type="submit" value="Show Pokemon" />
							</form>
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
							<ul>
								<c:forEach var="pokemon" items="${pokemonList}">

									<li><img
										src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemon.id}.png"
										width="50px"><a
										href="showPokemon.do?id=${pokemon.spriteId}">${pokemon.name}</a></li>
								</c:forEach>
							</ul>
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
							<strong>Enter the pokemon details</strong>
							<div class="container form-container">
								<form action="addPokemon.do" method="GET">
									
									<div class="row mb-3">
										<div class="col">
											<label for="name" class="form-label">Pokemon name</label> <input
												type="text" class="form-control" id="name" name="name"
												>
										</div>

										<div class="col-2"></div>

										<div class="col">
											<label for="hitpoint" class="form-label">Hit Points</label> <input
												type="number" class="form-control" id="hitpoint"
												name="hitpoint" >
										</div>
									</div>
									<div class="row mb-3">
										<div class="col">
											<label for="attack" class="form-label">Attack</label> <input
												type="number" class="form-control" id="attack" name="attack"
												>
										</div>

										<div class="col-2"></div>

										<div class="col">
											<label for="specialAttack" class="form-label">Special
												Attack</label> <input type="number" class="form-control"
												id="specialAttack" name="specialAttack"
												>
										</div>
									</div>

									<div class="row mb-3">
										<div class="col">
											<label for="defense" class="form-label">Defense</label> <input
												type="number" class="form-control" id="defense"
												name="defense" >
										</div>

										<div class="col-2"></div>

										<div class="col">
											<label for="specialDefense" class="form-label">Special
												Attack</label> <input type="number" class="form-control"
												id="specialDefense" name="specialDefense"
												>
										</div>
									</div>

									<div class="row mb-3">
										<div class="col">
											<label for="speed" class="form-label">Speed</label> <input
												type="number" class="form-control" id="speed" name="speed"
												>
										</div>

										<div class="col-2"></div>

										<div class="col">
											<label for="spriteId" class="form-label">Sprite Id</label> <input
												type="number" class="form-control" id="spriteId" min="1" max="1017"
												name="spriteId" >
										</div>
									</div>
									<div class="row mb-3">
										<div class="col">
											<button type="submit" class="btn btn-primary"
												style="font-size: 20px">Add Pokemon to collection</button>

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
							<strong>Enter a pokemon id to update</strong>
							<form action="updatePokemon.do" method="GET">
								Pokemon ID: <input type="number" name="id" /> <input
									type="submit" value="Update Pokemon" />
							</form>
						</div>
					</div>
				</div>
				<!-- Accordion END Update all Pokemon by ID -->

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
							<strong>Enter a pokemon id for deletion</strong>
							<form action="deletePokemon.do" method="GET">
								Pokemon ID: <input type="number" name="id" /> <input
									type="submit" value="Delete Pokemon" />
							</form>

						</div>
					</div>
				</div>
				<!-- Accordion END Create all Pokemon by ID -->


			</div>

		</div>

	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>