import 'package:cloud_firestore/cloud_firestore.dart';

class Opportiunity {
  String? content;
  String? date;
  String? title;
  String? doc;
  String? sponsor;

  Opportiunity(
      {required this.doc,
      required this.date,
      required this.content,
      required this.sponsor,
      this.title});

  Opportiunity.fromJson(QueryDocumentSnapshot<Object?> json) {
    content = json['content'];
    date = json['date'];
    title = json['title'];
    doc = json['doc'];
    sponsor = json['sponsor'];
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'date': date,
      'title': title,
      'doc': doc,
      'sponsor': sponsor
    };
  }
}
