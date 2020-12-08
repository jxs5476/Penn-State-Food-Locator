
import mysql.connector
import databaseConfig as cfg

mydb = mysql.connector.connect(
    host=cfg.mysql["host"],
    user=cfg.mysql["user"],
    password=cfg.mysql["passwd"])

mycursor = mydb.cursor()

mycursor.execute(f'CREATE DATABASE {cfg.databases["restaurantDB"]}')




