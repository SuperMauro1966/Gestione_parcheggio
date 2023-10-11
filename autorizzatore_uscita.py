import datetime



def e_autorizzato_a_uscire(id_ticket, conn):
   cursor= conn.cursor()
   cursor.execute("""
               SELECT OrarioEntrata, NOW() AS adesso,importo,OrarioUscita,IDTipologia
               FROM ticket AS t
               INNER JOIN veicolo AS v
               ON t.IDVeicolo=v.IDveicolo
               WHERE IDTicket = ? ;""", (id_ticket,)) 
   if cursor.rowcount != 1:
      return False 
   
   orario_ingresso, adesso, importo,orario_uscita,id_tipologia= cursor.fetchone() 
   differenza_tempo = adesso - orario_ingresso
   if differenza_tempo <= datetime.timedelta(minutes=5):
         return True
   
   #verifica altre regole per l'uscita 
   if importo < 0:   #importo non pagato
      return False
   if orario_uscita is None:
      return False
   differenza_uscita = orario_uscita-adesso
   
   if differenza_uscita>datetime.timedelta(minutes=5):
         return False
   return True




     
     