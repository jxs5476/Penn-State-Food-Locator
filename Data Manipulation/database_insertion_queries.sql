use restaurantinformation;

#insert into restaurant
INSERT INTO restaurant (name)
            VALUES ("Wendy's"),
                   ("Chick-Fil-A"),
                   ("Perkins"),
                   ("Papa Johns"),
                   ("Texas Road House");

#insert into restaurant_type
INSERT INTO restaurant_type (restaurant_type, restaurant_ID)
			VALUES ("fast-food", (SELECT id FROM restaurant WHERE name="Wendy's")),
				   ("sit-down", (SELECT id FROM restaurant WHERE name="Perkins")),
                   ("fast-food", (SELECT id FROM restaurant WHERE name="Chick-Fil-A")),
                   ("pizzaria", (SELECT id FROM restaurant WHERE name="Papa Johns")),
                   ("sit-down", (SELECT id FROM restaurant WHERE name="Texas Road House"));

#insert into locations
INSERT INTO location (restaurant_ID, street, city, state, zip)
			values ((SELECT id FROM restaurant WHERE name="Wendy's"), "4186 Buffalo Rd", "Erie", "PA", 16510),
				   ((SELECT id FROM restaurant WHERE name="Wendy's"), "105 E 12th St", "Erie", "PA", 16501),
                   ((SELECT id FROM restaurant WHERE name="Wendy's"), "5902 Wattsburg Rd", "Erie", "PA", 16509),
                   ((SELECT id FROM restaurant WHERE name="Chick-Fil-A"), "7160 Peach St", "Erie", "PA", 16509),
                   ((SELECT id FROM restaurant WHERE name="Perkins"), "434 Buffalo Road", "Erie", "PA", 16510),
                   ((SELECT id FROM restaurant WHERE name="Perkins"), "4403 Peach Street", "Erie", "PA", 16509),
                   ((SELECT id FROM restaurant WHERE name="Papa Johns"), "1713 E 38th ST", "Erie", "PA", 16510),
                   ((SELECT id FROM restaurant WHERE name="Papa Johns"), "3870 peach St", "Erie", "PA", 16509),
                   ((SELECT id FROM restaurant WHERE name="Texas Road House"), "7475 Peach St", "Erie", "PA", 16509);

#inset into contact_method
INSERT INTO contact_method (typeofContact, theContact, restaurant_ID, location_ID)
			VALUES ("phone", "814-899-4611", (SELECT id FROM restaurant WHERE name="Wendy's"), (SELECT id FROM location WHERE street="4186 Buffalo Rd")),
				   ("phone", "814-455-0640", (SELECT id FROM restaurant WHERE name="Wendy's"), (SELECT id FROM location WHERE street="105 E 12th St")),
                   ("phone", "814-825-5897", (SELECT id FROM restaurant WHERE name="Wendy's"), (SELECT id FROM location WHERE street="5902 Wattsburg Rd")),
                   ("phone", "814-868-8557", (SELECT id FROM restaurant WHERE name="Chick-Fil-A"), (SELECT id FROM location WHERE street="7160 Peach St")),
				   ("phone", "814-898*1212", (SELECT id FROM restaurant WHERE name="Perkins"), (SELECT id FROM location WHERE street="434 Buffalo Road")),
                   ("phone", "814-864-0497", (SELECT id FROM restaurant WHERE name="Perkins"), (SELECT id FROM location WHERE street="4403 Peach Street")),
                   ("phone", "814-824-8282", (SELECT id FROM restaurant WHERE name="Papa Johns"), (SELECT id FROM location WHERE street="1713 E 38th ST")),
                   ("phone", "814-864-8282", (SELECT id FROM restaurant WHERE name="Papa Johns"), (SELECT id FROM location WHERE street="3870 peach St")),
                   ("phone", "814-864-9494", (SELECT id FROM restaurant WHERE name="Texas Road House"), (SELECT id FROM location WHERE street="7475 Peach St"));
                   
