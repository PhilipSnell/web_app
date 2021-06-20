import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_app/api/model/api_model.dart';

final _base = "https://xcellfitness.herokuapp.com";
final _tokenEndpoint = "/api-token-auth/";
final _register = "/register/";

final _tokenURL = _base + _tokenEndpoint;
final _registerURL = _base + _register;


Future<Token> getToken(UserLogin userLogin) async {
  print(_tokenURL);
  final http.Response response = await http.post(
    _tokenURL,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userLogin.toDatabaseJson()),
  );
  if (response.statusCode == 200) {
    return Token.fromJson(json.decode(response.body));
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

Future<bool> createUser(UserSignup userSignup) async {
  print(_registerURL);
  final http.Response response = await http.post(
    _registerURL,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userSignup.toDatabaseJson()),
  );
  if (response.statusCode == 200) {
    Map<String, Object> data = json.decode(response.body);
    if (data.containsKey("response")){
      return true;
    }
    else{
      print(data);
      throw Exception(data);
    }
    return true;
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}
