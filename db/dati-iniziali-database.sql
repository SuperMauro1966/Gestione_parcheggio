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

-- Dump dei dati della tabella db_parcheggio.contiene: ~0 rows (circa)
DELETE FROM `contiene`;

-- Dump dei dati della tabella db_parcheggio.gestore: ~1 rows (circa)
DELETE FROM `gestore`;
INSERT INTO `gestore` (`IDGestore`, `RagioneSociale`, `PartitaIva`) VALUES
	(1, 'Frassineti2parking', '12334444555');

-- Dump dei dati della tabella db_parcheggio.occupa: ~0 rows (circa)
DELETE FROM `occupa`;

-- Dump dei dati della tabella db_parcheggio.parcheggio: ~0 rows (circa)
DELETE FROM `parcheggio`;

-- Dump dei dati della tabella db_parcheggio.piazzolebase: ~0 rows (circa)
DELETE FROM `piazzolebase`;

-- Dump dei dati della tabella db_parcheggio.possiede: ~0 rows (circa)
DELETE FROM `possiede`;

-- Dump dei dati della tabella db_parcheggio.postiliberi: ~0 rows (circa)
DELETE FROM `postiliberi`;

-- Dump dei dati della tabella db_parcheggio.ticket: ~0 rows (circa)
DELETE FROM `ticket`;

-- Dump dei dati della tabella db_parcheggio.tipologia: ~4 rows (circa)
DELETE FROM `tipologia`;
INSERT INTO `tipologia` (`IDTipologia`, `Tipo`) VALUES
	(5, 'autovettura'),
	(6, 'camper'),
	(1, 'moto'),
	(2, 'smartcar');

-- Dump dei dati della tabella db_parcheggio.veicolo: ~3 rows (circa)
DELETE FROM `veicolo`;
INSERT INTO `veicolo` (`IDVeicolo`, `Targa`, `AlimentazioneGpl`, `IDTipologia`) VALUES
	(1, 'ff673cx', 0, 5),
	(3, 'cb873cx', 1, 5),
	(4, 'df12679', 0, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
