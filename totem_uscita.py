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
        self.messaggi={
            au.AutUscitaStatus.AUTORIZZATO:"ARRIVEDERCI E GRAZIE ",
            au.AutUscitaStatus.IMPORTO_NON_PAGATO:"NON AUTORIZZATO AD USCIRE PERCHE L'IMPORTO NON E STATO PAGATO",
            au.AutUscitaStatus.NO_ORARIO_USCITA:"",
            au.AutUscitaStatus.TEMPO_MASSIMO_SCADUTO:"",
            
        }

    def get_db_connection(self):
        try:
            return  mariadb.connect(
                user="root",
                host="127.0.0.1",
                port=3306,
                password="12345678",
                database="db_parcheggio"

            )
        except mariadb.Error as e:
            print(f": {e}")
            sys.exit(1)
        

    def start(self):
        
        while True:
            ds.mostra_messaggio(self.WELCOME)
            id_ticket= lt.get_id_ticket()
            status=au.e_autorizzato_a_uscire(id_ticket)
            if status == au.AutUscitaStatus.AUTORIZZATO :
                ds.mostra_messaggio(self.messaggi.get(status,"???"))
                sb.permetti_uscita()
            else:
                ds.mostra_messaggio(self.messaggi.get(status,"???"))

            time.sleep(10)

totem_uscita=TotemUscita()
totem_uscita.start()


        