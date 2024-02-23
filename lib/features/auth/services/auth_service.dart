import  'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:my_project_flutter/Providers/user_provider.dart';
import 'package:my_project_flutter/constants/error_handling.dart';
import 'package:my_project_flutter/constants/global_variables.dart';
import 'package:my_project_flutter/constants/utils.dart';
import 'package:my_project_flutter/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthService{
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
}) async {
    try {
        User user = User(
          id: '',
          name: name,
          password: password,
          email: email,
          address: '',
          type: '',
          token: '',
          cart: [],
        );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Account crated! Login with the same credentials!',
          );
        },
      );
    }catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      print(res.body);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['tocken']);

        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}