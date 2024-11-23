import 'package:assignment/models/articles_model.dart';
import 'package:assignment/services/firebase_services.dart';
import 'package:assignment/utils/shared_pref.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsArticlesProvider = FutureProvider<List<NewsArticle>>((ref) async {
  final newsService = ref.watch(newsServiceProvider);


  final hasCachedArticles = await SharedPreferencesHelper.hasCachedArticles();

  if (hasCachedArticles == true) {
    final cachedArticles = await SharedPreferencesHelper.loadArticles();
    if (cachedArticles != null && cachedArticles.isNotEmpty) {
      return cachedArticles;
    } else {
      final liveData = await newsService.getAllNews();

      await SharedPreferencesHelper.saveArticles(liveData);
      return liveData;
    }
  }else{
    final liveData = await newsService.getAllNews();

    await SharedPreferencesHelper.saveArticles(liveData);
    return liveData;
  }


});
