import 'package:flutter_news_app_clean_architecture_example/core/resources/data_state.dart';
import 'package:flutter_news_app_clean_architecture_example/features/daily_news/domain/entities/article_entity.dart';

abstract class ArticleRepository {
  // API methods
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  // Database methods
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> removeArticle(ArticleEntity article);
}
