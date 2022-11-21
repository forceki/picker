import 'dart:ffi';

import 'package:flutter/widgets.dart';

class Picklist {
  Picklist({
    required this.totalPicklist,
    required this.picklist,
    required this.qty,
    required this.dateTrans,
  });

  String totalPicklist;
  String picklist;
  String qty;
  String dateTrans;

  factory Picklist.fromJson(Map<String, dynamic> json) => Picklist(
      totalPicklist: json['total_picklist'],
      picklist: json['picklist'],
      qty: json['qty'],
      dateTrans: json['date_trans']);
}

class TotalDetail {
  TotalDetail(
      {required this.totalArticle,
      required this.totalPicklist,
      required this.totalqty,
      required this.details});

  int totalArticle;
  int totalPicklist;
  int totalqty;
  List<Picklist> details;

  factory TotalDetail.fromJson(Map<String, dynamic> json) {
    var details = json['details'] as List;
    List<Picklist> _details = details.map((e) => Picklist.fromJson(e)).toList();

    print(_details);
    return TotalDetail(
        totalArticle: json['total_article'],
        totalPicklist: json['total_picklist'],
        totalqty: json['total_qty'],
        details: _details);
  }
}

class Article {
  Article(
      {required this.id,
      required this.dateTrans,
      required this.orderNumber,
      required this.picklist,
      required this.articleCode,
      required this.articleName,
      required this.brandName,
      required this.categoryName,
      required this.typeName,
      required this.colourName,
      required this.sex,
      required this.barcode,
      required this.sizes,
      required this.rackNumber,
      required this.qty,
      required this.status_picked});

  int id;
  String dateTrans;
  String orderNumber;
  String picklist;
  String articleCode;
  String articleName;
  String brandName;
  String categoryName;
  String typeName;
  String colourName;
  String sex;
  String barcode;
  String sizes;
  String rackNumber;
  int qty;
  bool status_picked;

  factory Article.formJson(Map<String, dynamic> json) => Article(
      id: json['id'],
      dateTrans: json['date_trans'],
      orderNumber: json['order_number'],
      picklist: json['picklist'],
      articleCode: json['articlecode'],
      articleName: json['articlename'],
      brandName: json['brandname'],
      categoryName: json['categoryname'],
      typeName: json['typename'],
      colourName: json['colourname'],
      sex: json['sex'],
      barcode: json['barcode'],
      sizes: json['sizes'],
      qty: json['qty'],
      rackNumber: json['rack_number'],
      status_picked: json['status_picked']);
}

class ArticleDetail {
  ArticleDetail(
      {required this.totalArticle,
      required this.picklist,
      required this.totalQty,
      required this.duration,
      required this.statusPicked,
      required this.articles,
      required this.totalPicked});

  int totalArticle;
  int totalPicked;
  bool statusPicked;
  String picklist;
  int totalQty;
  String duration;
  List<Article> articles;

  factory ArticleDetail.fromJson(Map<String, dynamic> json) {
    if (json['data'].length > 0) {
      var data = json['data'];
      var article = data['articles'] as List;

      List<Article> _article = article.map((e) => Article.formJson(e)).toList();

      return ArticleDetail(
          picklist: data['picklist'],
          statusPicked: data['status_pick'],
          totalPicked: data['total_picked'],
          totalArticle: data['total_article'],
          totalQty: data['total_qty'],
          duration: data['duration'],
          articles: _article);
    } else {
      return ArticleDetail(
          picklist: 'not found',
          statusPicked: false,
          totalPicked: 0,
          totalArticle: 0,
          totalQty: 0,
          duration: '0',
          articles: []);
    }
  }
}
