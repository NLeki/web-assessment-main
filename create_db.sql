
CREATE SCHEMA IF NOT EXISTS `book_review_db` 
USE `book_review_db` ;

-- -----------------------------------------------------
-- Table `book_review_db`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book_review_db`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))

-- -----------------------------------------------------
-- Table `book_review_db`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book_review_db`.`books` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `author` VARCHAR(255) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `category_id` INT NULL DEFAULT NULL,
  `cover_image` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
    FOREIGN KEY (`category_id`)
    REFERENCES `book_review_db`.`categories` (`id`))


-- -----------------------------------------------------
-- Table `book_review_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book_review_db`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),


-- -----------------------------------------------------
-- Table `book_review_db`.`reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book_review_db`.`reviews` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `book_id` INT NULL DEFAULT NULL,
  `user_id` INT NULL DEFAULT NULL,
  `rating` INT NOT NULL,
  `comment` TEXT NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
    FOREIGN KEY (`book_id`)
    REFERENCES `book_review_db`.`books` (`id`),
    FOREIGN KEY (`user_id`)
    REFERENCES `book_review_db`.`users` (`id`))




CREATE USER 'review_books_app'@'localhost' IDENTIFIED BY '2022'; 
GRANT ALL PRIVILEGES ON book_review_db.* TO 'review_books_app'@'localhost';