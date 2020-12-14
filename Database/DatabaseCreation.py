
from Model import Model

query = {"Type": "Restaurant Name", "Query": "Wendy's"}

model = Model("Restaurant Name", "Wendy's")
model.query_database()
