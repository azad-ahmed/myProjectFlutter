class BlogPost {
  String id;
  String title;
  String content;
  String author;
  DateTime createdAt;

  BlogPost({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.createdAt,
  });

  factory BlogPost.fromJson(Map<String, dynamic> json) {
    return BlogPost(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      author: json['author'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'author': author,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
