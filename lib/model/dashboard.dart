import 'dart:ffi';

class Finished {
  Finished(
      {required this.picklistTotal,
      required this.articleTotal,
      required this.qtyTotal});
  int picklistTotal;
  int articleTotal;
  int qtyTotal;

  factory Finished.fromJson(Map<String, dynamic> json) => Finished(
      picklistTotal: json['picklist_total'],
      articleTotal: json['article_total'],
      qtyTotal: json['qty_total']);
}

class Queue {
  Queue(
      {required this.picklistTotal,
      required this.articleTotal,
      required this.qtyTotal});
  int picklistTotal;
  int articleTotal;
  int qtyTotal;

  factory Queue.fromJson(Map<String, dynamic> json) => Queue(
      picklistTotal: json['picklist_total'],
      articleTotal: json['article_total'],
      qtyTotal: json['qty_total']);
}

class Dashboard {
  Dashboard(
      {required this.picklist,
      required this.started,
      required this.totalArticle,
      required this.totalQty,
      required this.qty,
      required this.artic,
      required this.duration,
      required this.finished,
      required this.queue});

  String picklist;
  String started;
  String totalArticle;
  String totalQty;
  int qty;
  int artic;
  String duration;
  Finished finished;
  Queue queue;

  factory Dashboard.fromJson(Map<String, dynamic> json) {
    return Dashboard(
        picklist: json['picklist'],
        started: json['started'],
        totalArticle: json['total_article'],
        totalQty: json['total_qty'],
        qty : json['qty'],
        artic: json['article'],
        duration: json['duration'],
        finished: Finished.fromJson(json["fineshed"]),
        queue: Queue.fromJson(json["queue"]));
  }
}
