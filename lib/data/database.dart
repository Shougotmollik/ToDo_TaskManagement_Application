import 'package:hive_flutter/hive_flutter.dart';

class toDoDatabase {
  // refrences the box
  //final _myBox = Hive.box("ToDO List");

  List toDoList = [];
// Show this first ever install or open the in device
  void createInitialData() {
    toDoList = [
      ["Hey Welcome !!!", false],
      ["Add Your New Task !!!", false]
    ];
  }

  // load the data
  void loadData() {
    //toDoList = _myBox.get("ToDo List");

    // Update the database
    void updateDatabase() {
      //_myBox.put("ToDo List", toDoList);
    }
  }
}
