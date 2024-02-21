class BlogPost {
  String id;
  String title;
  String content;
  String author;
  DateTime createdAt;
  int likes;

  BlogPost({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.createdAt,
    this.likes = 0,
  });


  void like() {
    likes++;
  }
}
