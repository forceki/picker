import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:picker/model/dashboard.dart';
import 'package:picker/model/picklist.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QueueAPI {
  final _url = 'http://103.161.206.136:1130/';
  //final _url = 'http://192.168.0.108:3000/';
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

      return ArticleDetail.fromJson(parsed);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<ArticleDetail> getOngoing(apiUrl) async {
    var fullUrl = _url + apiUrl;
    final response = await http
        .get(
      Uri.parse(fullUrl),
      headers: _setHeaders(),
    )
        .timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(jsonEncode({"message": "not connection "}),
            408); // Request Timeout response status code
      },
    );

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      print(parsed);

      final anu = parsed['data'];
      print(anu.length);

      return ArticleDetail.fromJson(parsed);
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
      return TotalDetail.fromJson(anu['data']);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future checkBarcode(apiUrl, data) async {
    var fullUrl = _url + apiUrl;

    final response = await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());

    print(response.statusCode);
    var parse = json.decode(response.body);
    if (response.statusCode == 201) {
      return parse;
    } else {
      return parse;
    }
  }

  Future updateStatus(apiUrl, data) async {
    var fullUrl = _url + apiUrl;

    final response = await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());

    var parse = json.decode(response.body);

    if (response.statusCode == 201) {
      return parse;
    } else {
      return parse;
    }
  }

  Future updateStatusOngoing(apiUrl, data) async {
    var fullUrl = _url + apiUrl;

    final response = await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());

    var parse = json.decode(response.body);

    if (response.statusCode == 201) {
      return parse;
    } else {
      return parse;
    }
  }

  Future<Dashboard> dashboard(apiUrl) async {
    var fullUrl = _url + apiUrl;

    final response = await http.get(
      Uri.parse(fullUrl),
      headers: _setHeaders(),
    );

    if (response.statusCode == 200) {
      var anu = jsonDecode(response.body);
      print(anu);
      return Dashboard.fromJson(anu['data']);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
