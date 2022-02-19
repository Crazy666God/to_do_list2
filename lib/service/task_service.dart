import 'package:to_do_list2/service/localstorage.dart';
import 'task.dart';

class TaskService {
  final List<Task> _listTasks = [];
  final ServiceLocalStorage _serviceLocalStorage = ServiceLocalStorage();

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
        break;
      }
    }
  }

  List<Task> getListTask() {
    return _listTasks;
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
    String resul = '';
    for (Task task in _listTasks) {
      if (task.getId() == id) {
        resul = task.getText();
        return resul;
      }
    }
    return resul;
  }

  int getNumberSelectedItems() {
    int counter = 0;
    for (Task task in _listTasks) {
      if (task.getSelected() == true) {
        ++counter;
      }
    }
    return counter;
  }

  void selectCompletedTasks() {
    int counter = 0;
    for (Task task in _listTasks) {
      if (task.getStatus() && !task.getSelected()) {
        task.toggleSelected();
        ++counter;
      }
    }
    if (counter == 0) {
      for (Task task in _listTasks) {
        if (task.getStatus()) {
          task.toggleSelected();
        }
      }
    }
  }

  void deleteSelectTasks() {
    for (int i = 0; i < _listTasks.length; ++i) {
      if (_listTasks[i].getSelected()) {
        _listTasks.removeAt(i);
        --i;
      }
    }
    _serviceLocalStorage.saveStorage(_listTasks);
  }

  void selectAll() {
    int counter = 0;
    for (Task task in _listTasks) {
      if (!task.getSelected()) {
        task.toggleSelected();
        ++counter;
      }
    }
    if (counter == 0) {
      for (Task task in _listTasks) {
        task.toggleSelected();
      }
    }
  }
}
