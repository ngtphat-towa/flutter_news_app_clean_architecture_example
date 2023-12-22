
import 'package:flutter_news_app_clean_architecture_example/core/core.dart';
import 'package:flutter_news_app_clean_architecture_example/features/features.dart';

class SaveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  SaveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.saveArticle(params!);
  }
}
