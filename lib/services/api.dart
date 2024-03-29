import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  final _url = 'http://103.161.206.136:1130/';

  var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var test = localStorage.getString('token');

    if (test != null) {
      token = test;
    }

    log("token $token");
  }

  auth(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    log("url $data");
    try {
      return await http.post(Uri.parse(fullUrl),
          body: jsonEncode(data), headers: _setHeaders());
    } catch (e) {
      print(e);
    }
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    await _getToken();
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
}
