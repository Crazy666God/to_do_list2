import 'package:to_do_list2/tasks/task.dart';

class TemporaryTask {
  static Task _temporaryTask = Task();

  void setTextTemporaryTask(String str) {
    _temporaryTask.setText(str);
  }

  void setTitleTemporaryTask(String str) {
    _temporaryTask.setTitle(str);
  }

  String getTitleTemporaryTask() {
    return _temporaryTask.getTitle();
  }

  String getTextTemporaryTask() {
    return _temporaryTask.getText();
  }

  void clearTemporaryTask() {
    _temporaryTask.setText('');
    _temporaryTask.setTitle('');
  }

  Task getTemporaryTask() {
    return _temporaryTask;
  }
}
