# THE CONTROL
from Model import Model


class Controller:

    def __init__(self):
        self.search_text = 0
        self.search_type = 0
        return

    def get_user_search(self, query_dictionary):
        return self.send_model_info(query_dictionary)

    def send_model_info(self, query_dictionary):
        model = Model(search_type=query_dictionary["Type"], search_text=query_dictionary["Query"])
        return model.query_database(query_dictionary)

