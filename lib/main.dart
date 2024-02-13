import 'package:flutter/material.dart';
import 'package:my_project_flutter/views/blog_list_page.dart';


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
