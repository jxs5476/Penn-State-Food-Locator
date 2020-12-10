# THE CONTROL
import Model


class Controller:

    def __init__(self, search_text, search_type):
        self.search_text = search_text
        self.search_type = search_type
        return

    def get_user_search(self, query_dictionary):
        return self.send_model_info(query_dictionary)

    def send_model_info(self, query_dictionary):
        model = Model(self.search_text, self.search_type)
        return model.query_database(query_dictionary)


