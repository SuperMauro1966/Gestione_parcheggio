import time
import lettore_ticket as lt
import autorizzatore_uscita as au
import sbarra as sb
import display as ds

class TotemUscita:
    WELCOME="Benvuto, inserisci il tuo ticket "
    BYEBYE= "Arrivederci e grazie! "
    NOT_ALLOWED="Non autorizzato all'uscita "
    def __init__(self):
        pass

    def start(self):
        while True:
            ds.mostra_messaggio(self.WELCOME)
            id_ticket= lt.get_id_ticket()
            if au.e_autorizzato_a_uscire(id_ticket):
                ds.mostra_messaggio(self.BYEBYE)
                sb.alzo_sbarra()
                #aggiornamento posto liberi
            else:
                ds.mostra_messaggio(self.NOT_ALLOWED)

            time.sleep(10)

totem_uscita=TotemUscita()
totem_uscita.start()


        