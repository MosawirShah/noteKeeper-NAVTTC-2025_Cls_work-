class NoteModel {
  int? id;
  String title;
  int priority;
  String description;

  NoteModel({
    this.id,
    required this.priority,
    required this.title,
    required this.description,
  });

  factory NoteModel.fromMapObj(Map<String, dynamic> mapObj) {
    return NoteModel(
      id: mapObj['id'],
      priority: mapObj['priority'],
      title: mapObj['title'],
      description: mapObj['description'],
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'title' : title,
      'priority': priority,
      'description': description
    };
  }
}
