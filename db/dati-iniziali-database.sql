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

-- Dump dei dati della tabella db_parcheggio.gestore: ~0 rows (circa)
DELETE FROM `gestore`;

-- Dump dei dati della tabella db_parcheggio.messaggi: ~6 rows (circa)
DELETE FROM `messaggi`;
INSERT INTO `messaggi` (`IDMessaggi`, `Contenuto`, `Attivo`, `Lingua`, `Destinatario`) VALUES
	(1, 'AUTORIZZATO:ARRIVEDERCI E GRAZIE!', 0, 'ITA', 'TOTEM-USCITA'),
	(2, 'IMPORTO_NON_PAGATO:NON AUTORIZZATO AD USCIRE PERCHE L\'IMPORTO NON E STATO PAGATO', 0, 'ITA', 'TOTEM-USCITA'),
	(3, 'TEMPO_MASSIMO_SCADUTO:NON AUTORIZZATO AD USCIRE PERCHE FUORI TEMPO MASSIMO', 0, 'ITA', 'TOTEM-USCITA'),
	(4, 'NO_ORARIO_USCITA:NON AUTORIZZATO AD USCIRE PERCHE NON C\'E L\'ORARIO D\'USCITA', 0, 'ITA', 'TOTEM-USCITA'),
	(5, 'TICKET_NON_TROVATO:NON AUTORIZZATO AD USCIRE PERCHE TICKET NON TROVATO', 0, 'ITA', 'TOTEM-USCITA'),
	(6, 'IMPORTO_NON_PAGATO:NON AUTORIZZATO AD USCIRE PERCHE L\'IMPORTO NON E STATO PAGATO', 0, 'ESP', 'TOTEM-USCITA');

-- Dump dei dati della tabella db_parcheggio.parcheggio: ~0 rows (circa)
DELETE FROM `parcheggio`;

-- Dump dei dati della tabella db_parcheggio.possiede: ~0 rows (circa)
DELETE FROM `possiede`;

-- Dump dei dati della tabella db_parcheggio.ticket: ~0 rows (circa)
DELETE FROM `ticket`;

-- Dump dei dati della tabella db_parcheggio.tipologia: ~0 rows (circa)
DELETE FROM `tipologia`;

-- Dump dei dati della tabella db_parcheggio.veicolo: ~0 rows (circa)
DELETE FROM `veicolo`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
