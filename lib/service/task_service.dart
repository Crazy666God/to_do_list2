import 'dart:async';
import 'package:to_do_list2/service/localstorage.dart';
import 'package:to_do_list2/tasks/task.dart';

class TaskService {
  final List<Task> _listTasks = [];
  final ServiceLocalStorage _serviceLocalStorage = ServiceLocalStorage();

  TaskService() {
    _controllerListTasks.sink.add(_listTasks);
  }

  final StreamController<List<Task>> _controllerListTasks =
      StreamController<List<Task>>();

  Stream<List<Task>> get streamListTask => _controllerListTasks.stream;
  Stream<List<Task>> get streamListTasks => _streamListTasks;
  late final Stream<List<Task>> _streamListTasks =
      streamListTask.asBroadcastStream();

  void updateStream() {
    _controllerListTasks.sink.add(_listTasks);
  }

  void dispose() {
    _controllerListTasks.close();
  }

  void initialization() async {
    await _serviceLocalStorage.storageReady();
    if (_serviceLocalStorage.initialization()) {
      List<Task> list = _serviceLocalStorage.getList();
      if (list.isNotEmpty) {
        for (int i = 0; i < list.length; ++i) {
          _listTasks.add(list[i]);
        }
        _controllerListTasks.sink.add(_listTasks);
      }
    }
  }

  int addTask(String title, String text) {
    Task task = Task(title, text);
    final int id = task.getId();
    _listTasks.add(task);
    _serviceLocalStorage.saveStorage(_listTasks);
    return id;
  }

  void toggleStatus(int id) {
    for (Task task in _listTasks) {
      if (task.getId() == id) {
        task.toggleStatus();
        _serviceLocalStorage.saveStorage(_listTasks);
        updateStream();
        break;
      }
    }
  }

  void setTitleTask(int id, String title) {
    for (Task task in _listTasks) {
      if (task.getId() == id) {
        task.setTitle(title);
        _serviceLocalStorage.saveStorage(_listTasks);
        break;
      }
    }
  }

  void setTextTask(int id, String text) {
    for (Task task in _listTasks) {
      if (task.getId() == id) {
        task.setText(text);
        _serviceLocalStorage.saveStorage(_listTasks);
        break;
      }
    }
  }

  void deleteTask(int id) {
    for (Task task in _listTasks) {
      if (task.getId() == id) {
        _listTasks.remove(task);
        _serviceLocalStorage.saveStorage(_listTasks);
        break;
      }
    }
  }

  String getTitleTask(int id) {
    String resul = '';
    for (Task task in _listTasks) {
      if (task.getId() == id) {
        resul = task.getTitle();
        return resul;
      }
    }
    return resul;
  }

  String getTextTask(int id) {
    String result = '';
    for (Task task in _listTasks) {
      if (task.getId() == id) {
        result = task.getText();
        return result;
      }
    }
    return result;
  }
}
