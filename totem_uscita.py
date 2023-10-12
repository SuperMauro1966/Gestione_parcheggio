import time

import mariadb
import sys


import lettore_ticket as lt
import autorizzatore_uscita as au
import sbarra as sb
import display as ds

class TotemUscita:
    WELCOME="Benvuto, inserisci il tuo ticket "
    BYEBYE= "Arrivederci e grazie! "
    NOT_ALLOWED="Non autorizzato all'uscita "


    def __init__(self):
        self.conn=self.get_db_connection()
        self.messaggi=self.get_messaggi()

       
    def get_db_connection(self):
        try:
            return  mariadb.connect(
                user="root",
                host="127.0.0.1",
                port=3308,
                password="12345678",
                database="db_parcheggio"

            )
        except mariadb.Error as e:
            print(f": {e}")
            sys.exit(1)

    def get_messaggi(self):

        cursor= self.conn.cursor()
        cursor.execute(""" 
                SELECT Contenuto,Lingua
                FROM messaggi AS m
                       """)
        db_messaggi = {}
        for riga in cursor:
            contenuto, lingua = riga 
            if ":" not in contenuto:
                continue
            try:
                dizionario = db_messaggi[lingua]
            except KeyError:
                db_messaggi[lingua] = dizionario = {}
                
            
            prefisso, suffisso = contenuto.split(':',maxsplit=1)
            for status in au.AutUscitaStatus:
                if status.name == prefisso:
                    dizionario[status]=suffisso
                    break
        
        return db_messaggi


    def start(self):
        while True:
            ds.mostra_messaggio(self.WELCOME)
            id_ticket= lt.get_id_ticket()
            status=au.e_autorizzato_a_uscire(id_ticket, self.conn)
            if status == au.AutUscitaStatus.AUTORIZZATO :
                ds.mostra_messaggio(self.messaggi.get(status,"???"))
                sb.permetti_uscita()
            else:
                ds.mostra_messaggio(self.messaggi.get(status,"???"))

            time.sleep(10)

totem_uscita=TotemUscita()
totem_uscita.start()


        