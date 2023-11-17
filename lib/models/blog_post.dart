class BlogPost {
  final String id;
  final String title;
  final String content;
  final String author;
  final DateTime time;
  int likes;
  List<String> comments;

  BlogPost({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.time,
    this.likes = 0,
    this.comments = const [],
  });

  factory BlogPost.fromJson(Map<String, dynamic> json) {
    return BlogPost(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      author: json['author'],
      time: DateTime.parse(json['time']),
      likes: json['likes'] ?? 0,
      comments: List<String>.from(json['comments'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'author': author,
      'time': time.toIso8601String(),
      'likes': likes,
      'comments': comments,
    };
  }

  void likePost() {
    likes++;
  }

  void addComment(String comment) {
    comments.add(comment);
  }
}
