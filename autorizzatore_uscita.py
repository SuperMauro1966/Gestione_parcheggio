import datetime

_totale_piazzole_locali=None

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

    _aggiorna_posti_liberi(id_tipologia,conn)    

    return True

def _aggiorna_posti_liberi(id_tipologia,conn):
    cursor= conn.cursor()
    cursor.execute("""       

                SELECT COUNT(v.IDVeicolo)
                FROM veicolo AS v
                INNER JOIN  ticket AS t
                ON t.IDVeicolo=v.IDVeicolo
                WHERE v.IDTipologia=? AND t.OrarioUscita IS NULL
                ORDER BY Targa ASC;""",(id_tipologia))
    veicoli_presenti= cursor.fetchone()

def _init_posti_totali(conn):
    global _totale_piazzole_locali
    cursor= conn.cursor()
    cursor.execute("""    
                SELECT pb.IDPostiBase,sum(c.PostiTotali) AS numero_posti
                FROM parcheggio AS p
                INNER JOIN contiene AS c
                ON p.IDParcheggio=c.IDparcheggio
                INNER JOIN piazzolebase AS pb
                ON pb.IDPostiBase=c.IDPostiBase
                GROUP BY pb.IDPostiBase;""")
    
    _totale_piazzole_locali={id_posti_base:nr for id_posti_base,nr in cursor}
    cursor.close()
    


     
     