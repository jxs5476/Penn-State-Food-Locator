
import mysql.connector
import databaseConfig as cfg
from Model import Model



query = {"Type": "Restaurant Name", "Query": "Wendy's"}

model = Model()
model.query_database(query)




