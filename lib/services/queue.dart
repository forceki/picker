import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:picker/model/picklist.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QueueAPI {
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

  Future<TotalDetail> getPicklist(apiUrl, status) async {
    var fullUrl = _url + apiUrl;
    final response = await http.get(
        Uri.parse(fullUrl).replace(query: 'status=$status'),
        headers: _setHeaders());

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      final anu = parsed['data'];
      print(anu);
      return TotalDetail.fromJson(anu);
    } else {
      throw Exception('Failed to load album');
    }
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

  Future<ArticleDetail> getArticle(apiUrl, picklist) async {
    var fullUrl = _url + apiUrl;
    final response = await http.get(
      Uri.parse(fullUrl).replace(query: 'picklist=$picklist'),
      headers: _setHeaders(),
    );

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);

      final anu = parsed['data'];

      return ArticleDetail.fromJson(anu);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<ArticleDetail> getOngoing(apiUrl) async {
    var fullUrl = _url + apiUrl;
    final response = await http.get(
      Uri.parse(fullUrl),
      headers: _setHeaders(),
    );

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);

      final anu = parsed['data'];

      return ArticleDetail.fromJson(anu);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<TotalDetail> getTotal(apiUrl, status) async {
    var fullUrl = _url + apiUrl;

    final response = await http.get(
      Uri.parse(fullUrl).replace(query: 'status=$status'),
      headers: _setHeaders(),
    );

    if (response.statusCode == 200) {
      var anu = jsonDecode(response.body);
      print(anu);
      return TotalDetail.fromJson(anu['data']);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
