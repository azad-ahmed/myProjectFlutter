import 'package:flutter/material.dart';
import 'package:my_project_flutter/theme/pallete.dart';




void main() {
  runApp(MyBlogApp());
}

class MyBlogApp extends StatelessWidget {
  const MyBlogApp({super.key})


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog',
      theme: Pallete.darkModeAppTheme,
      home: const SizedBox(),
    );
  }
}
