import datetime

def e_autorizzato_a_uscire(id_ticket, conn):
   cursor= conn.cursor()
   cursor.execute("""
             SELECT OrarioEntrata, NOW() AS adesso 
            FROM ticket 
            WHERE IDTicket = ?""", (id_ticket,)) 
   if cursor.rowcount != 1:
      return False 
   
   orario_ingresso, adesso  = cursor.fetchone() 
  

   differenza_tempo = adesso - orario_ingresso
   if differenza_tempo <= datetime.timedelta(minutes=5):
         return True
  #verifica altre regole per l'uscita 
