import 'package:to_do_list2/service/task_service.dart';
import 'package:to_do_list2/service/task.dart';

class AdapterForTheService {
  static TaskService? _service;
  
  AdapterForTheService() {
    if(_service == null) {
      _initialization(TaskService());
    }
  }

  void _initialization(TaskService service) {
    _service = service;
  } 


  List<Task> getListTask() {
      return _service!.getList();
  }

  void toggleStatus(int id) {
    _service!.toggleStatus(id);
  }

  Future<bool> storageReady() {
    return _service!.storageReady();
  }

  void initialization() {
    _service!.initialization();
  }

  void setTitleTask(int id, String title) {
    _service!.setTitleTask(id, title);
  }

  String getTitleTask(int id) {
    return _service!.getTitleTask(id);
  }

  void setTextTask(int id, String text) {
    _service!.setTextTask(id, text);
  }

  String getTextTask(int id) {
    return _service!.getTextTask(id);
  }

  int add(String title, String text) {
    return _service!.add(title, text);
  }

  void deleteTask(int id) {
    _service!.deleteTask(id);
  }
  
  void selectAll() {
    _service!.selectAll();
  }

  void selectCompletedTasks() {
    _service!.selectCompletedTasks();
  }

  void deleteSelectTasks() {
    _service!.deleteSelectTasks();
  }

  int getNumberSelectedItems() {
    return _service!.getNumberSelectedItems();
  }
}