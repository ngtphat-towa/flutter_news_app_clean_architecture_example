import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app_clean_architecture_example/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_news_app_clean_architecture_example/features/daily_news/presentation/widgets/article_tile.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _buildBody(),
    );
  }

  BlocBuilder<RemoteArticlesBloc, RemoteArticlesState> _buildBody() {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticlesState>(
      builder: (_, state) {
        if (state is RemoteArticlesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteArticlesDone) {
          return ListView.separated(
            itemCount: state.articles!.length,
            itemBuilder: (__, index) {
              return ArticleWidget(article: state.articles![index]);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
          );
        }
        return const SizedBox();
      },
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text(
        "Daily News",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
