
import mysql.connector
import databaseConfig as cfg

mydb = mysql.connector.connect(
    host=cfg.mysql["host"],
    user=cfg.mysql["user"],
    password=cfg.mysql["passwd"],
    database=cfg.mysql["restaurantDB"])

mycursor = mydb.cursor()

#mycursor.execute(f'CREATE DATABASE {cfg.databases["restaurantDB"]}')

mycursor.execute("SHOW DATABASES")
for db in mycursor:
    print(db)

    # creates restaurant table
#mycursor.execute('CREATE TABLE restaurant (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, name VARCHAR(50))')




