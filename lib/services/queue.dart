import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:picker/model/picklist.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QueueAPI {
  final _url = 'http://192.168.0.108:3000/';

  var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var test = localStorage.getString('token');

    if (test != null) {
      token = test;
    }

    log("token $token");
  }

  Future<List<Picklist>> getPicklist(apiUrl) async {
    var fullUrl = _url + apiUrl;
    final response = await http.get(Uri.parse(fullUrl), headers: _setHeaders());

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      final anu = parsed['data'].cast<Map<String, dynamic>>();
      return anu.map<Picklist>((json) => Picklist.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

  Future<List<Article>> getArticle(apiUrl, orderNumber) async {
    var fullUrl = _url + apiUrl;
    final response = await http.get(
      Uri.parse(fullUrl).replace(query: 'order_number=$orderNumber'),
      headers: _setHeaders(),
    );

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);

      final anu = parsed['data'].cast<Map<String, dynamic>>();
      print(anu);

      return anu.map<Article>((json) => Article.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
