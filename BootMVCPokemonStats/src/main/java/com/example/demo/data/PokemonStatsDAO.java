package com.example.demo.data;

import java.util.List;

import com.skilldistillery.pokemonstats.entities.Pokemon;

public interface PokemonStatsDAO {
	public Pokemon findPokemonById(int id);

	public List<Pokemon> findAllPokemon();
	
	public void updatePokemonById(int id, Pokemon p);
	
	public int addPokemon (Pokemon p);
	
	public Pokemon deletePokemonById(int id);
	
	public Integer getMaxHitpoint();
	public Integer getMaxAttack();
	public Integer getMaxDefense();
	public Integer getMaxSpecialAttack();
	public Integer getMaxSpecialDefense();
	public Integer getMaxSpeed();
	
	
}
