class Task {
  static int globalId = 0;
  String _title, _text;
  bool _status;
  late final int _id;
  bool _selected = false;

  Task([this._title = '', this._text = '', this._status = false]) {
    ++globalId;
    _id = globalId;
  }

  int getId() => _id; 
  bool getStatus() => _status;
  bool getSelected() => _selected;
  String getTitle() => _title;
  String getText() => _text;

  void setTitle(String title) {
    _title = title;
  }
  void setText(String text) {
    _text = text;
  }

  void toggleStatus() {
    _status = !_status;
  }

  void toggleSelected() {
    _selected = !_selected;
  }
}