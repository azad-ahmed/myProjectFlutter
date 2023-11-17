import 'package:flutter/material.dart';
import 'package:my_project_flutter/views/blog_list.dart';
import 'package:my_project_flutter/views/create_blog.dart';
import 'package:my_project_flutter/controllers/blog_controller.dart';
import 'package:my_project_flutter/services/api_service.dart';

void main() {
  runApp(MyBlogApp());
}

class MyBlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mein Blog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlogListPage(),
    );
  }
}

class BlogListPage extends StatelessWidget {
  final BlogController blogController = BlogController();
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog-Beiträge'),
      ),
      body: BlogList(), // Stellen Sie sicher, dass BlogList die notwendigen Daten lädt
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateBlog()),
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Neuen Blog-Beitrag erstellen',
      ),
    );
  }
}
