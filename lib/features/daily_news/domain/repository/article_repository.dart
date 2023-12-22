
import 'package:flutter_news_app_clean_architecture_example/core/core.dart';
import 'package:flutter_news_app_clean_architecture_example/features/features.dart';

abstract class ArticleRepository {
  // API methods
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  // Database methods
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> removeArticle(ArticleEntity article);
}
