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

-- Dump dei dati della tabella db_parcheggio.contiene: ~9 rows (circa)
DELETE FROM `contiene`;
INSERT INTO `contiene` (`IDPostiBase`, `IDParcheggio`, `PostiTotali`) VALUES
	(1, 1, 5),
	(1, 2, 20),
	(1, 3, 35),
	(2, 1, 10),
	(2, 2, 25),
	(2, 3, 40),
	(3, 1, 15),
	(3, 2, 30),
	(3, 3, 45);

-- Dump dei dati della tabella db_parcheggio.gestore: ~3 rows (circa)
DELETE FROM `gestore`;
INSERT INTO `gestore` (`IDGestore`, `RagioneSociale`, `PartitaIva`, `attivo`) VALUES
	(1, 'Frassineti2parking', '12334444555', 0),
	(6, 'Frate4ww', '465677887', 1);

-- Dump dei dati della tabella db_parcheggio.occupa: ~0 rows (circa)
DELETE FROM `occupa`;

-- Dump dei dati della tabella db_parcheggio.parcheggio: ~3 rows (circa)
DELETE FROM `parcheggio`;
INSERT INTO `parcheggio` (`IDParcheggio`, `Denominazione`, `AbilitatoGpl`) VALUES
	(1, 'interrato', 0),
	(2, 'livello A', 1),
	(3, 'livello B', 1);

-- Dump dei dati della tabella db_parcheggio.piazzolebase: ~3 rows (circa)
DELETE FROM `piazzolebase`;
INSERT INTO `piazzolebase` (`IDPostiBase`, `TipoPiazzola:`) VALUES
	(3, 'autovettura'),
	(1, 'moto'),
	(2, 'smartcar');

-- Dump dei dati della tabella db_parcheggio.possiede: ~0 rows (circa)
DELETE FROM `possiede`;

-- Dump dei dati della tabella db_parcheggio.postiliberi: ~0 rows (circa)
DELETE FROM `postiliberi`;

-- Dump dei dati della tabella db_parcheggio.ticket: ~8 rows (circa)
DELETE FROM `ticket`;
INSERT INTO `ticket` (`IDTicket`, `Importo`, `OrarioEntrata`, `OrarioUscita`, `Ricevuta`, `IDVeicolo`, `IDGestore`) VALUES
	(1, 10.00, '2023-09-29 12:11:59', '2023-10-06 09:38:59', NULL, 1, 1),
	(2, 0.00, '2023-09-29 12:12:25', NULL, NULL, 3, 1),
	(3, 6.00, '2023-09-29 12:14:53', '2023-10-06 09:40:49', NULL, 4, 1),
	(5, 0.00, '2023-10-06 09:17:19', NULL, NULL, 2, 6),
	(6, 0.00, '2023-10-06 09:17:27', NULL, NULL, 5, 6),
	(7, 0.00, '2023-10-06 09:17:32', NULL, NULL, 6, 6),
	(8, 0.00, '2023-10-06 09:17:36', NULL, NULL, 7, 6),
	(9, 0.00, '2023-10-06 09:17:45', NULL, NULL, 8, 6);

-- Dump dei dati della tabella db_parcheggio.tipologia: ~4 rows (circa)
DELETE FROM `tipologia`;
INSERT INTO `tipologia` (`IDTipologia`, `Tipo`) VALUES
	(5, 'autovettura'),
	(6, 'camper'),
	(1, 'moto'),
	(2, 'smartcar');

-- Dump dei dati della tabella db_parcheggio.veicolo: ~8 rows (circa)
DELETE FROM `veicolo`;
INSERT INTO `veicolo` (`IDVeicolo`, `Targa`, `AlimentazioneGpl`, `IDTipologia`) VALUES
	(1, 'ff673cx', 0, 5),
	(2, 'sf18115', 0, 1),
	(3, 'cb873cx', 1, 5),
	(4, 'df12679', 0, 1),
	(5, 'ab567dx', 0, 2),
	(6, 'gx567we', 0, 2),
	(7, 'ed788rf', 0, 2),
	(8, 'rf17234', 0, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
