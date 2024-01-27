package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@EntityScan("com.skilldistillery.pokemonstats")
@SpringBootApplication
public class BootMvcPokemonStatsApplication {

	public static void main(String[] args) {
		SpringApplication.run(BootMvcPokemonStatsApplication.class, args);
	}

}
