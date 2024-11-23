import 'package:cloud_firestore/cloud_firestore.dart';

class NewsArticle {
  final String title;
  final String description;
  final String imageUrl;
  final String timestamp;

  NewsArticle({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.timestamp,
  });

  factory NewsArticle.fromFirestore(Map<String, dynamic> doc) {
    return NewsArticle(
      title: doc['title'] ?? '',
      description: doc['description'] ?? '',
      imageUrl: doc['imageUrl'] ?? '',
      timestamp: doc['timestamp'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'timestamp': timestamp,
    };
  }

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      timestamp: json['timestamp'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'timestamp': timestamp,
    };
  }
}
