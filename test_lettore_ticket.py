import mariadb
import sys
import autorizzatore_uscita as au

try:
    conn=  mariadb.connect(
        user="root",
        password="12345678",
        host="127.0.0.1",
        port=3308,
        database="db_parcheggio"

    )
except mariadb.Error as e:
    print(f": {e}")
    sys.exit(1)

def test_autorizzato_a_uscire():
    print("test_autorizzo_a_uscire")
    assert au.e_autorizzato_a_uscire(1,conn) == False 
    cursor= conn.cursor()
    cursor.execute("""
                  UPDATE ticket
                  SET OrarioEntrata=NOW()
                  WHERE IDTicket=3"""
                  ) 
    cursor.close()
       
    assert au.e_autorizzato_a_uscire(3,conn) == True

if __name__== "__main__":
    test_autorizzato_a_uscire()

conn.close()
