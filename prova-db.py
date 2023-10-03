# Module Imports
import mariadb
import sys

# Connect to MariaDB Platform
try:
    conn = mariadb.connect(
        user="root",
        password="12345678",
        host="127.0.0.1",
        port=3308,
        database="db_parcheggio"

    )
except mariadb.Error as e:
    print(f"Error connecting to MariaDB Platform: {e}")
    sys.exit(1)

# Get Cursor
cur = conn.cursor()
cur.execute(
    """
    SELECT
        IDGestore,
        RagioneSociale,
        PartitaIva,
        attivo
    FROM 
    gestore;""")
for (IDGestore, Ragionesociale, PartitaIva, attivo) in cur:
    print(f"{IDGestore=} {Ragionesociale=} {PartitaIva=} {attivo=}")

conn.close()

