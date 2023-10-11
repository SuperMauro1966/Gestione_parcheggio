import datetime
from enum import Enum

class AutUscitaStatus(Enum):
   AUTORIZZATO = 1
   TICKET_NON_TROVATO = 2
   IMPORTO_NON_PAGATO = 3
   NO_ORARIO_USCITA = 4
   TEMPO_MASSIMO_SCADUTO = 5

def e_autorizzato_a_uscire(id_ticket, conn):
   cursor= conn.cursor()
   cursor.execute("""
               SELECT OrarioEntrata, NOW() AS adesso,importo,OrarioUscita,IDTipologia
               FROM ticket AS t
               INNER JOIN veicolo AS v
               ON t.IDVeicolo=v.IDveicolo
               WHERE IDTicket = ? ;""", (id_ticket,)) 
   if cursor.rowcount != 1:
      return AutUscitaStatus.TICKET_NON_TROVATO 
   
   orario_ingresso, adesso, importo,orario_uscita,id_tipologia= cursor.fetchone() 
   differenza_tempo = adesso - orario_ingresso
   if differenza_tempo <= datetime.timedelta(minutes=5):
         return AutUscitaStatus.AUTORIZZATO
   
   #verifica altre regole per l'uscita 
   if importo <= 0:   #importo non pagato
      return AutUscitaStatus.IMPORTO_NON_PAGATO
   if orario_uscita is None:
      return AutUscitaStatus.NO_ORARIO_USCITA
   differenza_uscita = orario_uscita-adesso
   
   if differenza_uscita>datetime.timedelta(minutes=5):
         return AutUscitaStatus.TEMPO_MASSIMO_SCADUTO
   return AutUscitaStatus.AUTORIZZATO




     
     