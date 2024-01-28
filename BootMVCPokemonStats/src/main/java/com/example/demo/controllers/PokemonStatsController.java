package com.example.demo.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.data.PokemonStatsDAO;
import com.skilldistillery.pokemonstats.entities.Pokemon;

@Controller
public class PokemonStatsController {
	@Autowired
	private PokemonStatsDAO pokeDAO;

// HomePage control paths: find.do, collection.do, add.do, update.do, delete.do
// find.do
	@RequestMapping(path = { "/", "home.do", "" }, method = RequestMethod.GET)
	public String find(Model model) {
		List<Pokemon> pokemonList = pokeDAO.findAllPokemon();
		model.addAttribute("pokemonList", pokemonList);

		// control the state of the accordion
		model.addAttribute("findPokemonBtn", "");
		model.addAttribute("findPokemonShow", "show");

		model.addAttribute("collectionPokemonBtn", "collapsed");
		model.addAttribute("collectionPokemonShow", "");

		model.addAttribute("addPokemonBtn", "collapsed");
		model.addAttribute("addPokemonShow", "");

		model.addAttribute("updatePokemonBtn", "collapsed");
		model.addAttribute("updatePokemonShow", "");

		model.addAttribute("deletePokemonBtn", "collapsed");
		model.addAttribute("deletePokemonShow", "");

		return "home";
	}

// collection.do
	@RequestMapping(path = { "collection.do" }, method = RequestMethod.GET)
	public String collection(Model model) {
		List<Pokemon> pokemonList = pokeDAO.findAllPokemon();
		model.addAttribute("pokemonList", pokemonList);

		// control the state of the accordion
		model.addAttribute("findPokemonBtn", "collapsed");
		model.addAttribute("findPokemonShow", "");

		model.addAttribute("collectionPokemonBtn", "");
		model.addAttribute("collectionPokemonShow", "show");

		model.addAttribute("addPokemonBtn", "collapsed");
		model.addAttribute("addPokemonShow", "");

		model.addAttribute("updatePokemonBtn", "collapsed");
		model.addAttribute("updatePokemonShow", "");

		model.addAttribute("deletePokemonBtn", "collapsed");
		model.addAttribute("deletePokemonShow", "");
		return "home";
	}

// add.do
	@RequestMapping(path = { "add.do" }, method = RequestMethod.GET)
	public String add(Model model) {
		List<Pokemon> pokemonList = pokeDAO.findAllPokemon();
		model.addAttribute("pokemonList", pokemonList);

		// control the state of the accordion
		model.addAttribute("findPokemonBtn", "collapsed");
		model.addAttribute("findPokemonShow", "");

		model.addAttribute("collectionPokemonBtn", "collapsed");
		model.addAttribute("collectionPokemonShow", "");

		model.addAttribute("addPokemonBtn", "");
		model.addAttribute("addPokemonShow", "show");

		model.addAttribute("updatePokemonBtn", "collapsed");
		model.addAttribute("updatePokemonShow", "");

		model.addAttribute("deletePokemonBtn", "collapsed");
		model.addAttribute("deletePokemonShow", "");
		return "home";
	}

// update.do
	@RequestMapping(path = { "update.do" }, method = RequestMethod.GET)
	public String update(Model model) {
		List<Pokemon> pokemonList = pokeDAO.findAllPokemon();
		model.addAttribute("pokemonList", pokemonList);

		// control the state of the accordion
		model.addAttribute("findPokemonBtn", "collapsed");
		model.addAttribute("findPokemonShow", "");

		model.addAttribute("collectionPokemonBtn", "collapsed");
		model.addAttribute("collectionPokemonShow", "");

		model.addAttribute("addPokemonBtn", "collapsed");
		model.addAttribute("addPokemonShow", "");

		model.addAttribute("updatePokemonBtn", "");
		model.addAttribute("updatePokemonShow", "show");

		model.addAttribute("deletePokemonBtn", "collapsed");
		model.addAttribute("deletePokemonShow", "");
		return "home";
	}

//delete.do
	@RequestMapping(path = { "delete.do" }, method = RequestMethod.GET)
	public String delete(Model model) {
		List<Pokemon> pokemonList = pokeDAO.findAllPokemon();
		model.addAttribute("pokemonList", pokemonList);

		// control the state of the accordion
		model.addAttribute("findPokemonBtn", "collapsed");
		model.addAttribute("findPokemonShow", "");

		model.addAttribute("collectionPokemonBtn", "collapsed");
		model.addAttribute("collectionPokemonShow", "");

		model.addAttribute("addPokemonBtn", "collapsed");
		model.addAttribute("addPokemonShow", "");

		model.addAttribute("updatePokemonBtn", "collapsed");
		model.addAttribute("updatePokemonShow", "");

		model.addAttribute("deletePokemonBtn", "");
		model.addAttribute("deletePokemonShow", "show");
		return "home";
	}

// Page logic control path
//showPokemon control path from find and collection
	@RequestMapping(path = { "showPokemon.do" }, method = RequestMethod.GET)
	public String showPokemon(Model model, @RequestParam("id") int id) {
		// BEGIND Finding and adding max attributes
		int maxHitPoint = pokeDAO.getMaxHitpoint();
		int maxAttack = pokeDAO.getMaxAttack();
		int maxDefense = pokeDAO.getMaxDefense();
		int maxSpecialAttack = pokeDAO.getMaxSpecialAttack();
		int maxSpecialDefense = pokeDAO.getMaxSpecialDefense();
		int maxSpeed = pokeDAO.getMaxSpeed();
		model.addAttribute("maxHitPoint", maxHitPoint);
		model.addAttribute("maxAttack", maxAttack);
		model.addAttribute("maxDefense", maxDefense);
		model.addAttribute("maxSpecialAttack", maxSpecialAttack);
		model.addAttribute("maxSpecialDefense", maxSpecialDefense);
		model.addAttribute("maxSpeed", maxSpeed);
		// END finding and adding max attributes

		Pokemon pokemon = pokeDAO.findPokemonById(id);
		model.addAttribute("pokemon", pokemon);
		model.addAttribute("id", id);

		model.addAttribute("showNAV", "showPokemon");
		return "showPokemon";
	}

// deletePokemon control path
// DELETE QUESTION
	@RequestMapping(path = { "deletePokemon.do" }, method = RequestMethod.GET)
	public String deletePokemon(Model model, @RequestParam("id") int id) {
		// BEGIND Finding and adding max attributes
		int maxHitPoint = pokeDAO.getMaxHitpoint();
		int maxAttack = pokeDAO.getMaxAttack();
		int maxDefense = pokeDAO.getMaxDefense();
		int maxSpecialAttack = pokeDAO.getMaxSpecialAttack();
		int maxSpecialDefense = pokeDAO.getMaxSpecialDefense();
		int maxSpeed = pokeDAO.getMaxSpeed();
		model.addAttribute("maxHitPoint", maxHitPoint);
		model.addAttribute("maxAttack", maxAttack);
		model.addAttribute("maxDefense", maxDefense);
		model.addAttribute("maxSpecialAttack", maxSpecialAttack);
		model.addAttribute("maxSpecialDefense", maxSpecialDefense);
		model.addAttribute("maxSpeed", maxSpeed);
		// END finding and adding max attributes

		Pokemon pokemon = pokeDAO.findPokemonById(id);
		model.addAttribute("pokemon", pokemon);
		model.addAttribute("id", id);

		model.addAttribute("showNAV", "deletePokemon");
		return "showPokemon";
	}

// DELETE CONFIRMED
	@RequestMapping(path = { "deletePokemonConfirmed.do" }, method = RequestMethod.GET)
	public String deletePokemonConfirmed(Model model, @RequestParam("id") int id) {
		Pokemon pokemon = pokeDAO.deletePokemonById(id);
		model.addAttribute("pokemon", pokemon);
		return "deleteConfirmation";
	}

// updatePokemon control path
// Update QUESTION AND FORM
	@RequestMapping(path = { "updatePokemon.do" }, method = RequestMethod.GET)
	public String updatePokemon(Model model, @RequestParam("id") int id) {
		Pokemon pokemon = pokeDAO.findPokemonById(id);
		model.addAttribute("pokemon", pokemon);
		model.addAttribute("id", id);
		model.addAttribute("showNAV", "updatePokemon");
		return "showPokemon";
	}

// UPDATE CONFIRMED
	@RequestMapping(path = { "updatePokemonConfirmed.do" }, method = RequestMethod.POST)
	public String updatePokemonConfirmed(Pokemon p, Model model) {
		pokeDAO.updatePokemonById(p.getId(), p);

		// BEGIND Finding and adding max attributes
		int maxHitPoint = pokeDAO.getMaxHitpoint();
		int maxAttack = pokeDAO.getMaxAttack();
		int maxDefense = pokeDAO.getMaxDefense();
		int maxSpecialAttack = pokeDAO.getMaxSpecialAttack();
		int maxSpecialDefense = pokeDAO.getMaxSpecialDefense();
		int maxSpeed = pokeDAO.getMaxSpeed();
		model.addAttribute("maxHitPoint", maxHitPoint);
		model.addAttribute("maxAttack", maxAttack);
		model.addAttribute("maxDefense", maxDefense);
		model.addAttribute("maxSpecialAttack", maxSpecialAttack);
		model.addAttribute("maxSpecialDefense", maxSpecialDefense);
		model.addAttribute("maxSpeed", maxSpeed);
		// END finding and adding max attributes

		Pokemon pokemon = pokeDAO.findPokemonById(p.getId());
		model.addAttribute("pokemon", pokemon);
		model.addAttribute("showNAV", "showPokemon");
		return "showPokemon";
	}
// REDIRECT UPDATE 

}
