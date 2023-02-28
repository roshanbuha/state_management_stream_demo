class TodoModel {
  TodoModel({
    this.count,
    this.color,
  });

  TodoModel.fromJson(dynamic json) {
    count = json['count'];
    color = json['color'];
  }
  String? count;
  List? color;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['color'] = color;
    return map;
  }
}
