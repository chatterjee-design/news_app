
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:assignment/models/articles_model.dart';

class SharedPreferencesHelper {
  static const String cachedNewsArticlesKey = 'cachedNewsArticles';

  static Future<void> saveArticles(List<NewsArticle> articles) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonArticles = articles.map((article) => json.encode(article.toJson())).toList();
    await prefs.setStringList(cachedNewsArticlesKey, jsonArticles);
  }


  static Future<List<NewsArticle>?> loadArticles() async {
    final prefs = await SharedPreferences.getInstance();


    final List<String>? jsonArticles = prefs.getStringList(cachedNewsArticlesKey);
    if (jsonArticles != null) {
      return jsonArticles.map((jsonArticle) {
        final Map<String, dynamic> articleMap = json.decode(jsonArticle);
        return NewsArticle.fromJson(articleMap);
      }).toList();
    }
    final String? jsonString = prefs.getString(cachedNewsArticlesKey);
    if (jsonString != null) {
      final List<dynamic> articlesList = json.decode(jsonString);
      return articlesList.map((articleMap) {

        return NewsArticle.fromJson(articleMap as Map<String, dynamic>);
      }).toList();
    }

    return null;
  }

  static Future<bool> hasCachedArticles() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(cachedNewsArticlesKey);
  }

}
