import 'task.dart';

class TaskService {
  final List<Task> _listTasks = [];
  
  TaskService(); //написать localstorage

/*  TaskService.test() {
    _listTasks.add(Task(
        'Task1 task1 task1task1taskq prigi gdsgdsg ds regk erjv krjbkb lkjsf rbk ;sjb ;kfd b s;dgkjnjdngjiengjne',
        'text1 text1'));
    _listTasks.add(Task('task2', 'text2 text2 text2 text2 text2'));
    _listTasks.add(Task('task3', 'text3 text3 text3 text3'));
    _listTasks.add(Task('task4', 'text4 text4'));
    _listTasks.add(Task('task5', 'text5 text5 text5 text5 text5 text5'));
    _listTasks.add(Task('task6', 'text6 text6'));
    _listTasks.add(Task('task7', 'text7 text7'));
    _listTasks
        .add(Task('task8', 'text8 text8 text8 text8 text8 text8 text8 text8'));
    _listTasks.add(Task('task9', 'text9 text9'));
    _listTasks.add(Task('task10', 'text10'));
    _listTasks.add(Task('task11', 'text11'));
    for (int i = 1; i <= 10; i += 2) {
      toggleStatus(i);
    }
  }*/

  toJSONEncodable() {
    return _listTasks.map((task) {
      return task.toJSONEncodable();
    }).toList();
  }

  int add(String title, String text) {
    Task task = Task(title, text);
    final int id = task.id;
    _listTasks.add(task);
    return id;
  }

  void toggleStatus(int id) {
    for (Task task in _listTasks) {
      if (task.id == id) {
        task.status = !task.status;
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
        break;
      }
    }
  }

  void setTextTask(int id, String text) {
    for (Task task in _listTasks) {
      if (task.id == id) {
        task.text = text;
        break;
      }
    }
  }

  void deleteTask(int id) {
    for (Task task in _listTasks) {
      if (task.id == id) {
        _listTasks.remove(task);
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
