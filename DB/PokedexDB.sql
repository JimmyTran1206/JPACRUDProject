-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PokedexDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `PokedexDB` ;

-- -----------------------------------------------------
-- Schema PokedexDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PokedexDB` DEFAULT CHARACTER SET utf8 ;
USE `PokedexDB` ;

-- -----------------------------------------------------
-- Table `pokemon_stats`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pokemon_stats` ;

CREATE TABLE IF NOT EXISTS `pokemon_stats` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `hit_point` INT(10) NOT NULL,
  `attack` INT(10) NULL,
  `defense` INT(10) NULL,
  `special_attack` INT(10) NULL,
  `special_defense` INT(10) NULL,
  `speed` INT(10) NULL,
  `sprite_id` INT(10) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS student@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'student'@'localhost' IDENTIFIED BY 'student';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'student'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `pokemon_stats`
-- -----------------------------------------------------
START TRANSACTION;
USE `PokedexDB`;
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (1, 'Bulbasaur', 45, 49, 49, 65, 65, 45, 1);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (2, 'Ivysaur', 60, 62, 63, 80, 80, 60, 2);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (3, 'Venusaur', 80, 100, 123, 122, 120, 80, 3);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (4, 'Charmander', 39, 52, 43, 60, 50, 65, 4);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (5, 'Charmeleon', 58, 64, 58, 80, 65, 80, 5);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (6, 'Charizard', 78, 130, 111, 130, 85, 100, 6);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (7, 'Squirtle', 44, 48, 65, 50, 64, 43, 7);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (8, 'Wartortle', 59, 63, 80, 65, 80, 58, 8);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (9, 'Blastoise', 79, 103, 120, 135, 115, 78, 9);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (10, 'Caterpie', 45, 30, 35, 20, 20, 45, 10);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (11, 'Metapod', 50, 20, 55, 25, 25, 30, 11);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (12, 'Butterfree', 60, 45, 50, 90, 80, 70, 12);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (13, 'Weedle', 40, 35, 30, 20, 20, 50, 13);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (14, 'Kakuna', 45, 25, 50, 25, 25, 35, 14);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (15, 'Beedrill', 65, 90, 40, 45, 80, 75, 15);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (16, 'Pidgey', 40, 45, 40, 35, 35, 56, 16);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (17, 'Pidgeotto', 63, 60, 55, 50, 50, 71, 17);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (18, 'Pidgeot', 83, 80, 75, 70, 70, 101, 18);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (19, 'Rattata', 30, 56, 35, 25, 35, 72, 19);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (20, 'Raticate', 55, 81, 60, 50, 70, 97, 20);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (21, 'Spearow', 40, 60, 30, 31, 31, 70, 21);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (22, 'Fearow', 65, 90, 65, 61, 61, 10, 22);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (23, 'Ekans', 35, 60, 44, 40, 54, 55, 23);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (24, 'Arbok', 60, 95, 69, 65, 79, 80, 24);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (25, 'Pikachu', 45, 80, 50, 75, 60, 120, 25);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (26, 'Raichu', 60, 90, 55, 90, 80, 110, 26);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (27, 'Sandshrew', 50, 75, 85, 20, 30, 40, 27);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (28, 'Sandslash', 75, 100, 120, 25, 65, 65, 28);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (29, 'Nidoran', 55, 47, 52, 40, 40, 41, 29);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (30, 'Nidorina', 70, 62, 67, 55, 55, 56, 30);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (31, 'Nidoqueen', 90, 92, 87, 75, 85, 76, 31);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (32, 'Nidoran', 46, 57, 40, 40, 40, 50, 32);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (33, 'Nidorino', 61, 72, 57, 55, 55, 65, 33);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (34, 'Nidoking', 81, 102, 77, 85, 75, 85, 34);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (35, 'Clefairy', 70, 45, 48, 60, 65, 35, 35);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (36, 'Clefable', 95, 70, 73, 95, 90, 60, 36);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (37, 'Vulpix', 38, 41, 40, 50, 65, 65, 37);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (38, 'Ninetales', 73, 67, 75, 81, 100, 109, 38);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (39, 'Jigglypuff', 115, 45, 20, 45, 25, 20, 39);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (40, 'Wigglytuff', 140, 70, 45, 85, 50, 45, 40);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (41, 'Zubat', 40, 45, 35, 30, 40, 55, 41);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (42, 'Golbat', 75, 80, 70, 65, 75, 90, 42);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (43, 'Oddish', 45, 50, 55, 75, 65, 30, 43);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (44, 'Gloom', 60, 65, 70, 85, 75, 40, 44);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (45, 'Vileplume', 75, 80, 85, 110, 90, 50, 45);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (46, 'Paras', 35, 70, 55, 45, 55, 25, 46);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (47, 'Parasect', 60, 95, 80, 60, 80, 30, 47);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (48, 'Venonat', 60, 55, 50, 40, 55, 45, 48);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (49, 'Venomoth', 70, 65, 60, 90, 75, 90, 49);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (50, 'Diglett', 10, 55, 25, 35, 45, 95, 50);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (51, 'Dugtrio', 35, 100, 60, 50, 70, 110, 51);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (52, 'Meowth', 50, 65, 55, 40, 40, 40, 52);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (53, 'Persian', 65, 60, 60, 75, 65, 115, 53);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (54, 'Psyduck', 50, 52, 48, 65, 50, 55, 54);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (55, 'Golduck', 80, 82, 78, 95, 80, 85, 55);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (56, 'Mankey', 40, 80, 35, 35, 45, 70, 56);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (57, 'Primeape', 65, 105, 60, 60, 70, 95, 57);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (58, 'Growlithe', 55, 70, 45, 70, 50, 60, 58);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (59, 'Arcanine', 90, 110, 80, 100, 80, 95, 59);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (60, 'Poliwag', 40, 50, 40, 40, 40, 90, 60);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (61, 'Poliwhirl', 65, 65, 65, 50, 50, 90, 61);
INSERT INTO `pokemon_stats` (`id`, `name`, `hit_point`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`, `sprite_id`) VALUES (62, 'Poliwrath', 90, 95, 95, 70, 90, 70, 62);

COMMIT;

