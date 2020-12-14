
CREATE DATABASE restaurantinformation;

use restaurantinformation;

CREATE TABLE restaurant (id INT NOT NULL KEY AUTO_INCREMENT,
						 name varchar(50));

CREATE TABLE restaurant_type (id INT NOT NULL KEY AUTO_INCREMENT,
							  restaurant_type VARCHAR(25));

CREATE TABLE days (id INT NOT NULL KEY AUTO_INCREMENT,
				   day_of_the_week VARCHAR(2));

CREATE TABLE location (id INT NOT NULL KEY auto_increment,
                       restaurant_ID INT,
                       FOREIGN KEY (restaurant_ID)
                       				REFERENCES restaurant(id),
                       street VARCHAR(40),
                       city VARCHAR(25),
                       state VARCHAR(2),
                       zip INT);
                       
CREATE TABLE operating_hours (id INT NOT NULL KEY AUTO_INCREMENT,
							  restaurant_ID INT, 
								FOREIGN KEY (restaurant_ID)
									REFERENCES restaurant(id),
							  day_open_ID INT,
								FOREIGN KEY (day_open_ID)
									REFERENCES days(id),
							  location_ID INT,
								FOREIGN KEY (location_ID)
									REFERENCES location(id),
							  start_time TIME,
                              end_time TIME);
                         
CREATE TABLE contact_method (id INT NOT NULL KEY auto_increment, 
							 typeOfContact VARCHAR(5),
                             restaurant_ID INT, 
								FOREIGN KEY (restaurant_ID)
									REFERENCES restaurant(id),
							  location_ID INT,
								FOREIGN KEY (location_ID)
									REFERENCES location(id));
                                    
CREATE TABLE dinning_options(id INT NOT NULL KEY auto_increment,
							 restaurant_ID INT, 
								FOREIGN KEY (restaurant_ID)
                       				REFERENCES restaurant(id),
							 access_method VARCHAR(15));
                                    


