import 'package:flutter/material.dart';
import 'package:my_project_flutter/constants/global_variables.dart';





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
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black)
        )
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
              'Blog Post'
          ),
        ),
        body: const Center(
            child: Text(
                'Blog Post'
            )
        ),
      ),
    );
  }
}
