-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              10.6.13-MariaDB - mariadb.org binary distribution
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

-- Dump della struttura di tabella db_parcheggio.contiene
DROP TABLE IF EXISTS `contiene`;
CREATE TABLE IF NOT EXISTS `contiene` (
  `IDPostiBase` int(11) NOT NULL,
  `IDParcheggio` int(11) NOT NULL,
  `PostiTotatli` int(11) NOT NULL,
  PRIMARY KEY (`IDPostiBase`,`IDParcheggio`),
  KEY `IDX_Contiene_Parcheggio` (`IDParcheggio`) USING BTREE,
  KEY `IDX_Contiene_PostiBase` (`IDPostiBase`) USING BTREE,
  CONSTRAINT `FK__contiene_PostiBase` FOREIGN KEY (`IDPostiBase`) REFERENCES `piazzolebase` (`IDPostiBase`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_contiene_Parcheggio` FOREIGN KEY (`IDParcheggio`) REFERENCES `parcheggio` (`IDParcheggio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='specifica quante piazzole case contiene il parcheggio ';

-- Dump dei dati della tabella db_parcheggio.contiene: ~0 rows (circa)
DELETE FROM `contiene`;

-- Dump della struttura di tabella db_parcheggio.gestore
DROP TABLE IF EXISTS `gestore`;
CREATE TABLE IF NOT EXISTS `gestore` (
  `IDGestore` int(11) NOT NULL,
  `RagioneSociale` varchar(60) NOT NULL,
  `PartitaIva` char(11) NOT NULL,
  PRIMARY KEY (`IDGestore`),
  UNIQUE KEY `IDX_Gestore_PartitaIva` (`PartitaIva`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='comprede i dati identificativi dei dati del gestore del parcheggio ';

-- Dump dei dati della tabella db_parcheggio.gestore: ~0 rows (circa)
DELETE FROM `gestore`;

-- Dump della struttura di tabella db_parcheggio.occupa
DROP TABLE IF EXISTS `occupa`;
CREATE TABLE IF NOT EXISTS `occupa` (
  `IDTipologia` int(11) NOT NULL,
  `IDPostiBase` int(11) NOT NULL,
  `NRPiazzole` int(11) NOT NULL,
  PRIMARY KEY (`IDTipologia`,`IDPostiBase`) USING BTREE,
  KEY `IDX_occupa_IDPostiBase` (`IDPostiBase`) USING BTREE,
  KEY `IDX_occupa_IDTipologia` (`IDTipologia`),
  CONSTRAINT `FK_occupa_PostiBase` FOREIGN KEY (`IDPostiBase`) REFERENCES `piazzolebase` (`IDPostiBase`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_occupa_Tipologia` FOREIGN KEY (`IDTipologia`) REFERENCES `tipologia` (`IDTipologia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='piazzole occupate da un dato tipo di veicolo ';

-- Dump dei dati della tabella db_parcheggio.occupa: ~0 rows (circa)
DELETE FROM `occupa`;

-- Dump della struttura di tabella db_parcheggio.parcheggio
DROP TABLE IF EXISTS `parcheggio`;
CREATE TABLE IF NOT EXISTS `parcheggio` (
  `IDParcheggio` int(11) NOT NULL,
  `Denominazione` varchar(20) NOT NULL,
  `AbilitatoGpl` tinyint(1) NOT NULL,
  PRIMARY KEY (`IDParcheggio`),
  UNIQUE KEY `IDX_Parcheggio_Denominazione` (`Denominazione`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='gestisce tutte le informazioni riguardanti la capacità dei parcheggi , posti liberi e la denominazione del parcheggio ';

-- Dump dei dati della tabella db_parcheggio.parcheggio: ~0 rows (circa)
DELETE FROM `parcheggio`;

-- Dump della struttura di tabella db_parcheggio.piazzolebase
DROP TABLE IF EXISTS `piazzolebase`;
CREATE TABLE IF NOT EXISTS `piazzolebase` (
  `IDPostiBase` int(11) NOT NULL AUTO_INCREMENT,
  `TipoPiazzola:` varchar(15) NOT NULL,
  PRIMARY KEY (`IDPostiBase`),
  UNIQUE KEY `IDX_PostiBase_TipoPiazzola:` (`TipoPiazzola:`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='specifica il tipo di piazzola e i posti totali disponibili ';

-- Dump dei dati della tabella db_parcheggio.piazzolebase: ~0 rows (circa)
DELETE FROM `piazzolebase`;

-- Dump della struttura di tabella db_parcheggio.possiede
DROP TABLE IF EXISTS `possiede`;
CREATE TABLE IF NOT EXISTS `possiede` (
  `IDGestore` int(11) NOT NULL,
  `IDParcehggio` int(11) NOT NULL,
  PRIMARY KEY (`IDGestore`,`IDParcehggio`),
  KEY `IDX_possiede_parcehggio` (`IDParcehggio`) USING BTREE,
  KEY `IDX_possiede_Gestore` (`IDGestore`) USING BTREE,
  CONSTRAINT `FK_possiede_gestore` FOREIGN KEY (`IDGestore`) REFERENCES `gestore` (`IDGestore`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_possiede_parcehggio` FOREIGN KEY (`IDParcehggio`) REFERENCES `parcheggio` (`IDParcheggio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='indica quanti parcheggi possiede il gestore ';

-- Dump dei dati della tabella db_parcheggio.possiede: ~0 rows (circa)
DELETE FROM `possiede`;

-- Dump della struttura di tabella db_parcheggio.postiliberi
DROP TABLE IF EXISTS `postiliberi`;
CREATE TABLE IF NOT EXISTS `postiliberi` (
  `IDParcehggio` int(11) NOT NULL,
  `IDPostiBase` int(11) NOT NULL,
  `NonOccupati` int(11) NOT NULL,
  PRIMARY KEY (`IDParcehggio`,`IDPostiBase`) USING BTREE,
  KEY `IDX_postiliberi_postibase` (`IDPostiBase`) USING BTREE,
  KEY `IDX_postiliberi_Parcehggio` (`IDParcehggio`) USING BTREE,
  CONSTRAINT `FK_postiliberi_postibase` FOREIGN KEY (`IDPostiBase`) REFERENCES `piazzolebase` (`IDPostiBase`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKpostiliberi_parcheggio` FOREIGN KEY (`IDParcehggio`) REFERENCES `parcheggio` (`IDParcheggio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='mostra i posti liberi nelle piazzole del parcheggio ';

-- Dump dei dati della tabella db_parcheggio.postiliberi: ~0 rows (circa)
DELETE FROM `postiliberi`;

-- Dump della struttura di tabella db_parcheggio.ticket
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE IF NOT EXISTS `ticket` (
  `IDTicket` int(11) NOT NULL AUTO_INCREMENT,
  `Importo` decimal(10,2) DEFAULT NULL,
  `OrarioEntrata` datetime NOT NULL,
  `OrarioUscita` datetime NOT NULL,
  `Ricevuta` tinyint(4) NOT NULL,
  `IDVeicolo` int(11) NOT NULL,
  `IDGestore` int(11) NOT NULL,
  PRIMARY KEY (`IDTicket`) USING BTREE,
  KEY `FK_ticket_veicolo` (`IDVeicolo`),
  KEY `FK_Tciket_IDGestore` (`IDGestore`),
  CONSTRAINT `FK_Tciket_IDGestore` FOREIGN KEY (`IDGestore`) REFERENCES `gestore` (`IDGestore`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ticket_veicolo` FOREIGN KEY (`IDVeicolo`) REFERENCES `veicolo` (`IDVeicolo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='contiene le informazioni riguardanti l''importo, gli orari e la rieveuta del veicolo ';

-- Dump dei dati della tabella db_parcheggio.ticket: ~0 rows (circa)
DELETE FROM `ticket`;

-- Dump della struttura di tabella db_parcheggio.tipologia
DROP TABLE IF EXISTS `tipologia`;
CREATE TABLE IF NOT EXISTS `tipologia` (
  `IDTipologia` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(20) NOT NULL,
  PRIMARY KEY (`IDTipologia`),
  KEY `IDTipologia` (`IDTipologia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='contiene le tipologie dei veicoli \r\n';

-- Dump dei dati della tabella db_parcheggio.tipologia: ~0 rows (circa)
DELETE FROM `tipologia`;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='autovetture che hanno parcheggiato almenon una volta in uno o più parcheggi ';

-- Dump dei dati della tabella db_parcheggio.veicolo: ~0 rows (circa)
DELETE FROM `veicolo`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
