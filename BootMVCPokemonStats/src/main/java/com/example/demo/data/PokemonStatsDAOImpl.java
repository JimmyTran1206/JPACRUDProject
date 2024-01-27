package com.example.demo.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.pokemonstats.entities.Pokemon;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class PokemonStatsDAOImpl implements PokemonStatsDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public Pokemon findPokemonById(int id) {
		return em.find(Pokemon.class, id);
	}

	@Override
	public List<Pokemon> findAllPokemon() {
		String jpql = "SELECT pokemon FROM Pokemon pokemon";
		return em.createQuery(jpql, Pokemon.class).getResultList();
	}

	@Override
	public Integer getMaxHitpoint() {
		String jpql = "SELECT MAX(pokemon.hitpoint) FROM Pokemon pokemon";
		return (Integer) em.createQuery(jpql, Integer.class).getSingleResult();
	}

	@Override
	public Integer getMaxAttack() {
		String jpql = "SELECT MAX(pokemon.attack) FROM Pokemon pokemon";
		return (Integer) em.createQuery(jpql, Integer.class).getSingleResult();
	}

	@Override
	public Integer getMaxDefense() {
		String jpql = "SELECT MAX(pokemon.defense) FROM Pokemon pokemon";
		return (Integer) em.createQuery(jpql, Integer.class).getSingleResult();
	}

	@Override
	public Integer getMaxSpecialAttack() {
		String jpql = "SELECT MAX(pokemon.specialAttack) FROM Pokemon pokemon";
		return (Integer) em.createQuery(jpql, Integer.class).getSingleResult();
	}

	@Override
	public Integer getMaxSpecialDefense() {
		String jpql = "SELECT MAX(pokemon.specialDefense) FROM Pokemon pokemon";
		return (Integer) em.createQuery(jpql, Integer.class).getSingleResult();
	}

	@Override
	public Integer getMaxSpeed() {
		String jpql = "SELECT MAX(pokemon.speed) FROM Pokemon pokemon";
		return (Integer) em.createQuery(jpql, Integer.class).getSingleResult();
	}

	

}
