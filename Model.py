# THE MODEL
import datetime
from collections import defaultdict
import mysql.connector as msc
import Database.databaseConfig as cfg


class Model:

    def __init__(self):
        self.search_text = ""
        self.search_type = ""
        return

    def query_database(self, query_dictionary):

        restaurant_list = []
        self.search_text = query_dictionary["Query"]
        self.search_type = query_dictionary["Type"]

        mydb = msc.connect(
            host=cfg.mysql["host"],
            user=cfg.mysql["user"],
            password=cfg.mysql["passwd"],
            database="restaurantinformation")

        cursor = mydb.cursor(buffered=True)



        if self.search_type == "Dinning Options":

            cursor.execute(f'SELECT restaurant_ID FROM dinning_options WHERE access_method = "{self.search_text}"')
            restaurantID = cursor.fetchall()
            #print(restaurantID)
            for r_id in restaurantID:
                restaurant = {}
                cursor.execute(f'SELECT name FROM restaurant WHERE id = "{r_id[0]}"')
                restaurant["name"] = cursor.fetchone()[0]



                cursor.execute(f'SELECT id FROM location WHERE restaurant_ID = "{r_id[0]}"')
                locationID = cursor.fetchall();
                cursor.execute(f'SELECT street, city, state, zip FROM location WHERE restaurant_ID = "{r_id[0]}"')
                locations = cursor.fetchall();
                #print(locations)
                for l_id, location in zip(locationID, locations):
                    restaurant1 = {"name": restaurant["name"]}
                    restaurant1["address"] = location
                    restaurant1 = {"name": restaurant1["name"], "address": restaurant1["address"]}

                    cursor.execute(f'SELECT theContact FROM contact_method WHERE typeOfContact = "phone" AND location_ID = {l_id[0]}')
                    restaurant1["phone"] = cursor.fetchone()[0]
                    operatingHours = {}
                    days = ["M", "T", "W", "TR", "F", "SA", "SU"]
                    for day in days:
                        cursor.execute(f'SELECT start_time, end_time FROM operating_hours WHERE day_open_id = (SELECT id FROM days WHERE day_of_the_week = "{day}") AND location_id = {l_id[0]}')
                        operatingHours[day] = str(cursor.fetchone())

                    restaurant1["hours"] = operatingHours



                    restaurant_list.append(restaurant1)

        for restaurant in restaurant_list:
            print(restaurant)
        cursor.close()



    def __connectDatabase(self):
        mydb = msc.connect(
            host=cfg.mysql["host"],
            user=cfg.mysql["user"],
            password=cfg.mysql["passwd"],
            database="restaurantinformation")

        cursor = mydb.cursor()


        return cursor
