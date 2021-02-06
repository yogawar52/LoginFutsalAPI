import 'package:http/http.dart' as http;
import 'http_exception.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';

class Authentication with ChangeNotifier {
  Future<void> signUp(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBf4CNr0QHqDIB9uGEwliq6mOI2EoN6izQ';

    try {
      final response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      final responseData = json.decode(response.body);
      //  print(responseData);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['massage']);
      }
    } catch (error) {
      throw error;
    }
  }

  logIn(String authData, String authData2) {}
}

Future<void> logIn(String email, String password) async {
  const url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBf4CNr0QHqDIB9uGEwliq6mOI2EoN6izQ';
  try {
    final response = await http.post(url,
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }));
    final responseData = json.decode(response.body);
    if (responseData['error'] != null) {
      throw HttpException(responseData['error']['message']);
    }
  } catch (error) {
    throw error;
  }
}
