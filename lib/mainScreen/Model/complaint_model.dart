class ComplaintModel {
  String id;
  String title;
  String subject;

  ComplaintModel(
      {required this.id, required this.title, required this.subject});

  Map<String, dynamic> toJson() =>
      {"id": id, "title": title, "subject": subject};

  static fromJson(Map<String, dynamic> json) {
    return ComplaintModel(
        id: json["id"], title: json["title"], subject: json["subject"]);
  }
}
