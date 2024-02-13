class BlogPost {
  String id;
  String title;
  String content;
  String author;
  DateTime createdAt;
  int likes; // Hinzugefügte Eigenschaft für Likes

  BlogPost({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.createdAt,
    this.likes = 0, // Initialwert für Likes
  });

  // Methode zum Erhöhen der Likes
  void like() {
    likes++;
  }
}
