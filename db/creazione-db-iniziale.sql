-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              11.3.0-MariaDB - mariadb.org binary distribution
-- S.O. server:                  Win64
-- HeidiSQL Versione:            12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dump della struttura del database db_parcheggio
DROP DATABASE IF EXISTS `db_parcheggio`;
CREATE DATABASE IF NOT EXISTS `db_parcheggio` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */;
USE `db_parcheggio`;

-- Dump della struttura di tabella db_parcheggio.gestore
DROP TABLE IF EXISTS `gestore`;
CREATE TABLE IF NOT EXISTS `gestore` (
  `IDGestore` int(11) NOT NULL AUTO_INCREMENT,
  `RagioneSociale` varchar(60) NOT NULL,
  `PartitaIva` char(11) NOT NULL,
  `attivo` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`IDGestore`),
  UNIQUE KEY `IDX_Gestore_PartitaIva` (`PartitaIva`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='comprede i dati identificativi dei dati del gestore del parcheggio ';

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella db_parcheggio.messaggi
DROP TABLE IF EXISTS `messaggi`;
CREATE TABLE IF NOT EXISTS `messaggi` (
  `IDMessaggi` int(11) NOT NULL AUTO_INCREMENT,
  `Contenuto` varchar(500) NOT NULL,
  `Attivo` tinyint(1) NOT NULL DEFAULT 0,
  `Lingua` varchar(3) NOT NULL,
  `Destinatario` varchar(50) NOT NULL,
  PRIMARY KEY (`IDMessaggi`),
  FULLTEXT KEY `IDX_messaggi_Destinatario` (`Destinatario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='messagi che compariranno sul display';

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella db_parcheggio.parcheggio
DROP TABLE IF EXISTS `parcheggio`;
CREATE TABLE IF NOT EXISTS `parcheggio` (
  `IDParcheggio` int(11) NOT NULL,
  `Denominazione` varchar(20) NOT NULL,
  `AbilitatoGpl` tinyint(1) NOT NULL,
  `NrPiazzoleTotali` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`IDParcheggio`),
  UNIQUE KEY `IDX_Parcheggio_Denominazione` (`Denominazione`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='gestisce tutte le informazioni riguardanti la capacità dei parcheggi , posti liberi e la denominazione del parcheggio ';

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella db_parcheggio.possiede
DROP TABLE IF EXISTS `possiede`;
CREATE TABLE IF NOT EXISTS `possiede` (
  `IDGestore` int(11) NOT NULL,
  `IDParcheggio` int(11) NOT NULL,
  PRIMARY KEY (`IDGestore`,`IDParcheggio`) USING BTREE,
  KEY `IDX_possiede_Gestore` (`IDGestore`) USING BTREE,
  KEY `IDX_possiede_parcehggio` (`IDParcheggio`) USING BTREE,
  CONSTRAINT `FK_possiede_gestore` FOREIGN KEY (`IDGestore`) REFERENCES `gestore` (`IDGestore`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_possiede_parcehggio` FOREIGN KEY (`IDParcheggio`) REFERENCES `parcheggio` (`IDParcheggio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='indica quanti parcheggi possiede il gestore ';

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella db_parcheggio.ticket
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE IF NOT EXISTS `ticket` (
  `IDTicket` int(11) NOT NULL AUTO_INCREMENT,
  `Importo` decimal(10,2) NOT NULL DEFAULT 0.00,
  `OrarioEntrata` datetime NOT NULL,
  `OrarioUscita` datetime DEFAULT NULL,
  `Ricevuta` tinyint(4) DEFAULT NULL,
  `IDVeicolo` int(11) NOT NULL,
  `IDGestore` int(11) NOT NULL,
  PRIMARY KEY (`IDTicket`) USING BTREE,
  KEY `FK_ticket_veicolo` (`IDVeicolo`) USING BTREE,
  KEY `FK_Tciket_IDGestore` (`IDGestore`) USING BTREE,
  CONSTRAINT `FK_Ticket_IDGestore` FOREIGN KEY (`IDGestore`) REFERENCES `gestore` (`IDGestore`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Ticket_veicolo` FOREIGN KEY (`IDVeicolo`) REFERENCES `veicolo` (`IDVeicolo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='contiene le informazioni riguardanti l''importo, gli orari e la rieveuta del veicolo ';

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella db_parcheggio.tipologia
DROP TABLE IF EXISTS `tipologia`;
CREATE TABLE IF NOT EXISTS `tipologia` (
  `IDTipologia` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(20) NOT NULL,
  `NrPiazzoleBase` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`IDTipologia`),
  UNIQUE KEY `IDX_tipologia_Tipo` (`Tipo`),
  KEY `IDTipologia` (`IDTipologia`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='contiene le tipologie dei veicoli \r\n';

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella db_parcheggio.veicolo
DROP TABLE IF EXISTS `veicolo`;
CREATE TABLE IF NOT EXISTS `veicolo` (
  `IDVeicolo` int(11) NOT NULL AUTO_INCREMENT,
  `Targa` char(7) NOT NULL,
  `AlimentazioneGpl` tinyint(1) NOT NULL,
  `IDTipologia` int(11) NOT NULL,
  PRIMARY KEY (`IDVeicolo`),
  UNIQUE KEY `IDX_Veicolo_Targa` (`Targa`),
  KEY `FK_Veicolo_Tipologia` (`IDTipologia`),
  CONSTRAINT `FK_Veicolo_Tipologia` FOREIGN KEY (`IDTipologia`) REFERENCES `tipologia` (`IDTipologia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='autovetture che hanno parcheggiato almenon una volta in uno o più parcheggi ';

-- L’esportazione dei dati non era selezionata.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
