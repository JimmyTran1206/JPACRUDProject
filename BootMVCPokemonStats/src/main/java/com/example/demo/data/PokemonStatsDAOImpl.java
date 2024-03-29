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

	@Override
	public Integer getMaxId() {
		String jpql = "SELECT MAX(pokemon.id) FROM Pokemon pokemon";
		return (Integer) em.createQuery(jpql, Integer.class).getSingleResult();
	}

	@Override
	public Integer getMinId() {
		String jpql = "SELECT MIN(pokemon.id) FROM Pokemon pokemon";
		return (Integer) em.createQuery(jpql, Integer.class).getSingleResult();
	}

	@Override
	public Pokemon deletePokemonById(int id) {

		Pokemon pokemon = em.find(Pokemon.class, id);
		if (pokemon == null) {
			return null;
		}
		em.remove(pokemon); // performs the deletion on the managed entity
		em.flush();
		return pokemon;
	}

	@Override
	public void updatePokemonById(int id, Pokemon p) {
		Pokemon pokemon = em.find(Pokemon.class, id);
		pokemon.setHitpoint(p.getHitpoint());
		pokemon.setAttack(p.getAttack());
		pokemon.setDefense(p.getDefense());
		pokemon.setSpecialAttack(p.getSpecialAttack());
		pokemon.setSpecialDefense(p.getSpecialDefense());
		pokemon.setSpeed(p.getSpeed());
		pokemon.setSpriteId(p.getSpriteId());
	}

	@Override
	public int addPokemon(Pokemon p) {
		em.persist(p);
		em.flush();
		return p.getId();
	}

	@Override
	public Pokemon findNextPokemon(int id) {
		String jpql = "SELECT pokemon FROM Pokemon pokemon WHERE pokemon.id > :id ";
		Pokemon pokemon = em.createQuery(jpql, Pokemon.class).setParameter("id", id).getResultList().get(0);
		if (pokemon == null) {
			return findPokemonById(id);
		} else {
			return pokemon;
		}
	}

	@Override
	public Pokemon findPreviousPokemon(int id) {
		String jpql = "SELECT pokemon FROM Pokemon pokemon WHERE pokemon.id < :id ";
		List<Pokemon> pokemonList = em.createQuery(jpql, Pokemon.class).setParameter("id", id).getResultList();
		Pokemon pokemon = pokemonList.get(pokemonList.size() - 1);
		if (pokemon == null) {
			return findPokemonById(id);
		} else {
			return pokemon;
		}
	}

	@Override
	public Pokemon findStrongestPokemon() {
		String jpql = "SELECT pokemon FROM Pokemon pokemon"
				+ " WHERE pokemon.hitpoint + pokemon.attack + pokemon.defense "
				+ " + pokemon.specialAttack + pokemon.specialDefense+ pokemon.speed "
				+ " = (SELECT MAX(pokemon.hitpoint + pokemon.attack + pokemon.defense "
				+ " + pokemon.specialAttack + pokemon.specialDefense+ pokemon.speed) " + " FROM Pokemon pokemon)";
		try {
			return em.createQuery(jpql, Pokemon.class).getResultList().get(0);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public Pokemon findWeakestPokemon() {
		String jpql = "SELECT pokemon FROM Pokemon pokemon"
				+ " WHERE pokemon.hitpoint + pokemon.attack + pokemon.defense "
				+ " + pokemon.specialAttack + pokemon.specialDefense+ pokemon.speed "
				+ " = (SELECT MIN(pokemon.hitpoint + pokemon.attack + pokemon.defense "
				+ " + pokemon.specialAttack + pokemon.specialDefense+ pokemon.speed) " + " FROM Pokemon pokemon)";
		try {
			return em.createQuery(jpql, Pokemon.class).getResultList().get(0);
		} catch (Exception e) {
			return null;
		}
	}
}
