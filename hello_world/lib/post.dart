class Post {
  int userID;
  int id;
  String title;
  String body;

  Post(this.userID, this.id, this.title, this.body);

  // displayInf
  void displayInfo() {
    print("UserId: $userID, id: $id, title: $title, body: $body");
  }

  // Named constructor
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(json['userId'], json['id'], json['title'], json['bpdy']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userID,
      'title': title,
      'body': body
    };
  }
}
