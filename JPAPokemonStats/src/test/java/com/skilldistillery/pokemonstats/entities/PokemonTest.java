package com.skilldistillery.pokemonstats.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class PokemonTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Pokemon pokemon;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("PokemonStats");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		pokemon = em.find(Pokemon.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		pokemon = null;
		em.close();
	}

	@Test
	void test_Pokemon_entity_mapping() {
		
		assertNotNull(pokemon);
		assertEquals("Bulbasaur", pokemon.getName());
	}

}
