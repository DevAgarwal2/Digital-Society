class Notice {
  String id;
  String title;
  String notice;
  Notice({required this.id, required this.title, required this.notice});

  Map<String, dynamic> toJson() => {"id": id, "title": title, "notice": notice};
  static fromJson(Map<String, dynamic> json) {
    return Notice(id: json["id"], title: json["title"], notice: json["notice"]);
  }
}
