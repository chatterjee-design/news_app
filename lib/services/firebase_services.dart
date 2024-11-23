// lib/services/news_service.dart

import 'package:assignment/models/articles_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<NewsArticle>> getAllNews() async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('news')
          .orderBy('timestamp', descending: true)
          .get();

      List<NewsArticle> articles = querySnapshot.docs.map((doc) {
        return NewsArticle.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();
      return articles;
    } catch (e) {
      print('Error fetching news: $e');
      return [];
    }
  }}

final newsServiceProvider = Provider<NewsService>((ref) {
  return NewsService();
});
