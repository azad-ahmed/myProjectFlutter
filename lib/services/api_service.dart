import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:my_project_flutter/models/blog_post.dart';

class ApiService {
  final String baseUrl = 'http://hftm.ch';

  get http => null; // Ersetzen dies durch die API-URL

  // Ruft alle Blog-Beiträge ab
  Future<List<BlogPost>> fetchBlogPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/blogposts'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<BlogPost> blogPosts = body
          .map((dynamic item) => BlogPost.fromJson(item))
          .toList();
      return blogPosts;
    } else {
      throw Exception('Failed to load blog posts');
    }
  }

  // Erstellt einen neuen Blog-Beitrag
  Future<BlogPost> createBlogPost(BlogPost blogPost) async {
    final response = await http.post(
      Uri.parse('$baseUrl/blogposts'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(blogPost.toJson()),
    );

    if (response.statusCode == 201) {
      return BlogPost.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create blog post');
    }
  }

  // Aktualisiert einen vorhandenen Blog-Beitrag
  Future<BlogPost> updateBlogPost(String id, BlogPost blogPost) async {
    final response = await http.put(
      Uri.parse('$baseUrl/blogposts/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(blogPost.toJson()),
    );

    if (response.statusCode == 200) {
      return BlogPost.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update blog post');
    }
  }

  // Löscht einen Blog-Beitrag
  Future<void> deleteBlogPost(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/blogposts/$id'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete blog post');
    }
  }
}
