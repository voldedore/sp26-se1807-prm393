class Note {
  final int? id;
  final String title;
  final String content;

  Note({this.id, required this.title, required this.content});

  /*
  [{
    id: 9,
    title: 'First note',
    content: 'This is the content'
  },
  {
    id: 10,
    title: '2nd note',
    content: 'This is the content of the 2nd note'
  }]
  * */

  // 1. Localstorage (string) -> thư viên convert -> JSON -> object fromJSON
  factory Note.fromJson(Map<String, dynamic> json) {
    // named constructor
    return Note(
      id: json['id'],
      title: json['title'],
      content: json['content']
    );
  }

  // 2. object -> JSON -> thư viện convert để -> string -> LocalStorage toJSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'content': content};
  }
}
