import time

import mariadb
import sys


import lettore_ticket as lt
import autorizzatore_uscita as au
import sbarra as sb
import display as ds

class TotemUscita:

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

        dati_messaggi=(( contenuto.split(":", maxsplit=1)[0],
                        contenuto.split(":", maxsplit=1)[1],
                          lingua)
                        for contenuto, lingua in cursor if ":" in contenuto)

        db_messaggi = {}
        authstatus_by_name = { status.name : status for status in au.AutUscitaStatus}

        for status_name, message, lingua in dati_messaggi:
            try:
                dizionario = db_messaggi[lingua]
            except KeyError:
                db_messaggi[lingua] = dizionario = {}
                
            dizionario[authstatus_by_name.get(status_name,"???")]= message

        return db_messaggi




    def start(self):
        while True:
            lingua = self._selezione_lingue()
            id_ticket = lt.get_id_ticket()
            status = au.e_autorizzato_a_uscire(id_ticket, self.conn)
            if status == au.AutUscitaStatus.AUTORIZZATO :
                ds.mostra_messaggio(self.messaggi[lingua].get(status,"???"))
                sb.permetti_uscita()
            else:
                ds.mostra_messaggio(self.messaggi[lingua].get(status,"???"))

            time.sleep(10)


    def _selezione_lingua(self):
        ds.mostra_messaggio("lingue disponibili")
        pos_lang_sequence = enumerate(self.messaggi.keys(),start= 1) 
        scelta_lingue = dict(pos_lang_sequence)
        for num, codice_lingua in pos_lang_sequence :
            ds.mostra_messaggio(str(num) + "-" + codice_lingua)
        ds.mostra_messaggio("Seleziona Lingua")

        lingua = None
        while lingua is None:
            lingua = scelta_lingue.get(ds.pulsante_premuto(),None) 

        return lingua
        

if __name__ == "__main__":
    totem_uscita=TotemUscita()
    totem_uscita.start()


