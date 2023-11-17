import 'package:my_project_flutter/models/blog_post.dart';

class BlogController {
  // Eine temporäre Liste, um Blog-Beiträge zu speichern
  List<BlogPost> blogPosts = [];

  // Erstellt einen neuen Blog-Beitrag
  void createBlogPost(BlogPost blogPost) {
    blogPosts.add(blogPost);
    // Fügen Sie hier Ihren Code hinzu, um den Beitrag in Ihrem Backend zu speichern
  }

  // Aktualisiert einen vorhandenen Blog-Beitrag
  void updateBlogPost(String id, BlogPost updatedBlogPost) {
    final index = blogPosts.indexWhere((post) => post.id == id);
    if (index != -1) {
      blogPosts[index] = updatedBlogPost;
      // Fügen Sie hier Ihren Code hinzu, um den Beitrag in Ihrem Backend zu aktualisieren
    }
  }

  // Löscht einen Blog-Beitrag
  void deleteBlogPost(String id) {
    blogPosts.removeWhere((post) => post.id == id);
    // Fügen Sie hier Ihren Code hinzu, um den Beitrag in Ihrem Backend zu löschen
  }

  // Ruft alle Blog-Beiträge ab
  List<BlogPost> getAllBlogPosts() {
    // Fügen Sie hier Ihren Code hinzu, um die Beiträge von Ihrem Backend abzurufen
    return blogPosts;
  }

  // Ruft einen spezifischen Blog-Beitrag ab oder gibt null zurück, wenn er nicht gefunden wird
 // BlogPost? getBlogPostById(String id) {
   // return blogPosts.firstWhere((post) => post.id == id, orElse: () => null);
  //}
}
