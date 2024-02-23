import '../models/blog_post.dart';

class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internal();
  factory LocalStorageService() => _instance;
  LocalStorageService._internal();

  final List<BlogPost> _blogPosts = [];

  List<BlogPost> get blogPosts => List.unmodifiable(_blogPosts);

  void addBlogPost(BlogPost blogPost) {
    _blogPosts.add(blogPost);
  }

  void updateBlogPost(BlogPost updatedBlogPost) {
    final index = _blogPosts.indexWhere((post) => post.id == updatedBlogPost.id);
    if (index != -1) {
      _blogPosts[index] = updatedBlogPost;
    }
  }

  void deleteBlogPost(String id) {
    _blogPosts.removeWhere((post) => post.id == id);
  }
}
