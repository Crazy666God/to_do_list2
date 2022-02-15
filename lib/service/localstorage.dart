import 'package:localstorage/localstorage.dart';
import 'package:to_do_list2/service/task.dart';

class ServiceLocalStorage {
  final LocalStorage _storage = LocalStorage('ToDoList');
  final List<Task> _listTasks = [];

  bool initialization() {
    var items = _storage.getItem('ListTask');

    if (items != null) {
      List<dynamic> ls = items as List;
      for (Map<String, dynamic> map in ls) {
        _listTasks.add(Task(map['title'], map['text'], map['status']));
      }
      return true;
    }
    return false;
  }

  Future<bool> storageReady() {
    return _storage.ready;
  }

  void saveStorage(List<Task> list) async {
    await _storage.setItem('ListTask', listToJSONEncodable(list));
  }

  List<dynamic> listToJSONEncodable(List<Task> list) {
    return list.map((task) {
      return taskToJSONEncodable(task);
    }).toList();
  }

  Map<String, dynamic> taskToJSONEncodable(Task task) {
    Map<String, dynamic> map = {};
    map['title'] = task.title;
    map['text'] = task.text;
    map['status'] = task.status;
    return map;
  }

  List<Task> getList() {
    return _listTasks;
  }
}
