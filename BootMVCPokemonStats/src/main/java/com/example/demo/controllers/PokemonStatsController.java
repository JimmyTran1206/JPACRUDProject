package com.example.demo.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.data.PokemonStatsDAO;
import com.skilldistillery.pokemonstats.entities.Pokemon;

@Controller
public class PokemonStatsController {
	@Autowired
	private PokemonStatsDAO pokeDAO;

// HomePage control paths: find.do, collection.do, add.do, update.do, delete.do
// find.do home.do
	@RequestMapping(path = { "/", "home.do", "" }, method = RequestMethod.GET)
	public String find(Model model) {
		List<Pokemon> pokemonList = pokeDAO.findAllPokemon();
		model.addAttribute("pokemonList", pokemonList);
		Pokemon strongestPokemon = pokeDAO.findStrongestPokemon();
		Pokemon weakestPokemon = pokeDAO.findWeakestPokemon();
		model.addAttribute("strongestPokemon", strongestPokemon);
		model.addAttribute("weakestPokemon", weakestPokemon);
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
		Pokemon strongestPokemon = pokeDAO.findStrongestPokemon();
		Pokemon weakestPokemon = pokeDAO.findWeakestPokemon();
		model.addAttribute("strongestPokemon", strongestPokemon);
		model.addAttribute("weakestPokemon", weakestPokemon);
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
	public String add(Model model, @RequestParam("spriteIdHomeAdd") int spriteId) {
		List<Pokemon> pokemonList = pokeDAO.findAllPokemon();
		model.addAttribute("pokemonList", pokemonList);
		Pokemon strongestPokemon = pokeDAO.findStrongestPokemon();
		Pokemon weakestPokemon = pokeDAO.findWeakestPokemon();
		model.addAttribute("strongestPokemon", strongestPokemon);
		model.addAttribute("weakestPokemon", weakestPokemon);

		model.addAttribute("spriteIdHomeAdd", spriteId);
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
		Pokemon strongestPokemon = pokeDAO.findStrongestPokemon();
		Pokemon weakestPokemon = pokeDAO.findWeakestPokemon();
		model.addAttribute("strongestPokemon", strongestPokemon);
		model.addAttribute("weakestPokemon", weakestPokemon);

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
		Pokemon strongestPokemon = pokeDAO.findStrongestPokemon();
		Pokemon weakestPokemon = pokeDAO.findWeakestPokemon();
		model.addAttribute("strongestPokemon", strongestPokemon);
		model.addAttribute("weakestPokemon", weakestPokemon);

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
		try {
			// BEGIND Finding and adding max attributes
			int maxHitPoint = pokeDAO.getMaxHitpoint();
			int maxAttack = pokeDAO.getMaxAttack();
			int maxDefense = pokeDAO.getMaxDefense();
			int maxSpecialAttack = pokeDAO.getMaxSpecialAttack();
			int maxSpecialDefense = pokeDAO.getMaxSpecialDefense();
			int maxSpeed = pokeDAO.getMaxSpeed();
			int maxId = pokeDAO.getMaxId();
			int minId = pokeDAO.getMinId();
			model.addAttribute("maxId", maxId);
			model.addAttribute("minId", minId);
			model.addAttribute("maxHitPoint", maxHitPoint);
			model.addAttribute("maxAttack", maxAttack);
			model.addAttribute("maxDefense", maxDefense);
			model.addAttribute("maxSpecialAttack", maxSpecialAttack);
			model.addAttribute("maxSpecialDefense", maxSpecialDefense);
			model.addAttribute("maxSpeed", maxSpeed);
			// END finding and adding max attributes
		} catch (Exception e) {

		}

		Pokemon pokemon = pokeDAO.findPokemonById(id);
		if (pokemon != null) {
			model.addAttribute("spriteId", pokemon.getSpriteId());
		} else {
			model.addAttribute("spriteId", 0);
		}
		model.addAttribute("pokemon", pokemon);
		model.addAttribute("id", id);

		model.addAttribute("showNAV", "showPokemon");
		return "showPokemon";
	}

// deletePokemon control path
// DELETE QUESTION
	@RequestMapping(path = { "deletePokemon.do" }, method = RequestMethod.GET)
	public String deletePokemon(Model model, @RequestParam("id") int id) {
		try {
			// BEGIND Finding and adding max attributes
			int maxHitPoint = pokeDAO.getMaxHitpoint();
			int maxAttack = pokeDAO.getMaxAttack();
			int maxDefense = pokeDAO.getMaxDefense();
			int maxSpecialAttack = pokeDAO.getMaxSpecialAttack();
			int maxSpecialDefense = pokeDAO.getMaxSpecialDefense();
			int maxSpeed = pokeDAO.getMaxSpeed();
			int maxId = pokeDAO.getMaxId();
			int minId = pokeDAO.getMinId();
			model.addAttribute("maxId", maxId);
			model.addAttribute("minId", minId);
			model.addAttribute("maxHitPoint", maxHitPoint);
			model.addAttribute("maxAttack", maxAttack);
			model.addAttribute("maxDefense", maxDefense);
			model.addAttribute("maxSpecialAttack", maxSpecialAttack);
			model.addAttribute("maxSpecialDefense", maxSpecialDefense);
			model.addAttribute("maxSpeed", maxSpeed);
			// END finding and adding max attributes
		} catch (Exception e) {

		}

		Pokemon pokemon = pokeDAO.findPokemonById(id);
		if (pokemon != null) {
			model.addAttribute("spriteId", pokemon.getSpriteId());
		} else {
			model.addAttribute("spriteId", 0);
		}
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
	public String updatePokemon(Model model, @RequestParam("id") int id,
			@RequestParam("spriteIdFromList") int spriteIdFromList) {
		Pokemon pokemon = pokeDAO.findPokemonById(id);
		model.addAttribute("pokemon", pokemon);
		if (spriteIdFromList == 0 && pokemon != null) {
			model.addAttribute("spriteId", pokemon.getSpriteId());
		} else {
			model.addAttribute("spriteId", spriteIdFromList);
		}
		model.addAttribute("id", id);
		model.addAttribute("showNAV", "updatePokemon");
		return "showPokemon";
	}

// UPDATE CONFIRMED- REDIRECT
	@RequestMapping(path = { "updatePokemonConfirmed.do" }, method = RequestMethod.POST)
	public ModelAndView updatePokemonConfirmed(Pokemon p) {
		pokeDAO.updatePokemonById(p.getId(), p);
		ModelAndView mv = new ModelAndView();
		String redirStr = String.format("redirect:showPokemon.do?id=%d", p.getId());
		mv.setViewName(redirStr);
		return mv;
	}

// addPokemon control path
	@RequestMapping(path = { "addPokemon.do" }, method = RequestMethod.GET)
	public String addPokemon(Pokemon p, Model model) {
		int id = pokeDAO.addPokemon(p);
		Pokemon pokemon = pokeDAO.findPokemonById(id);

		try {
			// BEGIND Finding and adding max attributes
			int maxHitPoint = pokeDAO.getMaxHitpoint();
			int maxAttack = pokeDAO.getMaxAttack();
			int maxDefense = pokeDAO.getMaxDefense();
			int maxSpecialAttack = pokeDAO.getMaxSpecialAttack();
			int maxSpecialDefense = pokeDAO.getMaxSpecialDefense();
			int maxSpeed = pokeDAO.getMaxSpeed();
			int maxId = pokeDAO.getMaxId();
			int minId = pokeDAO.getMinId();
			model.addAttribute("maxId", maxId);
			model.addAttribute("minId", minId);
			model.addAttribute("maxHitPoint", maxHitPoint);
			model.addAttribute("maxAttack", maxAttack);
			model.addAttribute("maxDefense", maxDefense);
			model.addAttribute("maxSpecialAttack", maxSpecialAttack);
			model.addAttribute("maxSpecialDefense", maxSpecialDefense);
			model.addAttribute("maxSpeed", maxSpeed);
			// END finding and adding max attributes
		} catch (Exception e) {

		}

		model.addAttribute("spriteId", pokemon.getSpriteId());
		model.addAttribute("pokemon", pokemon);
		model.addAttribute("showNAV", "showPokemon");
		return "showPokemon";
	}

	// show Sprite Home Add
	@RequestMapping(path = { "showSpriteHomeAdd.do" }, method = RequestMethod.GET)
	public String showSpriteHomeAdd() {
		return "spriteListHomeAdd";
	}

	// show Sprite ShowPokemon Update
	@RequestMapping(path = { "showSpriteShowPokeUpdate.do" }, method = RequestMethod.GET)
	public String showSpriteShowPokeUpdate(Model model, @RequestParam("pokemonId") int pokemonId) {
		model.addAttribute("pokemonId", pokemonId);
		return "spriteListShowPokeUpdate";
	}

	// show next Pokemon
	@RequestMapping(path = { "showNextPokemon.do" }, method = RequestMethod.GET)
	public String showNextPokemon(Model model, @RequestParam("id") int id) {
		try {
			// BEGIND Finding and adding max attributes
			int maxHitPoint = pokeDAO.getMaxHitpoint();
			int maxAttack = pokeDAO.getMaxAttack();
			int maxDefense = pokeDAO.getMaxDefense();
			int maxSpecialAttack = pokeDAO.getMaxSpecialAttack();
			int maxSpecialDefense = pokeDAO.getMaxSpecialDefense();
			int maxSpeed = pokeDAO.getMaxSpeed();
			int maxId = pokeDAO.getMaxId();
			int minId = pokeDAO.getMinId();
			model.addAttribute("maxId", maxId);
			model.addAttribute("minId", minId);
			model.addAttribute("maxHitPoint", maxHitPoint);
			model.addAttribute("maxAttack", maxAttack);
			model.addAttribute("maxDefense", maxDefense);
			model.addAttribute("maxSpecialAttack", maxSpecialAttack);
			model.addAttribute("maxSpecialDefense", maxSpecialDefense);
			model.addAttribute("maxSpeed", maxSpeed);
			// END finding and adding max attributes
		} catch (Exception e) {

		}

		Pokemon pokemon = pokeDAO.findNextPokemon(id);
		model.addAttribute("spriteId", pokemon.getSpriteId());
		model.addAttribute("pokemon", pokemon);
		model.addAttribute("showNAV", "showPokemon");
		return "showPokemon";
	}

	// show previous Pokemon
	@RequestMapping(path = { "showPreviousPokemon.do" }, method = RequestMethod.GET)
	public String showPreviousPokemon(Model model, @RequestParam("id") int id) {
		try {
			// BEGIND Finding and adding max attributes
			int maxHitPoint = pokeDAO.getMaxHitpoint();
			int maxAttack = pokeDAO.getMaxAttack();
			int maxDefense = pokeDAO.getMaxDefense();
			int maxSpecialAttack = pokeDAO.getMaxSpecialAttack();
			int maxSpecialDefense = pokeDAO.getMaxSpecialDefense();
			int maxSpeed = pokeDAO.getMaxSpeed();
			int maxId = pokeDAO.getMaxId();
			int minId = pokeDAO.getMinId();
			model.addAttribute("maxId", maxId);
			model.addAttribute("minId", minId);
			model.addAttribute("maxHitPoint", maxHitPoint);
			model.addAttribute("maxAttack", maxAttack);
			model.addAttribute("maxDefense", maxDefense);
			model.addAttribute("maxSpecialAttack", maxSpecialAttack);
			model.addAttribute("maxSpecialDefense", maxSpecialDefense);
			model.addAttribute("maxSpeed", maxSpeed);
			// END finding and adding max attributes
		} catch (Exception e) {

		}

		Pokemon pokemon = pokeDAO.findPreviousPokemon(id);
		model.addAttribute("spriteId", pokemon.getSpriteId());
		model.addAttribute("pokemon", pokemon);
		model.addAttribute("showNAV", "showPokemon");
		return "showPokemon";
	}
}
