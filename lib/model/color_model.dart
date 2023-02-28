class TodoModel {
  TodoModel({
    this.title,
    this.subtitle,
    this.isHighPriority,
    this.date,
  });

  TodoModel.fromJson(dynamic json) {
    title = json['title'];
    subtitle = json['subtitle'];
    isHighPriority = json['isHighPriority'];
    date = json['date'];
  }
  String? title;
  String? subtitle;
  bool? isHighPriority;
  DateTime? date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['subtitle'] = subtitle;
    map['isHighPriority'] = isHighPriority;
    map['date'] = date;
    return map;
  }
}
