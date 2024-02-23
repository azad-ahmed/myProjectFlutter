import 'package:flutter/material.dart';
import 'package:my_project_flutter/Providers/user_provider.dart';
import 'package:my_project_flutter/common/widgets/bottom_bar.dart';
import 'package:my_project_flutter/constants/global_variables.dart';
import 'package:my_project_flutter/features/auth/services/auth_service.dart';
import 'package:my_project_flutter/router.dart';
import 'package:provider/provider.dart';
import 'features/auth/screens/auth_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: MyBlogApp()));
}

class MyBlogApp extends StatefulWidget {
  const MyBlogApp({Key? key}) : super(key: key);

  @override
  State<MyBlogApp> createState() => _MyBlogAppState();
}

class _MyBlogAppState extends State<MyBlogApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

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
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
              ? const BottomBar()
              : const AuthScreen()
          : const AuthScreen(),
    );
  }
}