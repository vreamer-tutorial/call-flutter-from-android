import 'dart:async';

class DataService {
  StreamController<String> ideaController;

  static final DataService instance = DataService._init();
  DataService._init() {
    ideaController = StreamController();
  }

  addIdea(String newIdea) {
    ideaController.add(newIdea);
  }
}
