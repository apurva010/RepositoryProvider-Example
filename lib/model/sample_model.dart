class SampleModel {
  int? id;
  int? userId;
  String? title;
  bool? isCompleted;

  SampleModel({this.id, this.userId, this.title, this.isCompleted});

  SampleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
    isCompleted = json['completed'];
  }
}
