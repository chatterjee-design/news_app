import 'package:assignment/Screens/news_details_page.dart';
import 'package:assignment/Ui_elements/app_bar.dart';
import 'package:assignment/Ui_elements/news_card.dart';
import 'package:assignment/provider/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsArticlesAsyncValue = ref.watch(newsArticlesProvider);

    return Scaffold(
      appBar: CustomAppBar(
        backButton: false,
        title: 'News Feed App',
      ),
      body: newsArticlesAsyncValue.when(
        data: (articles) {
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetails(
                        title: article.title,
                        description: article.description,
                        timestamp: article.timestamp,
                        imageUrl: article.imageUrl,
                      ),
                    ),
                  );

                },
                child: NewsCard(
                  title: article.title,
                  description: article.description,
                  timestamp: article.timestamp,
                  imageUrl: article.imageUrl,
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
