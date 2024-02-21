import 'package:flutter/material.dart';
import 'package:my_project_flutter/constants/global_variables.dart';
import 'package:my_project_flutter/router.dart';
import 'features/auth/screens/auth_screen.dart';


void main() {
  runApp(MyBlogApp());
}

class MyBlogApp extends StatelessWidget {
  const MyBlogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog Post',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const AuthScreen()
    );
  }
}
