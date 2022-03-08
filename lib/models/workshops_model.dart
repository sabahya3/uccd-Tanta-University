import 'package:cloud_firestore/cloud_firestore.dart';

class WorkShops {
  String? url;
  String? date;
  String? title;
  String? doc;
  String? time;

  WorkShops(
      {required this.time,
      required this.doc,
      required this.date,
      required this.url,
      this.title});

  WorkShops.fromJson(QueryDocumentSnapshot<Object?> json) {
    url = json['url'];
    date = json['date'];
    title = json['title'];
    doc = json['doc'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    return {'url': url, 'date': date, 'title': title, 'doc': doc, 'time': time};
  }
}
