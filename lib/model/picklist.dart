import 'package:flutter/widgets.dart';

class Picklist {
  Picklist(
      {required this.id,
      required this.orderNumber,
      required this.countArticle,
      required this.sumQty,
      required this.countCategory,
      required this.priority});

  int id;
  String orderNumber;
  int countArticle;
  int sumQty;
  int countCategory;
  int priority;

  factory Picklist.fromMap(Map<String, dynamic> json) => Picklist(
      id: json['id'],
      orderNumber: json['order_number'],
      countArticle: json['count_article'],
      sumQty: json['sum_qty'],
      countCategory: json['count_category'],
      priority: json['priority']);
}

class Article {
  Article({required this.id, required this.articleName, required this.sizes});

  int id;
  String articleName;
  String sizes;

  factory Article.fromMap(Map<String, dynamic> json) => Article(
      id: json['id'], articleName: json['article_name'], sizes: json['sizes']);
}
