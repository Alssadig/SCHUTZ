import sqlite3
import mysql

connection = sqlite3.connect('SCHUTZ.db')

with open('Documents/schema SCHUTZ.sql') as fcreate:
    connection.executescript(fcreate.read())
connection.commit()

with open('Documents/init_db_insert.sql') as finsert:
    connection.executescript(finsert.read())
connection.commit()

connection.close()
