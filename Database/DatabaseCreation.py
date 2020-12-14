
import mysql.connector
import databaseConfig as cfg
from Model import Model



query = {"Type": "Dinning Options", "Query": "Dine in"}

model = Model()
model.query_database(query)




