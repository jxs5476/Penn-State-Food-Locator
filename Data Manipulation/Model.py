# THE MODEL
import datetime
from collections import defaultdict
import mysql.connector as msc
import Database.databaseConfig as cfg


class Model:

    def __init__(self,search_text, search_type):
        self.search_text = search_text
        self.search_type = search_type
        return

    def query_database(self):

        restaurant_list = []

        mydb = msc.connect(
            host=cfg.mysql["host"],
            user=cfg.mysql["user"],
            password=cfg.mysql["passwd"],
            database="restaurantinformation")

        cursor = mydb.cursor(buffered=True)
        restaurantID = ()

        if self.search_type == "Dining Option":
            cursor.execute(f'SELECT restaurant_ID FROM dinning_options WHERE access_method = "{self.search_text}"')
            restaurantID = cursor.fetchall()
        elif self.search_type == "Restaurant Type":
            cursor.execute(f'SELECT restaurant_ID FROM restaurant_type WHERE restaurant_type = "{self.search_text}"')
            restaurantID = cursor.fetchall()
        elif self.search_type == "Restaurant Name":
            cursor.execute(f'SELECT id FROM restaurant WHERE name = "{self.search_text}"')
            restaurantID = cursor.fetchall()

        for r_id in restaurantID:
            restaurant = {}
            cursor.execute(f'SELECT name FROM restaurant WHERE id = "{r_id[0]}"')
            restaurant["name"] = cursor.fetchone()[0]

            cursor.execute(f'SELECT id FROM location WHERE restaurant_ID = "{r_id[0]}"')
            locationID = cursor.fetchall();
            cursor.execute(f'SELECT street, city, state, zip FROM location WHERE restaurant_ID = "{r_id[0]}"')
            locations = cursor.fetchall();

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
                    delta = cursor.fetchone()
                    if delta is not None:
                        delta1 = (str(delta[0]), str(delta[1]))
                        operatingHours[day] = delta1
                    else:
                        operatingHours[day] = "Closed"

                restaurant1["hours"] = operatingHours

                restaurant_list.append(restaurant1)

        cursor.close()
        for restaurant in restaurant_list:
            print(restaurant)

        return tuple(restaurant_list)

    def __connectDatabase(self):
        mydb = msc.connect(
            host=cfg.mysql["host"],
            user=cfg.mysql["user"],
            password=cfg.mysql["passwd"],
            database="restaurantinformation")

        cursor = mydb.cursor()

        return cursor
