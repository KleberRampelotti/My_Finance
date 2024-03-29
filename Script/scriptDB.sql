-- MySQL Script generated by MySQL Workbench
-- Mon Aug 12 10:33:39 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Financeiro
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Financeiro
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Financeiro` DEFAULT CHARACTER SET utf8 ;
USE `Financeiro` ;

-- -----------------------------------------------------
-- Table `Financeiro`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Financeiro`.`Usuario` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Senha` VARCHAR(100) NOT NULL,
  `Data_Nascimento` DATE NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Financeiro`.`Conta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Financeiro`.`Conta` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Saldo` DECIMAL(9,2) NOT NULL,
  `Usuario_Id` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_Conta_Usuario_idx` (`Usuario_Id` ASC),
  CONSTRAINT `fk_Conta_Usuario`
    FOREIGN KEY (`Usuario_Id`)
    REFERENCES `Financeiro`.`Usuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Financeiro`.`Plano_Contas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Financeiro`.`Plano_Contas` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Descricao` VARCHAR(45) NOT NULL,
  `Tipo` CHAR(1) NULL,
   `Usuario_Id` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_Plano_Contas_Usuario_idx` (`Usuario_Id` ASC),
  CONSTRAINT `fk_Plano_Contas_Usuario`
    FOREIGN KEY (`Usuario_Id`)
    REFERENCES `Financeiro`.`Usuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Financeiro`.`Transacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Financeiro`.`Transacao` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Data` DATETIME NOT NULL,
  `Tipo` CHAR(1) NOT NULL,
  `Valor` DECIMAL(9,2) NOT NULL,
  `Descricao` VARCHAR(45) NULL,
  `Conta_Id` INT NOT NULL,
  `Plano_Contas_Id` INT NOT NULL,
   `Usuario_Id` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_Transacao_Conta1_idx` (`Conta_Id` ASC),
  INDEX `fk_Transacao_Plano_Contas1_idx` (`Plano_Contas_Id` ASC),
  INDEX `fk_Plano_Contas_Usuario_idx` (`Usuario_Id` ASC),
  CONSTRAINT `fk_Transacao_Conta1`
    FOREIGN KEY (`Conta_Id`)
    REFERENCES `Financeiro`.`Conta` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transacao_Plano_Contas1`
    FOREIGN KEY (`Plano_Contas_Id`)
    REFERENCES `Financeiro`.`Plano_Contas` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT `fk_Plano_Contas_Usuario1`
    FOREIGN KEY (`Usuario_Id`)
    REFERENCES `Financeiro`.`Usuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
