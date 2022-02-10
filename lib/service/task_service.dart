import 'package:to_do_list2/service/localstorage.dart';

import 'task.dart';

class TaskService {
  final List<Task> _listTasks = [];
  final ServiceLocalStorage _serviceLocalStorage = ServiceLocalStorage();

  TaskService();

  void initialization() {
    if (_serviceLocalStorage.initialization()) {
      List<Task> list = _serviceLocalStorage.getList();
      if (list.isNotEmpty) {
        _listTasks.addAll(list);
      }
    }
  }

  Future<bool> storageReady() {
    return _serviceLocalStorage.storageReady();
  }

  int add(String title, String text) {
    Task task = Task(title, text);
    final int id = task.id;
    _listTasks.add(task);
    _serviceLocalStorage.saveStorage(_listTasks);
    return id;
  }

  void toggleStatus(int id) {
    for (Task task in _listTasks) {
      if (task.id == id) {
        task.status = !task.status;
        _serviceLocalStorage.saveStorage(_listTasks);
        break;
      }
    }
  }

  List<Task> getList() {
    return _listTasks;
  }

  void setTitleTask(int id, String title) {
    for (Task task in _listTasks) {
      if (task.id == id) {
        task.title = title;
        _serviceLocalStorage.saveStorage(_listTasks);
        break;
      }
    }
  }

  void setTextTask(int id, String text) {
    for (Task task in _listTasks) {
      if (task.id == id) {
        task.text = text;
        _serviceLocalStorage.saveStorage(_listTasks);
        break;
      }
    }
  }

  void deleteTask(int id) {
    for (Task task in _listTasks) {
      if (task.id == id) {
        _listTasks.remove(task);
        _serviceLocalStorage.saveStorage(_listTasks);
        break;
      }
    }
  }

  String getTitleTask(int id) {
    String resul = '';
    for (Task task in _listTasks) {
      if (task.id == id) {
        resul = task.title;
        return resul;
      }
    }
    return resul;
  }

  String getTextTask(int id) {
    String resul = '';
    for (Task task in _listTasks) {
      if (task.id == id) {
        resul = task.text;
        return resul;
      }
    }
    return resul;
  }

  int getNumberSelectedItems() {
    int counter = 0;
    for (Task task in _listTasks) {
      if (task.flag == true) {
        ++counter;
      }
    }
    return counter;
  }

  void selectCompletedTask() {
    int counter = 0;
    for (Task task in _listTasks) {
      if (task.status && !task.flag) {
        task.flag = true;
        ++counter;
      }
    }
    if (counter == 0) {
      for (Task task in _listTasks) {
        if (task.status) {
          task.flag = !task.flag;
        }
      }
    }
  }

  void deleteSelectTasks() {
    for (int i = 0; i < _listTasks.length; ++i) {
      if (_listTasks[i].flag) {
        _listTasks.removeAt(i);
        --i;
      }
    }
    _serviceLocalStorage.saveStorage(_listTasks);
  }

  void selectAll() {
    int counter = 0;
    for (Task task in _listTasks) {
      if (!task.flag) {
        task.flag = true;
        ++counter;
      }
    }
    if (counter == 0) {
      for (Task task in _listTasks) {
        task.flag = !task.flag;
      }
    }
  }
}
