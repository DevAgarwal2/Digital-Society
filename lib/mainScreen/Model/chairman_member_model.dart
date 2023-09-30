class PartipantModel {
  String id;
  String name;
  String email;

  PartipantModel({required this.id, required this.name, required this.email});

  Map<String, dynamic> toJson() => {"id": id, "name": name, "email": email};
  static fromJson(Map<String, dynamic> json) {
    return PartipantModel(
        id: json["id"], name: json["name"], email: json["email"]);
  }
}
