class Task {
  static int globalId = 0;
  String title, text;
  bool status;
  late final int id;
  bool flag = false;

  Task([this.title = '', this.text = '', this.status = false]) {
    ++globalId;
    id = globalId;
  }
/*
  Task.initialization(this.title, this.text, this.status) {
    ++globalId;
    id = globalId;
  }*/

  //void initializationId(int id) {
    //globalId = id;
  //}
/*
  toJSONEncodable() {
    var map = <String, dynamic>{};
    map['title'] = title;
    map['text'] = text;
    map['status'] = status;
    map['id'] = id;
    return map;
  }*/

}