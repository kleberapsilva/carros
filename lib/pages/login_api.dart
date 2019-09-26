import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginApi {
  static Future<bool> login(String login, String senha) async {
    var url = 'http://carros-springboot.herokuapp.com/api/v2/login';

    Map params = {
      "username": login,
      "password" : senha
    };

    Map<String, String> headers = {
      'Content-Type' : 'application/json'
    };
    String s = json.encode(params);

    var response = await http.post(url, body: s, headers: headers);

    Map mapResponse = json.decode(response.body);
    String nome = mapResponse['nome'];
    String email = mapResponse['email'];

    print('Nome: $nome');
    print('Email: $email');

    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    return true;
  }
}