#insert into dinning_options
INSERT INTO dinning_options (access_method, restaurant_ID)
			VALUES ("Dine in", (SELECT id FROM restaurant WHERE name="Wendy's")),
				   ("Dine in", (SELECT id FROM restaurant WHERE name="Chick-Fil-A")),
			       ("Dine in", (SELECT id FROM restaurant WHERE name="Perkins")),
			       ("Dine in", (SELECT id FROM restaurant WHERE name="Texas Road House")),
				   ("Carry-out", (SELECT id FROM restaurant WHERE name="Wendy's")),
			       ("Carry-out", (SELECT id FROM restaurant WHERE name="Chick-Fil-A")),
			       ("Carry-out", (SELECT id FROM restaurant WHERE name="Perkins")),
			       ("Carry-out", (SELECT id FROM restaurant WHERE name="Papa Johns")),
			       ("Carry-out", (SELECT id FROM restaurant WHERE name="Texas Road House")),
			       ("Delivery", (SELECT id FROM restaurant WHERE name="Papa Johns"));
# insert into days
INSERT INTO days (day_of_the_week) 
			VALUES ("M"),
				   ("T"),
                   ("W"),
                   ("TR"),
                   ("F"),
                   ("SA"),
                   ("SU");

#insert into operation hours
INSERT INTO operating_hours (restaurant_ID, day_open_ID, start_time, end_time, location_ID)
			VALUES ((SELECT id FROM restaurant WHERE name="Texas Road House"), (SELECT id FROM days WHERE day_of_the_week="M"), "15:00:00", "21:30:00", (SELECT id FROM location WHERE street="7475 Peach St")),
				   ((SELECT id FROM restaurant WHERE name="Texas Road House"), (SELECT id FROM days WHERE day_of_the_week="T"), "15:00:00", "21:30:00", (SELECT id FROM location WHERE street="7475 Peach St")),
				   ((SELECT id FROM restaurant WHERE name="Texas Road House"), (SELECT id FROM days WHERE day_of_the_week="W"), "15:00:00", "21:30:00", (SELECT id FROM location WHERE street="7475 Peach St")),
				   ((SELECT id FROM restaurant WHERE name="Texas Road House"), (SELECT id FROM days WHERE day_of_the_week="TR"), "15:00:00", "21:30:00", (SELECT id FROM location WHERE street="7475 Peach St")),
				   ((SELECT id FROM restaurant WHERE name="Texas Road House"), (SELECT id FROM days WHERE day_of_the_week="F"), "11:30:00", "22:00:00", (SELECT id FROM location WHERE street="7475 Peach St")),
				   ((SELECT id FROM restaurant WHERE name="Texas Road House"), (SELECT id FROM days WHERE day_of_the_week="SA"), "11:30:00", "22:00:00", (SELECT id FROM location WHERE street="7475 Peach St")),
				   ((SELECT id FROM restaurant WHERE name="Texas Road House"), (SELECT id FROM days WHERE day_of_the_week="SU"), "11:30:00", "21:30:00", (SELECT id FROM location WHERE street="7475 Peach St")),
                   ((SELECT id FROM restaurant WHERE name="Wendy's"), (SELECT id FROM days WHERE day_of_the_week="M"), "06:30:00", "22:00:00", (SELECT id FROM location WHERE street="4186 Buffalo Rd")),
                   ((SELECT id FROM restaurant WHERE name="Wendy's"), (SELECT id FROM days WHERE day_of_the_week="T"), "06:30:00", "22:00:00", (SELECT id FROM location WHERE street="4186 Buffalo Rd")),
                   ((SELECT id FROM restaurant WHERE name="Wendy's"), (SELECT id FROM days WHERE day_of_the_week="W"), "06:30:00", "22:00:00", (SELECT id FROM location WHERE street="4186 Buffalo Rd")),
                   ((SELECT id FROM restaurant WHERE name="Wendy's"), (SELECT id FROM days WHERE day_of_the_week="TR"), "06:30:00", "22:00:00", (SELECT id FROM location WHERE street="4186 Buffalo Rd")),
                   ((SELECT id FROM restaurant WHERE name="Wendy's"), (SELECT id FROM days WHERE day_of_the_week="F"), "06:30:00", "22:00:00", (SELECT id FROM location WHERE street="4186 Buffalo Rd")),
                   ((SELECT id FROM restaurant WHERE name="Wendy's"), (SELECT id FROM days WHERE day_of_the_week="SA"), "06:30:00", "22:00:00", (SELECT id FROM location WHERE street="4186 Buffalo Rd")),
                   ((SELECT id FROM restaurant WHERE name="Wendy's"), (SELECT id FROM days WHERE day_of_the_week="SU"), "08:00:00", "22:00:00", (SELECT id FROM location WHERE street="4186 Buffalo Rd")),
                   ((SELECT id FROM restaurant WHERE name="Wendy's"), (SELECT id FROM days WHERE day_of_the_week="M"), "06:30:00", "01:00:00", (SELECT id FROM location WHERE street="105 E 12th St")),
                   ((SELECT id FROM restaurant WHERE name="Wendy's"), (SELECT id FROM days WHERE day_of_the_week="T"), "06:30:00", "01:00:00", (SELECT id FROM location WHERE street="105 E 12th St")),
                   ((SELECT id FROM restaurant WHERE name="Wendy's"), (SELECT id FROM days WHERE day_of_the_week="W"), "06:30:00", "01:00:00", (SELECT id FROM location WHERE street="105 E 12th St")),
                   ((SELECT id FROM restaurant WHERE name="Wendy's"), (SELECT id FROM days WHERE day_of_the_week="TR"), "06:30:00", "01:00:00", (SELECT id FROM location WHERE street="105 E 12th St")),
                   ((SELECT id FROM restaurant WHERE name="Wendy's"), (SELECT id FROM days WHERE day_of_the_week="F"), "06:30:00", "01:00:00", (SELECT id FROM location WHERE street="105 E 12th St")),
                   ((SELECT id FROM restaurant WHERE name="Wendy's"), (SELECT id FROM days WHERE day_of_the_week="SA"), "06:30:00", "01:00:00", (SELECT id FROM location WHERE street="105 E 12th St")),
                   ((SELECT id FROM restaurant WHERE name="Wendy's"), (SELECT id FROM days WHERE day_of_the_week="SU"), "06:30:00", "01:00:00", (SELECT id FROM location WHERE street="105 E 12th St")),
                   ((SELECT id FROM restaurant WHERE name="Wendy's"), (SELECT id FROM days WHERE day_of_the_week="M"), "06:30:00", "01:00:00", (SELECT id FROM location WHERE street="5902 Wattsburg Rd")),
                   ((SELECT id FROM restaurant WHERE name="Wendy's"), (SELECT id FROM days WHERE day_of_the_week="T"), "06:30:00", "01:00:00", (SELECT id FROM location WHERE street="5902 Wattsburg Rd")),
                   ((SELECT id FROM restaurant WHERE name="Wendy's"), (SELECT id FROM days WHERE day_of_the_week="W"), "06:30:00", "01:00:00", (SELECT id FROM location WHERE street="5902 Wattsburg Rd")),
                   ((SELECT id FROM restaurant WHERE name="Wendy's"), (SELECT id FROM days WHERE day_of_the_week="TR"), "06:30:00", "01:00:00", (SELECT id FROM location WHERE street="5902 Wattsburg Rd")),
                   ((SELECT id FROM restaurant WHERE name="Wendy's"), (SELECT id FROM days WHERE day_of_the_week="F"), "06:30:00", "00:00:00", (SELECT id FROM location WHERE street="5902 Wattsburg Rd")),
                   ((SELECT id FROM restaurant WHERE name="Wendy's"), (SELECT id FROM days WHERE day_of_the_week="SA"), "06:30:00", "00:00:00", (SELECT id FROM location WHERE street="5902 Wattsburg Rd")),
                   ((SELECT id FROM restaurant WHERE name="Wendy's"), (SELECT id FROM days WHERE day_of_the_week="SU"), "06:30:00", "01:00:00", (SELECT id FROM location WHERE street="5902 Wattsburg Rd")),
                   ((SELECT id FROM restaurant WHERE name="Chick-Fil-A"), (SELECT id FROM days WHERE day_of_the_week="M"), "06:30:00", "22:00:00", (SELECT id FROM location WHERE street="7160 Peach St")),
                   ((SELECT id FROM restaurant WHERE name="Chick-Fil-A"), (SELECT id FROM days WHERE day_of_the_week="T"), "06:30:00", "22:00:00", (SELECT id FROM location WHERE street="7160 Peach St")),
                   ((SELECT id FROM restaurant WHERE name="Chick-Fil-A"), (SELECT id FROM days WHERE day_of_the_week="W"), "06:30:00", "22:00:00", (SELECT id FROM location WHERE street="7160 Peach St")),
                   ((SELECT id FROM restaurant WHERE name="Chick-Fil-A"), (SELECT id FROM days WHERE day_of_the_week="TR"), "06:30:00", "22:00:00", (SELECT id FROM location WHERE street="7160 Peach St")),
                   ((SELECT id FROM restaurant WHERE name="Chick-Fil-A"), (SELECT id FROM days WHERE day_of_the_week="F"), "06:30:00", "22:00:00", (SELECT id FROM location WHERE street="7160 Peach St")),
                   ((SELECT id FROM restaurant WHERE name="Chick-Fil-A"), (SELECT id FROM days WHERE day_of_the_week="SA"), "06:30:00", "22:00:00", (SELECT id FROM location WHERE street="7160 Peach St")),
                   ((SELECT id FROM restaurant WHERE name="Perkins"), (SELECT id FROM days WHERE day_of_the_week="M"), "07:00:00", "22:00:00", (SELECT id FROM location WHERE street="434 Buffalo Road")),
                   ((SELECT id FROM restaurant WHERE name="Perkins"), (SELECT id FROM days WHERE day_of_the_week="T"), "07:00:00", "22:00:00", (SELECT id FROM location WHERE street="434 Buffalo Road")),
                   ((SELECT id FROM restaurant WHERE name="Perkins"), (SELECT id FROM days WHERE day_of_the_week="W"), "07:00:00", "22:00:00", (SELECT id FROM location WHERE street="434 Buffalo Road")),
                   ((SELECT id FROM restaurant WHERE name="Perkins"), (SELECT id FROM days WHERE day_of_the_week="TR"), "07:00:00", "22:00:00", (SELECT id FROM location WHERE street="434 Buffalo Road")),
                   ((SELECT id FROM restaurant WHERE name="Perkins"), (SELECT id FROM days WHERE day_of_the_week="F"), "07:00:00", "22:00:00", (SELECT id FROM location WHERE street="434 Buffalo Road")),
                   ((SELECT id FROM restaurant WHERE name="Perkins"), (SELECT id FROM days WHERE day_of_the_week="SA"), "07:00:00", "22:00:00", (SELECT id FROM location WHERE street="434 Buffalo Road")),
                   ((SELECT id FROM restaurant WHERE name="Perkins"), (SELECT id FROM days WHERE day_of_the_week="SU"), "07:00:00", "22:00:00", (SELECT id FROM location WHERE street="434 Buffalo Road")),
                   ((SELECT id FROM restaurant WHERE name="Perkins"), (SELECT id FROM days WHERE day_of_the_week="M"), "07:00:00", "22:00:00", (SELECT id FROM location WHERE street="4403 Peach Street")),
                   ((SELECT id FROM restaurant WHERE name="Perkins"), (SELECT id FROM days WHERE day_of_the_week="T"), "07:00:00", "22:00:00", (SELECT id FROM location WHERE street="4403 Peach Street")),
                   ((SELECT id FROM restaurant WHERE name="Perkins"), (SELECT id FROM days WHERE day_of_the_week="W"), "07:00:00", "22:00:00", (SELECT id FROM location WHERE street="4403 Peach Street")),
                   ((SELECT id FROM restaurant WHERE name="Perkins"), (SELECT id FROM days WHERE day_of_the_week="TR"), "07:00:00", "22:00:00", (SELECT id FROM location WHERE street="4403 Peach Street")),
                   ((SELECT id FROM restaurant WHERE name="Perkins"), (SELECT id FROM days WHERE day_of_the_week="F"), "07:00:00", "22:00:00", (SELECT id FROM location WHERE street="4403 Peach Street")),
                   ((SELECT id FROM restaurant WHERE name="Perkins"), (SELECT id FROM days WHERE day_of_the_week="SA"), "07:00:00", "22:00:00", (SELECT id FROM location WHERE street="4403 Peach Street")),
                   ((SELECT id FROM restaurant WHERE name="Perkins"), (SELECT id FROM days WHERE day_of_the_week="SU"), "07:00:00", "22:00:00", (SELECT id FROM location WHERE street="4403 Peach Street")),
                   ((SELECT id FROM restaurant WHERE name="Papa Johns"), (SELECT id FROM days WHERE day_of_the_week="M"), "09:45:00", "23:30:00", (SELECT id FROM location WHERE street="1713 E 38th ST")),
                   ((SELECT id FROM restaurant WHERE name="Papa Johns"), (SELECT id FROM days WHERE day_of_the_week="T"), "09:45:00", "23:30:00", (SELECT id FROM location WHERE street="1713 E 38th ST")),
                   ((SELECT id FROM restaurant WHERE name="Papa Johns"), (SELECT id FROM days WHERE day_of_the_week="W"), "09:45:00", "23:30:00", (SELECT id FROM location WHERE street="1713 E 38th ST")),
                   ((SELECT id FROM restaurant WHERE name="Papa Johns"), (SELECT id FROM days WHERE day_of_the_week="TR"), "09:45:00", "23:30:00", (SELECT id FROM location WHERE street="1713 E 38th ST")),
                   ((SELECT id FROM restaurant WHERE name="Papa Johns"), (SELECT id FROM days WHERE day_of_the_week="F"), "09:45:00", "00:30:00", (SELECT id FROM location WHERE street="1713 E 38th ST")),
                   ((SELECT id FROM restaurant WHERE name="Papa Johns"), (SELECT id FROM days WHERE day_of_the_week="SA"), "09:45:00", "00:30:00", (SELECT id FROM location WHERE street="1713 E 38th ST")),
                   ((SELECT id FROM restaurant WHERE name="Papa Johns"), (SELECT id FROM days WHERE day_of_the_week="SU"), "09:45:00", "23:30:00", (SELECT id FROM location WHERE street="1713 E 38th ST")),
                   ((SELECT id FROM restaurant WHERE name="Papa Johns"), (SELECT id FROM days WHERE day_of_the_week="M"), "10:15:00", "00:15:00", (SELECT id FROM location WHERE street="3870 peach St")),
                   ((SELECT id FROM restaurant WHERE name="Papa Johns"), (SELECT id FROM days WHERE day_of_the_week="T"), "10:15:00", "00:15:00", (SELECT id FROM location WHERE street="3870 peach St")),
                   ((SELECT id FROM restaurant WHERE name="Papa Johns"), (SELECT id FROM days WHERE day_of_the_week="W"), "10:15:00", "00:15:00", (SELECT id FROM location WHERE street="3870 peach St")),
                   ((SELECT id FROM restaurant WHERE name="Papa Johns"), (SELECT id FROM days WHERE day_of_the_week="TR"), "10:15:00", "00:15:00", (SELECT id FROM location WHERE street="3870 peach St")),
                   ((SELECT id FROM restaurant WHERE name="Papa Johns"), (SELECT id FROM days WHERE day_of_the_week="F"), "10:15:00", "01:15:00", (SELECT id FROM location WHERE street="3870 peach St")),
                   ((SELECT id FROM restaurant WHERE name="Papa Johns"), (SELECT id FROM days WHERE day_of_the_week="SA"), "10:00:00", "01:15:00", (SELECT id FROM location WHERE street="3870 peach St")),
                   ((SELECT id FROM restaurant WHERE name="Papa Johns"), (SELECT id FROM days WHERE day_of_the_week="SU"), "10:00:00", "23:15:00", (SELECT id FROM location WHERE street="3870 peach St"));