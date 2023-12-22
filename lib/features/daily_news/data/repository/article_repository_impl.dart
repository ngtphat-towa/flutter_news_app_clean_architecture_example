import 'dart:io';

import 'package:dio/dio.dart';

import 'package:flutter_news_app_clean_architecture_example/core/constants/constants.dart';
import 'package:flutter_news_app_clean_architecture_example/core/resources/data_state.dart';
import 'package:flutter_news_app_clean_architecture_example/features/daily_news/data/datasources/news_api_service.dart';
import 'package:flutter_news_app_clean_architecture_example/features/daily_news/data/models/article.dart';
import 'package:flutter_news_app_clean_architecture_example/features/daily_news/domain/entities/article.dart';
import 'package:flutter_news_app_clean_architecture_example/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException.badResponse(
          statusCode: httpResponse.response.statusCode ?? HttpStatus.badRequest,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleModel>> getSavedArticles() {
    // TODO: implement getSavedArticles
    throw UnimplementedError();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    // TODO: implement removeArticle
    throw UnimplementedError();
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    // TODO: implement saveArticle
    throw UnimplementedError();
  }
}