class Task {
  static int globalId = 0;
  String title, text;
  bool status = false;
  late final int id;
  bool flag = false;

  Task(this.title, this.text) {
    ++globalId;
    id = globalId;
  }

  Task.initialization(this.title, this.text, this.status, this.id);

  void initializationId(int id) {
    globalId = id;
  }

  toJSONEncodable() {
    var map = <String, dynamic>{};
    map['title'] = title;
    map['text'] = text;
    map['status'] = status;
    map['id'] = id;
    return map;
  }

}