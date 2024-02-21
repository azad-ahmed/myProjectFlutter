import 'package:flutter/material.dart';
import 'package:my_project_flutter/theme/pallete.dart';
import 'features/auth/screens/login_screen.dart';




void main() {
  runApp(MyBlogApp());
}

class MyBlogApp extends StatelessWidget {
  const MyBlogApp({super.key})


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog',
      theme: Pallete.darkModeAppTheme,
      home: const LoginScreen(),
    );
  }
}
