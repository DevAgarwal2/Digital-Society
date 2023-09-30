class EventModel{
  String id;
  String title;
  String subject;

  EventModel({required this.id,required this.title,required this.subject});

  Map<String,dynamic> toJson()=>{
    "id":id,
    "title":title,
    "subject":subject
  };
  static fromJson(Map<String,dynamic> json){
    return EventModel(id: json["id"], title: json["title"], subject: json["subject"]);
  }
}